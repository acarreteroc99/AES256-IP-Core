/**********************************************************************
                            PREGUNTAS DEL CODIGO
    1) Multiplexor inicial: si lo pongo dentro de un always, me dice que no se pueden hacer asignaciones a los wires (lo que 
    yo quiero es "empalmarlos") y si no lo pongo, las condiciones que hay en los if's no las respeta  --> CREO que esta resuelto
    2) En la ROM, la senyal 'ctrl_dataOut' NUNCA se pone a 0, de ahi que el reg41 no almacene los valores correctamente. Problema: No se 
    por que no entra dentro del if donde se cambia el valor de la variable ctrl_dataOut. 
    3) Pese a que regCTRL[0] se ponga a 0, el valor no llega al addRK, haciendo que no deje de encriptar en bucle sin parar. 
    
**********************************************************************/

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

module AES256_dec(
                    clk, resetn,
                    inpAES, ctrl_dataIn, 
                    outAES, ctrl_dataOut 
                 );

    /* --------- OLD PORT DEFINITION ----------

                clk, resetn, 
                inpAES, req_axi_in, rd_en,
                outAES, reg_empty, ready

    -------------------------------------------- */

    
    localparam N = 16;
    localparam Nrows = 4;
    localparam elementsXRow = 4;
    localparam nFlags = 8;
    localparam keyLength = 128;

    //------------ Ports -------------

    // Global sigals
    input clk, resetn;                                                          // S_AXI_ACLK, S_AXI_ARESETN

    // INPUT signals from MASTER   
    input [127:0] inpAES;                                        // S_AXI_WDATA
    input ctrl_dataIn;                                                     // S_AXI_WVALID

    // OUTPUT signals from SLAVE
    output reg ctrl_dataOut;
    output reg [127:0] outAES;               
    reg [N-1:0][7:0] auxData;                           

    integer i, index;

    //------------ Signal control FSM -----------
    // Left: 1000, 1001, 1010, 1011
    
    localparam [3:0]
                    idle_st = 4'b0000,
                    shf_st = 4'b0001,
                    reg163_st = 4'b0010,
                    rom_st = 4'b0011,
                    romw_st = 4'b0100,
                    addRK_st =  4'b0101,
                    mixCol_st = 4'b0110,
                    reg162_st = 4'b0111,
                    
                    
                    end_round_st = 4'b1100,
                    end_st = 4'b1111;

    reg [3:0] aes_st, aes_st_next; 
    reg [3:0] round;
    
    
    //------------ reg164 -----------

    wire [(N-1):0][7:0] dataOut_reg416;
    wire reg416_empty;
    wire reg416_full;

    //------------ demux -------------

    wire [(nFlags-1):0] dataOut1_demux;
    wire [(N-1):0][7:0] dataOut2_demux;

    //------------ ROM -------------
    wire [7:0] dataOut_ROM;
    reg [4:0] rom_cnt;
    reg req_rom;
    reg shf_reg;

    //------------ shifter -------------
    wire [(N-1):0][7:0] dataIn_shifter;
    wire [(N-1):0][7:0] dataOut_shifter;
    reg wr_shf, wr_shf_delay;
    reg outp_en_shf, outp_en_shf_delay;


    //------------ mixColumns ------------
    wire [(N-1):0][7:0] dataOut_mixColumns;
    wire [(N-1):0][7:0] dataOut_demux_0;
    reg wr_mC;
    reg wr_mC_delay;

    //------------ reg16_2 ------------
    wire [(N-1):0][7:0] dataOut_reg16_2;
    wire [(N-1):0][7:0] dataOut_demux_1;
    reg [1:0] reg162_cnt;
    reg wr_reg162, wr_reg162_delay;

    //------------ reg16_1 ------------
    wire [(N-1):0][7:0] dataOut_reg161;

    //------------ addRoundKey -------------
    wire [(N-1):0][7:0] dataOut_addRK;
    reg [(N-1):0][7:0] dataOut_addRK;
    reg wr_addRK;

    //------------ reg16_3 ------------
    wire [7:0] dataOut_reg163;
    reg wr_reg163;

    //------------ ROM_Key -------------
    wire [(keyLength-1):0] key;

    reg end_st_reg;
    
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
        end
    end

    //  !!!!!!!!!!!!!!!!!!!!! UNCOMMENT WHEN CONFIGURATON IS ADAPTED TO AXI !!!!!!!!!!!!!!!!!!!!!!!

    /*=========================================
                Input/Output control
    ===========================================*/
    
    always @(posedge clk or negedge resetn)
    begin

        if(!resetn)
        begin
            ctrl_dataOut <= 0;
            for(i=0; i < N; i=i+1)
                outAES[i] <= 0;
        end 

        else
        begin
            if(ctrl_dataIn)
            begin
                for(index=0; index < Nrows; index=index+1)
                begin
                    auxData[(Nrows*index)] <= inpAES[(index*32) +: 8];
                    auxData[(Nrows*index) + 1] <= inpAES[(index*32) + 8 +: 8];
                    auxData[(Nrows*index) + 2] <= inpAES[(index*32) + 16 +: 8];
                    auxData[(Nrows*index) + 3] <= inpAES[(index*32) + 24 +: 8];
                end
            end

            ctrl_dataOut <= end_st_reg;

            if(end_st_reg)
            begin
                
                for(index=0; index < Nrows; index=index+1)
                begin
                    outAES[(index*32) +: 8] <= dataOut_addRK[(Nrows*index)];
                    outAES[(index*32) + 8 +: 8] <= dataOut_addRK[(Nrows*index) + 1];
                    outAES[(index*32) + 16 +: 8] <= dataOut_addRK[(Nrows*index) + 2];
                    outAES[(index*32) + 24 +: 8] <= dataOut_addRK[(Nrows*index) + 3];
                end

            end
            else
                ctrl_dataOut <= 1'b0;
        end
    end 
    
    // assign dataIn_addRK = auxData;

    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
            wr_addRK <= 0;
        end

        else
        begin
            wr_addRK <= req_rom;

            if(aes_st == rom_st || aes_st == romw_st)
                rom_cnt <= rom_cnt + 1;
            else
                rom_cnt <= 0;
        end
    end

    /*=========================================
                addRK state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                            
    begin
        if(!resetn)
        begin
            wr_addRK <= 1'b0;
        end

        else
        begin
            if(aes_st == addRK_st)
                wr_addRK <= 1'b1;

            else if (aes_st == mixCol_st)
                wr_addRK <= 1'b0;

        end
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
    

    always @(ctrl_dataIn, aes_st, rom_cnt, round)                                 
    begin
        aes_st_next <= aes_st;
        
        case(aes_st)
            idle_st: 
                begin
                    if(ctrl_dataIn == 1)
                    begin
                        aes_st_next <= addRK_st;
                    end
                end 
            shf_st:
                begin
                    aes_st_next <= reg163_st;
                end
            reg163_st:
                begin
                    aes_st_next <= rom_st;
                end
            rom_st:
                begin
                    if(rom_cnt == (N-1))                               // If the condition is N-2, values are outputed for a shorter value each round
                        aes_st_next <= romw_st;
                end
            romw_st:
                begin
                        aes_st_next <= addRK_st;	
                end	
            addRK_st:
                begin
                    if(round == 0)
                        aes_st_next <= shf_st;
                    else if (round < `AES_ROUNDS)
                        aes_st_next <= mixCol_st;
                    else
                        aes_st_next <= end_st;
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
                    aes_st_next <= shf_st;
                end

        endcase
    end
    
    mod_mux_2to1 mux(
                .addr(round),
                .inp0(dataOut_addRK), .inp1(dataOut_reg16_2), 
                .outp(dataIn_shifter)
                );
    
    mod_dec_shifter shifter(
                        .clk(clk), .resetn(resetn),                                 
                        .inp_shf(dataIn_shifter),               // .wr_en(), .outp_en(), 
                        .outp_shf(dataOut_shifter)
                        );
    
    mod_reg16_16to1 reg16_3(
                            .clk(clk), .resetn(resetn),
                            .inp_reg163(dataOut_shifter), .wr_en(wr_reg163), .req_rom(req_rom),
                            .outp_reg163(dataOut_reg163)                     
                           );

    // Substitution through ROM module
    mod_dec_rom256 rom_Sbox( 
                            .clk(clk), .resetn(resetn),                                
                            .addr_romSbox(dataOut_reg163),
                            .outp_romSbox(dataOut_ROM)                                          
                           );

    mod_reg16_1to16 reg16_1(
                            .clk(clk), .resetn(resetn), 
                            .i(dataOut_ROM), .wr_en(),
                            .o(dataOut_reg161)
                            );
    
    mod_mux_2to1 mux2(
                .addr(round),
                .inp0(auxData), .inp1(dataOut_reg161), 
                .outp(dataIn_addRK)
                );
    

    // 16 XOR modules for date-key addition
    mod_dec_addRoundKey addRK(
                             .clk(clk), .resetn(resetn),     
                             .inp_addRK(dataIn_addRK), .inp_key_addRK(key), //.wr_en(wr_addRK),    
                             .outp_addRK(dataOut_addRK)              
                             );


    // Extracting corresponding key (column) from     
    mod_romKey  rom_key(                                
                        .clk(clk), .resetn(resetn),         
                        .addr_romKey(round),                  
                        .outp_romKey(key)                          
                       );
    

    // Mixing all columns w/ polynomial matrix
    mod_dec_mixColumns mixColumns(
                                .clk(clk), .resetn(resetn),                             
                                .inp_mC(dataOut_addRK), .wr_en(),
                                .outp_mC(dataOut_mixColumns)                          
                                );

    // 16-byte reg storing entire matrix
    mod_reg16 reg16_2(
                    .clk(clk), .resetn(resetn), .wr_en(wr_reg162), .round(round),     
                    .inp_reg162_mC(dataOut_mixColumns), .inp_reg162_shf(dataOut_addRK),
                    .outp_reg162(dataOut_reg16_2)                                 
                    );


endmodule