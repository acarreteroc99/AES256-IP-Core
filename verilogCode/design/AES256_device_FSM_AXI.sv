
/**************************************    TO DO    ************************************

1) Keygen shall store the keys in a ROM in order for the encrypter or decrypter to select
them and encrypt/decrypt the data. 
2) Adapt encrypter and decrypter to select the key 

****************************************************************************************/

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
    
    reg [2:0] dev_st, dev_st_next;
    
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
    reg end_st_reg;

    reg [127:0] auxData;

    //---------- Encrypter -----------
    
    reg ctrl_dataIn_enc;
    wire ctrl_dataOut_enc;
    

    reg [127:0] enc_dataIn;
    wire [127:0] enc_key;
    reg [127:0] enc_dataOut;
    reg enc_start;

    //---------- Decrypter -----------

    reg ctrl_dataIn_dec;
    reg ctrl_dataOut_dec;

    reg [127:0] dec_dataIn;
    wire [127:0] dec_key;
    wire [127:0] dec_dataOut;

    //-------- Key Generator ---------

    reg ctrl_dataIn_kg;
    reg ctrl_dataOut_kg;

    reg [127:0] kg_dataIn;
    wire [127:0] kg_dataOut;

    //-------- ROM ----------

    reg [127:0] inp_romKey;
    reg [127:0] outp_romKey;
    reg [3:0] addr_romKey;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            ctrl_dataIn_enc <= 1'b0; ctrl_dataIn_dec <= 1'b0; ctrl_dataIn_kg <= 1'b0;
            //ctrl_dataOut_enc <= 1'b0; ctrl_dataOut_dec <= 1'b0; ctrl_dataOut_kg <= 1'b0;
        end

        else
            begin
                if(ctrl_dataIn)
                begin
                     auxData <= inp_device;
                end
    

                ctrl_dataOut <= end_st_reg;                                                         // We let the other devices know that encryption has ended
    
                if(end_st_reg)
                begin
                    
                    outp_device <= auxData;
    
                    //mux_chgInp <= 1'b1;
                    //round <= 0;
    
                end
                else
                    ctrl_dataOut <= 1'b0;
        end 
    end
    
    /*=========================================
        Controlling current state (kg_st)
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
            Encryption state control (enc_st)
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
        
        end
        
        else
        begin
            if(dev_st == enc_st)
            begin
                if(ctrl_dataOut_kg)
                begin
                    enc_start <= 1'b1;
                end
            end
        end
    end
    
    /*=========================================
            Decryption state control (dec_st)
    ===========================================*/
    
    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
        
        end
        
        else
        begin
            if(dev_st == dec_st)
            begin
                if(ctrl_dataOut_kg)
                begin
                    enc_start <= 1'b1;
                end
            end
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
            seed_cnt <= 0;
        end
        
        else
        begin
            /*
            if(seed_cnt == 2)
            begin
                keygen_done <= 1'b1;
            end
            */

            if (ctrl_dataOut_enc || ctrl_dataIn_dec)
            begin
                //keygen_done <= 1'b0;
                seed_cnt <= 0;
            end
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
        end

        else
        begin
            if(kg_st == rom_st)
            begin
                if(ctrl_dataOut_kg)
                begin
                    
                    rom_cnt <= rom_cnt + 1;
                end
            end

            else
            begin
                rom_cnt <= 0;
            end
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
            if(keygen_st == end_st)
                end_st_reg <= 1'b1;
        end
    end
    
    /*=========================================
            FSM (Finite State Machine)
    ===========================================*/

    always @(ctrl_dataIn, mod_en, dev_st, dev_st_next, ctrl_dataOut_enc, ctrl_dataOut_dec, ctrl_dataOut_kg, seed_cnt, rom_cnt)
    begin
        dev_st_next <= dev_st;
        
        case(dev_st)
            idle_st:
                begin
                    if(ctrl_dataIn)
                        dev_st_next <= chs_mod_st;
                end
            chs_mod_st:
            begin
                case(mod_en)
                    encryption_mode:
                        begin
                            ctrl_dataIn_enc <= 1'b1;
                            enc_dataIn <= auxData;
                            
                            if(ctrl_dataOut_kg)
                                dev_st_next <= enc_st;
                            else
                                dev_st_next <= idle_st;
                        end
                    decryption_mode:
                        begin
                            ctrl_dataIn_dec <= 1'b1;
                            dec_dataIn <= auxData;
                            
                            if(ctrl_dataOut_kg)
                                dev_st_next <= dec_st;
                            else
                                dev_st_next <= idle_st;
                        end
                    keygen_mode:
                        begin
                            if(seed_cnt <= 1)
                            begin
                                ctrl_dataIn_kg <= 1'b1;
                                kg_dataIn <= auxData;
                                seed_cnt <= seed_cnt + 1;
                            end
                            
                            if(ctrl_dataOut_kg)
                                dev_st_next <= keygen_st;
                            else
                                dev_st_next <= idle_st;
                        end
                endcase
            end
            enc_st:
                begin
                    if (ctrl_dataOut_enc)
                        dev_st_next <= end_st;                                              // If more than one block wants to be encrypted, we go to idle_st and create a reg indicating the last block of the data to be encrypted
                    else
                        dev_st_next <= enc_st;
                end
            dec_st:
                begin
                    if (ctrl_dataOut_dec)
                        dev_st_next <= end_st;                                              // If more than one block wants to be encrypted, we go to idle_st and create a reg indicating the last block of the data to be encrypted
                    else
                        dev_st_next <= dev_st;
                end
            keygen_st:
                begin
                    if (ctrl_dataOut_kg)
                        dev_st_next <= rom_st;                                              // If more than one block wants to be encrypted, we go to idle_st and create a reg indicating the last block of the data to be encrypted
                    else
                        dev_st_next <= keygen_st;                                           // CAREFUL !!!!!!!!!!!            
                end
            rom_st:
                begin
                    if(rom_cnt == N-1)
                        dev_st_next <= chs_mod_st;
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
                        .enc_dataIn(enc_dataIn), .enc_key(enc_key), .ctrl_dataIn_enc(ctrl_dataIn_enc), 
                        .enc_dataOut(enc_dataOut), .ctrl_dataOut_enc(ctrl_dataOut_enc) 
                        );

    AES256_dec decrypter(
                        .clk(clk), .resetn(resetn),
                        .dec_dataIn(dec_dataIn), .dec_key(dec_key), .ctrl_dataIn_dec(ctrl_dataIn_dec), 
                        .dec_dataOut(dec_dataOut), .ctrl_dataOut_dec(ctrl_dataOut_dec)
                        );
    
    AES256_keygen keygen(
                        .clk(clk), .resetn(resetn),
                        .kg_dataIn(kg_dataIn), .ctrl_dataIn_kg(ctrl_dataIn_kg),
                        .kg_dataOut(kg_dataOut), .ctrl_dataOut_kg(ctrl_dataOut_kg)
                        );
    
    /* For now, and to make it easier, this ROM will be called directly from the encryption and decryption modules, although 
    keys will be inserted in the ROM from this module */

    
    mod_romKey romKey(
                        .clk(clk), .resetn(resetn),
                        .inp_romKey(), .addr_romKey(),
                        .outp_romKey()
                    );
    

endmodule