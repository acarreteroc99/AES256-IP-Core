/**************************************    TO DO    ************************************
1) A register might have to be created to not lose the value received from mod_en.
****************************************************************************************/

`define FIFO_SZ      10 

module AES256_device(
                        clk, resetn, 
                        inp_device, seed, ctrl_dataIn, mod_en, 
                        enc_fin, dec_fin, kg_fin,
                        outp_device, mod_decrease
                    );

    // --------- PORTS  -----------
    input clk, resetn;
    input [1:0] mod_en;                                 
    input [31:0] ctrl_dataIn;
    input [127:0] inp_device;
    input [255:0] seed;

    output reg enc_fin, dec_fin, kg_fin; 

    output reg mod_decrease;
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
    reg [1:0] seed_cnt;

    reg rom_dataStored;
    reg end_st_reg;

    //---------- Inter module comp ------

    reg [127:0] key;
    reg [3:0] keyAddr;
    reg ctrl_keyAddr;

    //---------- Encrypter -----------
    
    reg ctrl_dataIn_enc;
    reg ctrl_dataOut_enc;
    

    reg [127:0] enc_dataIn;
    reg [127:0] enc_dataOut;
    wire [3:0] enc_keyAddr;
    reg [31:0] ctrl_dataInR;
    reg enc_avail;

    //---------- Decrypter -----------

    reg ctrl_dataIn_dec;
    reg ctrl_dataOut_dec;

    reg [127:0] dec_dataIn;
    reg [127:0] dec_dataOut;
    wire [3:0] dec_keyAddr;

    reg dec_avail;

    //-------- Key Generator ---------

    reg ctrl_dataIn_kg;
    reg ctrl_dataOut_kg;
    reg [255:0] kg_dataIn;
    wire [127:0] kg_dataOut;

    //-------- ROM ----------

    reg [127:0] inp_romKey;
    reg wr_en_rom;

    integer index;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            outp_device <= 0;
        end

        else
            begin
                if(enc_fin)
                    outp_device <= enc_dataOut;

                else if(dec_fin)
                    outp_device <= dec_dataOut;
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
            mod_decrease <= 1'b0;
	        ctrl_dataInR <= 32'h00000000;
        end

	    else
        begin
            ctrl_dataInR <= ctrl_dataIn;

            if((ctrl_dataIn[0] && !ctrl_dataInR[0]) || (ctrl_dataIn[1] && !ctrl_dataInR[1]))
                mod_decrease <= 1'b1;
            else
                mod_decrease <= 1'b0;
        end
   end 



   
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            seed_cnt <= 0;
            ctrl_dataIn_kg <= 1'b0;
        end

        else
        begin
            if(dev_st == chs_mod_st)
            begin
                case(mod_en)
                    encryption_mode:
                        begin

                            if(rom_dataStored)
                            begin
                                ctrl_keyAddr <= 1'b0;
                            end

                            if(enc_avail)
                            begin
                                enc_dataIn <= inp_device;   //data_fifo[0];
                            end
                        end
                    decryption_mode:
                        begin
 
                            if(rom_dataStored)
                            begin
                                ctrl_keyAddr <= 1'b1;
                            end

                            if(dec_avail)
                            begin
                                dec_dataIn <= inp_device;   //data_fifo[0];
                            end
                        end
                    keygen_mode:
                        begin

                                ctrl_dataIn_kg <= 1'b1;
                                kg_dataIn <= seed;                                              //Debe ser inp_device;
                                seed_cnt <= seed_cnt + 1;
                            end
                endcase
            end

            if (ctrl_dataIn_enc || ctrl_dataIn_dec)
            begin
                seed_cnt <= 0;
            end
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
                if(mod_en == encryption_mode && rom_dataStored)
                begin
                    ctrl_dataIn_enc <= 1'b1;
                end
            end

            if(dev_st == enc_st)
            begin
                    ctrl_dataIn_enc <= 1'b0;
            end

            if(dev_st == chs_mod_st)
                if(mod_en == encryption_mode)
                    if(enc_avail)
                        enc_avail <= 1'b0;

            if(enc_fin)
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
                if(mod_en == decryption_mode && rom_dataStored)
                begin
                    ctrl_dataIn_dec <= 1'b1;
                end
            end

            if(dev_st == dec_st)
            begin
                    ctrl_dataIn_dec <= 1'b0;
            end

            if(dev_st == chs_mod_st)
                if(mod_en == decryption_mode)
                    if(dec_avail)
                        dec_avail <= !dec_avail;

            if(dec_fin)
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
                if(kg_fin)
                begin
                    rom_cnt <= rom_cnt + 1;
                end
            end

            else
            begin
                rom_cnt <= 0;
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
            begin
                end_st_reg <= 1'b1;
            end
        end
    end
    
    /*=========================================
            FSM (Finite State Machine)
    ===========================================*/

    always @(ctrl_dataIn, dev_st, mod_en, rom_dataStored, seed_cnt, rom_cnt, enc_fin, dec_fin, kg_fin)
        dev_st_next <= dev_st;
        
        case(dev_st)
            idle_st:
                begin
                    if(ctrl_dataIn)
                    begin
                        dev_st_next <= chs_mod_st;
                    end
                end
            chs_mod_st:
            begin
                case(mod_en)
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
				dev_st_next <= keygen_st;
                        end
                endcase
            end
            enc_st:
                begin
                    if(enc_fin)
                    begin
                        if(mod_en == 2'b11)
                            dev_st_next <= end_st;
                        else
                            dev_st_next <= chs_mod_st;
                    end
                    else
                        dev_st_next <= enc_st;
                end
            dec_st:
                begin
                    if(dec_fin)
                    begin
                        if(mod_en == 2'b11)
                            dev_st_next <= end_st;
                        else
                            dev_st_next <= chs_mod_st;
                    end
                                           
                    else
                        dev_st_next <= dec_st;
                end
            keygen_st:
                begin
                   if(kg_fin)
                        dev_st_next <= rom_st;                                              // If more than one block wants to be encrypted, we go to idle_st and create a reg indicating the last block of the data to be encrypted
                    else
                        dev_st_next <= keygen_st;                                           // CAREFUL !!!!!!!!!!!            
                end
            rom_st:
                begin
                    if(rom_cnt == N-1)
                    begin
                        dev_st_next <= chs_mod_st;
                    end
                end
            end_st:
            begin
                dev_st_next <= idle_st;
            end
        endcase
    end

    AES256_enc encrypter(  
                        .clk(clk), .resetn(resetn),
                        .enc_dataIn(inp_device), .ctrl_dataIn_enc(ctrl_dataInR[0]), .enc_key(key),                     
                        .enc_dataOut(enc_dataOut), .ctrl_dataOut_enc(enc_fin), .enc_keyAddr(enc_keyAddr)        //.ctrl_dataOut_enc(ctrl_dataOut_enc),           
                        );

    AES256_dec decrypter(
                        .clk(clk), .resetn(resetn),
                        .dec_dataIn(inp_device), .ctrl_dataIn_dec(ctrl_dataInR[1]), .dec_key(key),                    
                        .dec_dataOut(dec_dataOut), .ctrl_dataOut_dec(dec_fin), .dec_keyAddr(dec_keyAddr)        //.ctrl_dataOut_dec(ctrl_dataOut_dec)
                        );
    
    AES256_keygen keygen(
                        .clk(clk), .resetn(resetn),
                        .kg_dataIn(seed), .ctrl_dataIn_kg(ctrl_dataIn[2]),
                        .kg_dataOut(kg_dataOut), .ctrl_dataOut_kg(kg_fin)                                       //.ctrl_dataOut_kg(ctrl_dataOut_kg)
                        );

    assign keyAddr = (ctrl_dataIn[0]) ? enc_keyAddr:dec_keyAddr;
    
    mod_romKey romKey(
                        .clk(clk), .resetn(resetn),
                        .inp_romKey(kg_dataOut), .addr_romKey(keyAddr), .wrEn_romKey(kg_fin),                   //.wrEn_romKey(ctrl_dataOut_kg),
                        .outp_romKey(key)
                    );
    

endmodule