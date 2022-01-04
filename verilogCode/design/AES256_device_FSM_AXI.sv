
/**************************************    TO DO    ************************************

1) Decide whether the encrypter and decrypter shall have a start signal or retain the input
in the device until the romKey is full. 
2) Think about creating a paralel state machine that manages the inputs 

3) Create 2 fifos: one to store the keys and another one to store the data (both for encrypting and decrypting)

****************************************************************************************/

`define FIFO_SZ      10 

module AES256_device(
                        clk, resetn, 
                        inp_device, ctrl_dataIn, mod_en, 
                        outp_device, ctrl_dataOut
                    );

    // --------- PORTS  -----------
    input clk, resetn;
    input [1:0] mod_en;
    input ctrl_dataIn;
    input [127:0] inp_device;

    output reg ctrl_dataOut;
    output reg [127:0] outp_device;
    
    // --------- FSM control --------
    
    reg [2:0] dev_st;
    reg [2:0] dev_st_next;
    
    localparam N = 16;

    localparam [1:0]
                    encryption_mode = 2'b00,
                    decryption_mode = 2'b01,
                    keygen_mode = 2'b10;

    localparam [2:0]
                    idle_st = 3'b000,
                    enc_st = 3'b001,
                    dec_st = 3'b010,
                    keygen_st = 3'b011,
                    rom_st = 3'b100,
                    chs_mod_st = 3'b101,
                    
                    end_st = 3'b111;
                    
    // -------- Other control regs ------
    
    reg [3:0] rom_cnt;
    //reg keygen_done;
    reg [1:0] seed_cnt;
    reg [3:0] mod_cnt;
    reg mod_decrease, mod_decrease_delay;
    reg mod_fifo_full;
    reg rom_dataStored;
    reg end_st_reg;

    reg [127:0] seed_reg;
    reg [`FIFO_SZ-1:0][127:0] data_fifo;
    reg [`FIFO_SZ-1:0][1:0] mod_fifo;
    // reg [`FIFO_SZ-1:0][1:0] mod_fifo;
    // reg [`FIFO_SZ-1:0][127:0] data_fifo;

    //---------- Inter module comp ------

    reg [127:0] key;
    reg [3:0] keyAddr;
    reg ctrl_keyAddr;

    //---------- Encrypter -----------
    
    reg ctrl_dataIn_enc;
    wire ctrl_dataOut_enc;
    

    reg [127:0] enc_dataIn;
    //wire [127:0] enc_key;
    reg [127:0] enc_dataOut;
    wire [3:0] enc_keyAddr;

    reg enc_avail;

    //---------- Decrypter -----------

    reg ctrl_dataIn_dec;
    reg ctrl_dataOut_dec;

    reg [127:0] dec_dataIn;
    //wire [127:0] dec_key;
    reg [127:0] dec_dataOut;
    wire [3:0] dec_keyAddr;

    reg dec_avail;

    //-------- Key Generator ---------

    reg ctrl_dataIn_kg;
    reg ctrl_dataOut_kg;

    reg [127:0] kg_dataIn;
    wire [127:0] kg_dataOut;

    //-------- ROM ----------

    reg [127:0] inp_romKey;
    //reg [127:0] outp_romKey;
    //reg [3:0] addr_romKey;
    reg wr_en_rom;

    integer index;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            //ctrl_dataIn_enc <= 1'b0; ctrl_dataIn_dec <= 1'b0; ctrl_dataIn_kg <= 1'b0;     

            seed_reg <= 0;
            //data_fifo <= 0;
            ctrl_dataOut <= 0;

            outp_device <= 0;
            
        end

        else
            begin
                if(ctrl_dataIn)
                begin

                    if(mod_en == 2'b10)
                        seed_reg <= inp_device;
                    /*
                    if(mod_en == 2'b00 || mod_en == 2'b01)
                    begin
                        data_fifo <= inp_device;
                    end
                    */
                end

                ctrl_dataOut <= end_st_reg;                                                         // We let the other devices know that encryption has ended
    
                if(end_st_reg)
                begin
                    
                    if(ctrl_dataOut_enc)
                        outp_device <= enc_dataOut;

                    else if(ctrl_dataOut_dec)
                        outp_device <= dec_dataOut;
    
                    //mux_chgInp <= 1'b1;
                    //round <= 0;
    
                end
                else
                    ctrl_dataOut <= 1'b0;
        end 
    end
    
    /*=========================================
            Controlling current state
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            dev_st <= idle_st;
        end
        
        else
        begin
            dev_st <= dev_st_next;
        end
    end

    /*=========================================
            Choose mode state (chs_mod_st)
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            seed_cnt <= 0;
            mod_decrease <= 1'b0;
            ctrl_dataIn_kg <= 1'b0;
        end

        else
        begin
            if(dev_st == chs_mod_st)
            begin
                case(mod_fifo[0])
                    encryption_mode:
                        begin

                            if(rom_dataStored)
                            begin
                                //mod_decrease <= 1'b1;

                                //ctrl_dataIn_enc <= 1'b1;          OLD CHANGED
                                //enc_dataIn <= data_fifo;
                                ctrl_keyAddr <= 1'b0;
                            end

                            if(enc_avail)
                            begin
                                enc_dataIn <= data_fifo[0];
                                mod_decrease <= 1'b1;

                                enc_avail <= 1'b0;
                            end
                        end
                    decryption_mode:
                        begin
 
                            if(rom_dataStored)
                            begin
                                //mod_decrease <= 1'b1;

                                //ctrl_dataIn_dec <= 1'b1;
                                //dec_dataIn <= data_fifo;
                                ctrl_keyAddr <= 1'b1;
                            end

                            if(dec_avail)
                            begin
                                dec_dataIn <= data_fifo[0];
                                mod_decrease <= 1'b1;

                                dec_avail <= 1'b0;
                            end
                        end
                    keygen_mode:
                        begin

                            if(seed_cnt < 2)
                            begin
                                //$display("Seed_cnt value %d at time %d", seed_cnt, $time);
                                /*
                                if(seed_cnt == 1)
                                begin
                                    dev_st_next <= keygen_st;
                                    $display("Device state next now %d", dev_st_next);
                                    $display("Keygen_st now %d", keygen_st);
                                    $display("Time: ", $time);
                                end
                                */

                                ctrl_dataIn_kg <= 1'b1;
                                kg_dataIn <= seed_reg;
                                seed_cnt <= seed_cnt + 1;
                                mod_decrease <= 1'b1;
                            end
                        end
                endcase
            end

            if (ctrl_dataOut_enc || ctrl_dataIn_dec)
            begin
                seed_cnt <= 0;
            end

            if(!ctrl_dataIn && mod_decrease_delay)
                mod_decrease <= 1'b0;
            
            if(!enc_avail || !dec_avail)
                mod_decrease <= 1'b0;

        end
    end

    /*=========================================
            Encryption state control (enc_st)
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            ctrl_dataIn_enc <= 1'b0;
            enc_avail <= 1'b1;
        end
        
        else
        begin
            if(dev_st == chs_mod_st)
            begin
                if(mod_fifo[0] == encryption_mode && rom_dataStored)
                begin
                    ctrl_dataIn_enc <= 1'b1;
                end
            end

            if(dev_st == enc_st)
            begin
                //if(ctrl_dataOut_kg)
                //begin
                    ctrl_dataIn_enc <= 1'b0;
                //end
            end

            if(ctrl_dataOut_enc)
                enc_avail <= 1'b1;
        end
    end
    
    /*=========================================
            Decryption state control (dec_st)
    ===========================================*/
    
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            ctrl_dataIn_dec <= 1'b0;
            dec_avail <= 1'b1;
        end
        
        else
        begin
            if(dev_st == chs_mod_st)
            begin
                if(mod_fifo[0] == decryption_mode && rom_dataStored)
                    ctrl_dataIn_dec <= 1'b1;
            end

            if(dev_st == dec_st)
            begin
                if(ctrl_dataOut_kg)
                begin
                    ctrl_dataIn_dec <= 1'b1;
                end
            end

            if(ctrl_dataOut_dec)
                dec_avail <= 1'b1;
        end
    end
    
    
    /*=========================================
            KeyGen state control (keygen_st)
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            //keygen_done <= 1'b0;
            //seed_cnt <= 0;
        end
        
        else
        begin
            /*
            if(seed_cnt == 2)
            begin
                keygen_done <= 1'b1;
            end
            */

            /*
            if (ctrl_dataOut_enc || ctrl_dataIn_dec)
            begin
                //keygen_done <= 1'b0;
                seed_cnt <= 0;
            end
            */
        end
    end

    /*=========================================
            ROM state control (rom_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            rom_cnt <= 0;
            rom_dataStored <= 1'b0;
        end

        else
        begin
            if(dev_st == keygen_st || dev_st == rom_st)
            begin
                if(ctrl_dataOut_kg)
                begin
                    //wr_en_rom <= 1'b1;
                    rom_cnt <= rom_cnt + 1;
                end
            end

            else
            begin
                rom_cnt <= 0;
                //wr_en_rom <= 1'b0;
            end

            if(dev_st == rom_st)
                 if(rom_cnt == N-1)
                    rom_dataStored <= 1'b1;

        end
    end
    
    /*=========================================
            End state control (end_st)
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            end_st_reg <= 1'b0;
        end
        
        else
        begin
            if(dev_st == end_st)
                end_st_reg <= 1'b1;
        end
    end
    
    /*=========================================
            FSM (Finite State Machine)
    ===========================================*/

    always @(ctrl_dataIn, dev_st, mod_fifo, rom_dataStored, seed_cnt, rom_cnt, ctrl_dataOut_enc, ctrl_dataOut_dec, ctrl_dataOut_kg)
    begin
        dev_st_next <= dev_st;
        
        case(dev_st)
            idle_st:
                begin
                    if(ctrl_dataIn)
                    begin
                        dev_st_next <= chs_mod_st;
                    end
                    /*
                    else if(ctrl_dataOut_kg)
                        dev_st_next <= keygen_st;
                    */
                end
            chs_mod_st:
            begin
                case(mod_fifo[0])
                    encryption_mode:
                        begin
                            if(rom_dataStored)
                            begin
                                dev_st_next <= enc_st;
                            end
                            else
                            begin

                                dev_st_next <= chs_mod_st;
                            end
                        end
                    decryption_mode:
                        begin
                            if(rom_dataStored)
                            begin
                                dev_st_next <= dec_st;
                            end
                            else
                            begin

                                dev_st_next <= chs_mod_st;
                            end
                        end
                    keygen_mode:
                        begin
                            if(seed_cnt <= 2)
                            begin
                                if(seed_cnt == 2)
                                begin
                                    dev_st_next <= keygen_st;
                                end
                                /*
                                ctrl_dataIn_kg <= 1'b1;
                                kg_dataIn <= seed_reg;
                                seed_cnt <= seed_cnt + 1;
                                mod_decrease <= 1'b1;
                                */
                            end
                            else
                                dev_st_next <= chs_mod_st;
                        end
                endcase
            end
            enc_st:
                begin
                    //ctrl_dataIn_enc <= 1'b0;

                    if (ctrl_dataOut_enc)
                    begin
                        if(mod_fifo[0] == 2'b11)
                            dev_st_next <= end_st;
                        else
                            dev_st_next <= chs_mod_st;
                    end
                    else
                        dev_st_next <= enc_st;
                end
            dec_st:
                begin
                    //ctrl_dataIn_dec <= 1'b0;

                    if (ctrl_dataOut_dec)
                    begin
                        if(mod_fifo[0] == 2'b11)
                            dev_st_next <= end_st;
                        else
                            dev_st_next <= chs_mod_st;
                    end
                                           
                    else
                        dev_st_next <= dev_st;
                end
            keygen_st:
                begin
                    //ctrl_dataIn_kg <= 1'b0;

                    if (ctrl_dataOut_kg)
                        dev_st_next <= rom_st;                                              // If more than one block wants to be encrypted, we go to idle_st and create a reg indicating the last block of the data to be encrypted
                    else
                        dev_st_next <= keygen_st;                                           // CAREFUL !!!!!!!!!!!            
                end
            rom_st:
                begin
                    if(rom_cnt == N-1)
                    begin
                        dev_st_next <= chs_mod_st;
                        //rom_dataStored <= 1'b1;
                    end
                end
            /*
            next_st:
                begin
                    dev_st_next <= chs_mod_st;
                end
            */
        endcase
    end

    AES256_enc encrypter(  
                        .clk(clk), .resetn(resetn),
                        .enc_dataIn(enc_dataIn), .ctrl_dataIn_enc(ctrl_dataIn_enc), .enc_key(key),                     //.enc_key(enc_key), 
                        .enc_dataOut(enc_dataOut), .ctrl_dataOut_enc(ctrl_dataOut_enc), .enc_keyAddr(enc_keyAddr)              //.enc_keyAddr(enc_keyAddr)
                        );

    AES256_dec decrypter(
                        .clk(clk), .resetn(resetn),
                        .dec_dataIn(dec_dataIn), .ctrl_dataIn_dec(ctrl_dataIn_dec), .dec_key(key),                     //.dec_key(dec_key),
                        .dec_dataOut(dec_dataOut), .ctrl_dataOut_dec(ctrl_dataOut_dec), .dec_keyAddr(dec_keyAddr)              //.dec_keyAddr(dec_keyAddr)
                        );
    
    AES256_keygen keygen(
                        .clk(clk), .resetn(resetn),
                        .kg_dataIn(kg_dataIn), .ctrl_dataIn_kg(ctrl_dataIn_kg),
                        .kg_dataOut(kg_dataOut), .ctrl_dataOut_kg(ctrl_dataOut_kg)
                        );

    assign keyAddr = (ctrl_keyAddr == 0) ? enc_keyAddr:dec_keyAddr;
    
    mod_romKey romKey(
                        .clk(clk), .resetn(resetn),
                        .inp_romKey(kg_dataOut), .addr_romKey(keyAddr), .wrEn_romKey(ctrl_dataOut_kg), //.wrEn_romKey(wr_en_rom),
                        .outp_romKey(key)
                    );
    
    // --------------------- FIFO MOD_EN --------------------- //

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            mod_cnt <= 0;
            mod_fifo_full <= 0;                                                         // DE MOMENTO NO SE USA!!!
            data_fifo <= 0;
            //mod_decrease <= 1'b0;

            for(index=0; index < `FIFO_SZ; index=index+1)
                mod_fifo[index] <= 3;
        end

        else
        begin
        
            mod_decrease_delay <= mod_decrease;
            
            if(ctrl_dataIn)
            begin
                if(mod_cnt == `FIFO_SZ)
                begin
                    mod_fifo_full <= 1'b0;
                    // HOW TO TREAT WHEN FIFO IS FULL
                end

                else
                begin
                    mod_fifo[mod_cnt] <= mod_en;

                    if(mod_en == 2'b00 || mod_en == 2'b01)
                        data_fifo[mod_cnt] <= inp_device;

                    mod_cnt <= mod_cnt + 1;
                end
            end 

            else if(mod_decrease_delay)
            begin
                for(index = 0; index < `FIFO_SZ-1; index=index+1)
                begin
                    mod_fifo[index] <= mod_fifo[index+1];
                    data_fifo[index] <= data_fifo[index+1];
                end

                mod_cnt <= mod_cnt - 1;          
                //mod_decrease <= 1'b0;   
                mod_fifo_full <= 1'b0;                                                  // DE MOMENTO NO SE USA!!!                              
            end
        end
    end
    

endmodule