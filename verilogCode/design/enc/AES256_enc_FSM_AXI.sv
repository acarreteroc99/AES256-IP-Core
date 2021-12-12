
/*
`include "../design/mod_fifo1.sv"
`include "../design/mod_reg4_1to4.sv"
`include "../design/mod_reg16.sv"
`include "../design/mod_reg16_16to1.sv"
`include "../design/mod_reg16_1to16.sv"
`include "../design/mod_regCTRL.sv"
`include "../design/mod_romKey.sv"
`include "../design/mod_mux_2to1.sv"
`include "../design/mod_demuxInit.sv"
`include "../design/enc/mod_enc_rom256.sv"
`include "../design/enc/mod_enc_shifter.sv"
`include "../design/enc/mod_enc_mixColumns.sv"
`include "../design/enc/mod_enc_addRoundKey.sv"
*/


`define AES_ROUNDS      13                              // AES-128 = 10 ;; AES-192 = 12 ;; AES-256 = 14    
`define BUF_WIDTH_FIFO  2                               // BUF_SIZE = 4 -> BUF_WIDTH = 2, no. of bits to be used in pointer
`define BUF_SIZE_FIFO   ( 1 << `BUF_WIDTH_FIFO )

module AES256_enc(
                    clk, resetn,
                    enc_dataIn, ctrl_dataIn_enc, enc_key,
                    enc_dataOut, ctrl_dataOut_enc, enc_keyAddr
                 );
    
    localparam N = 16;
    localparam Nrows = 4;
    localparam elementsXRow = 4;
    localparam nFlags = 8;
    localparam keyLength = 128;

    //------------ Ports -------------

    // Global sigals
    input clk, resetn;                                                      

    // INPUT signals                                                    
    input ctrl_dataIn_enc;      
    input [127:0] enc_key;          
    input [127:0] enc_dataIn;                                            

    // OUTPUT signals
    output reg ctrl_dataOut_enc;
    output reg [3:0] enc_keyAddr;
    output reg [127:0] enc_dataOut;    

    reg [N-1:0][7:0] auxData;                           

    // Vars used in loops
    integer i, index;

    //------------ State codification (FSM) -----------
    
    localparam [3:0]
                    idle_st = 4'b0000,
                    addRK_st =  4'b0001,
                    reg163_st = 4'b0010,
                    rom_st = 4'b0011, 
		            romw_st = 4'b0100,
                    shf_st = 4'b0101,
                    mixCol_st = 4'b0110,
                    reg162_st = 4'b0111,
                    
                    
                    end_round_st = 4'b1100,
                    end_st = 4'b1111;

    reg [3:0] aes_st, aes_st_next; 
    reg [3:0] round;
    reg end_st_reg;
    
    
    //------------ reg164 -----------

    //wire [(N-1):0][7:0] dataOut_reg416;
    //wire reg416_empty;
    //wire reg416_full;

    //------------ mux -------------
    reg mux_chgInp;

    //------------ ROM -------------
    wire [7:0] dataOut_ROM;
    reg [4:0] rom_cnt;
    reg req_rom;
    reg shf_reg;

    //------------ shifter -------------
    wire [(N-1):0][7:0] dataOut_shifter;
    reg wr_shf, wr_shf_delay;
    reg outp_en_shf, outp_en_shf_delay;


    //------------ mixColumns ------------
    wire [(N-1):0][7:0] dataOut_mixColumns;
    reg wr_mC;
    reg wr_mC_delay;

    //------------ reg16_2 ------------
    wire [(N-1):0][7:0] dataOut_reg16_2;
    //wire [(N-1):0][7:0] dataOut_demux_1;
    reg [1:0] reg162_cnt;
    reg wr_reg162, wr_reg162_delay;

    //------------ addRoundKey -------------
    wire [(N-1):0][7:0] dataIn_addRK;
    reg [(N-1):0][7:0] dataOut_addRK;

    //------------ reg16_3 ------------
    wire [7:0] dataOut_reg163;
    reg wr_reg163;

    //------------ ROM_Key -------------
    wire [(keyLength-1):0] key;

    /*=========================================
                Input/Output control
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin

        if(!resetn)
        begin
            ctrl_dataOut_enc <= 0;
            mux_chgInp <= 1'b0;

            for(i=0; i < N; i=i+1)
                enc_dataOut[i] <= 0;
        end 

        else
        begin
            if(ctrl_dataIn_enc)
            begin
                for(index=0; index < Nrows; index=index+1)                                          // Changing data format. From 128-bit array to 16x8 matrix
                begin
                    auxData[(Nrows*index)] <= enc_dataIn[(index*32) +: 8];
                    auxData[(Nrows*index) + 1] <= enc_dataIn[(index*32) + 8 +: 8];
                    auxData[(Nrows*index) + 2] <= enc_dataIn[(index*32) + 16 +: 8];
                    auxData[(Nrows*index) + 3] <= enc_dataIn[(index*32) + 24 +: 8];
                end
            end

            if(round != 0)                                                                          // Data no longer comes from outside
                mux_chgInp <= 1'b1;

            ctrl_dataOut_enc <= end_st_reg;                                                         // We let the other devices know that encryption has ended

            if(end_st_reg)
            begin
                
                for(index=0; index < Nrows; index=index+1)                                          // Changing data format. From 16x8 matrix to 128-bit array
                begin
                    enc_dataOut[(index*32) +: 8] <= dataOut_addRK[(Nrows*index)];
                    enc_dataOut[(index*32) + 8 +: 8] <= dataOut_addRK[(Nrows*index) + 1];
                    enc_dataOut[(index*32) + 16 +: 8] <= dataOut_addRK[(Nrows*index) + 2];
                    enc_dataOut[(index*32) + 24 +: 8] <= dataOut_addRK[(Nrows*index) + 3];
                end

                mux_chgInp <= 1'b1;
                round <= 0;

            end
            else
                ctrl_dataOut_enc <= 1'b0;
        end
    end 

    /*=========================================
        Controlling current state (aes_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
            aes_st <= idle_st;

        else
            aes_st <= aes_st_next;
    end 

    /*=========================================
                reg163_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
        begin
            wr_reg163 <= 1'b0;
            req_rom <= 1'b0;
        end

        else
        begin
            if(aes_st == reg163_st)
            begin
                wr_reg163 <= 1'b1;
            end
            else
                wr_reg163 <= 1'b0; 

	        if(aes_st == rom_st)
                req_rom <= 1'b1;
            else
                req_rom <= 1'b0;
            
        end
    end

    /*=========================================
                rom_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                            
    begin
        if(!resetn)
        begin
            rom_cnt <= 0;
            shf_reg <= 0;
        end

        else
        begin
            shf_reg <= req_rom;

            if(aes_st == rom_st || aes_st == romw_st)
                rom_cnt <= rom_cnt + 1;
            else
                rom_cnt <= 0;
        end
    end 

    /*=========================================
            shifter_st state control
    ===========================================*/
    
    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
        begin
            wr_shf <= 1'b0;
            outp_en_shf <= 1'b0;
        end

        else
        begin
            if(aes_st == shf_st)
                outp_en_shf <= 1'b1;
            else
                outp_en_shf <= 1'b0;
            
        end
    end

    always @(aes_st)
    begin
          if(aes_st == rom_st || aes_st == romw_st)
            begin
                wr_shf <= 1'b1;
            end
            else
                wr_shf <= 1'b0;
    end


    /*=========================================
                mixCol_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            wr_mC <= 1'b0;
        else
        begin
            if(aes_st == mixCol_st)
                wr_mC <= 1'b1;
            else
                wr_mC <= 1'b0; 
        end
    end

    /*=========================================
                reg162_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            wr_reg162 <= 1'b0;
        else
        begin
            if(aes_st == reg162_st)
                wr_reg162 <= 1'b1;
            else
                wr_reg162 <= 1'b0; 
        end
    end

    /*=========================================
            end_round_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                             // Round addition
    begin
        if(!resetn)
        begin
            round <= 0;
        end

        else
        begin
            if(aes_st == end_round_st)
                round <= round + 1;

            else if (aes_st == idle_st)
                round <= 0;
            
            //enc_keyAddr <= round;
        end
    end

    
    always @(round)
    begin
        enc_keyAddr <= round;
    end
    

    // assign enc_keyAddr = round;
    assign key = enc_key;

    /*=========================================
                end_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            end_st_reg = 0;
        end
        else
        begin
            if(aes_st == end_st)
            begin
                end_st_reg <= 1;
            end
            else
                end_st_reg <= 0;
        end

    end

    /*=========================================
            FSM (Finite State Machine)
    ===========================================*/
    

    always @(ctrl_dataIn_enc, aes_st, rom_cnt, round)                                 
    begin
        aes_st_next <= aes_st;
        
        case(aes_st)
            idle_st: 
                begin
                    if(ctrl_dataIn_enc)                                 // Data is coming from outside
                    begin
                        aes_st_next <= addRK_st;
                    end
                end 
            addRK_st:
                begin
                    aes_st_next <= reg163_st;
                end
            reg163_st:
                begin
                    aes_st_next <= rom_st;
                end
            rom_st:
                begin
                    if(rom_cnt == (N-1))                                // 16 bytes, 16 cycles needed                               
                        aes_st_next <= romw_st;
                end
            romw_st:
                begin
                        aes_st_next <= shf_st;	
                end	  
            shf_st:
                begin
                    if(round < 13)                                      // For round 14 (last round), mixColumns operation is not performed. 
                        aes_st_next <= mixCol_st;

                    else                                                // Since mixCol is not performed, data goes straight to "output" register
                        aes_st_next <= reg162_st;
                end
            mixCol_st:
                begin
                    aes_st_next <= reg162_st;
                end
            reg162_st:
                begin
                    aes_st_next <= end_round_st;
                end
            end_round_st:
                begin
                    if(round == `AES_ROUNDS)                            // If 14 rounds are completed, we are done
                        aes_st_next <= end_st;
                    else
                        aes_st_next <= addRK_st;
                end
        endcase
    end
    
    // 1st round: data comes from outside ;; Rounds left: data loops
    mod_mux_2to1 mux(
                    .addr(mux_chgInp),
                    .inp0(auxData), .inp1(dataOut_reg16_2), 
                    .outp(dataIn_addRK)
                    );
    

    // 16 XOR modules for data-key addition
    mod_enc_addRoundKey addRK(
                             .clk(clk), .resetn(resetn),     
                             .inp_addRK(dataIn_addRK), .inp_key_addRK(key),      //.inp_key_addRK(key),      
                             .outp_addRK(dataOut_addRK)              
                             );


    // Obtaining key from external ROM    
    /*
    mod_enc_romKey  rom_key(                                
                        .clk(clk), .resetn(resetn),         
                        .addr_romKey(round),                  
                        .outp_romKey(key)                          
                       );
    */

    // 16 bytes are received, this are outputed 1 by 1 as ROM requests them
    mod_reg16_16to1 reg16_3(
                            .clk(clk), .resetn(resetn),
                            .inp_reg163(dataOut_addRK), .wr_en(wr_reg163), .req_rom(req_rom),
                            .outp_reg163(dataOut_reg163)                     
                           );

    // Substitution through ROM module
    mod_enc_rom256 rom_Sbox( 
                            .clk(clk), .resetn(resetn),                                 
                            .addr_romSbox(dataOut_reg163),
                            .outp_romSbox(dataOut_ROM)                                          
                           );

    // Shifter in charge of the "Shifting" stage
    mod_enc_shifter shifter(
                            .clk(clk), .resetn(resetn),                                 
                            .inp_shf(dataOut_ROM), .wr_en(req_rom), .outp_en(outp_en_shf), 
                            .outp_shf(dataOut_shifter)
                            );    

    // Mixing all columns w/ polynomial matrix
    mod_enc_mixColumns mixColumns(
                                .clk(clk), .resetn(resetn),                             
                                .inp_mC(dataOut_shifter), .wr_en(wr_mC),
                                .outp_mC(dataOut_mixColumns)                          
                                );

    // 16-byte reg storing entire matrix
    mod_reg16 reg16_2(
                    .clk(clk), .resetn(resetn), .wr_en(wr_reg162), .round(round),     
                    .inp_reg162_mC(dataOut_mixColumns), .inp_reg162_shf(dataOut_shifter),
                    .outp_reg162(dataOut_reg16_2)                                 
                    );

endmodule