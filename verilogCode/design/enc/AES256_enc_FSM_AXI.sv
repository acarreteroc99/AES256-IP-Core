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

module AES256_enc(
                    clk, resetn,
                    ctrl_dataIn, // masterRd, masterRecDataRd,
                    inpAES, addr,
                    outAES, ctrl_dataOut //, slaveRd, slaveValidResp, masterSendDataRd
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
    input [(elementsXRow*8)-1:0] inpAES;                                        // S_AXI_WDATA
    input ctrl_dataIn;                                                     // S_AXI_WVALID
    input addr;

    reg [(nFlags-1):0] regCTRL;                                                 // Shall be deleted since it is strightly connected to slv_reg

    // OUTPUT signals from SLAVE
    output reg ctrl_dataOut;
    output reg [(N-1):0][7:0] outAES;                                           // goes to reg16_16to4

    integer i;

    //------------ Signal control FSM -----------
    // Left: 1000, 1001, 1010, 1011
    
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

    //------------ addRoundKey -------------
    wire [(N-1):0][7:0] dataIn_addRK;
    reg [(N-1):0][7:0] dataOut_addRK;

    //------------ reg16_3 ------------
    wire [7:0] dataOut_reg163;
    reg wr_reg163;

    //------------ ROM_Key -------------
    wire [(keyLength-1):0] key;
    
    always @(posedge clk or negedge resetn)                             // Round addition
    begin
        if(!resetn)
        begin
            round = 0;
        end

        else
        begin
            if(aes_st == end_round_st)
                round = round + 1;

            else if (aes_st == idle_st)
                round = 0;
        end
    end

    always @(posedge clk or negedge resetn)                             // Controling whether input goes to regCTRL or not
    begin
        if(!resetn)
        begin
            regCTRL = 8'h0;
        end
        else
        begin
            if(addr == 0 && ctrl_dataIn == 1)
            begin
                regCTRL = inpAES;
            end
            else if(ctrl_dataOut == 1)
            begin
                regCTRL = 0;
            end
        end
    end 

    /*=========================================
        Controlling current state (aes_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
            aes_st = idle_st;

        else
            aes_st = aes_st_next;
    end 

    /*=========================================
                reg163_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
        begin
            wr_reg163 = 1'b0;
            req_rom = 1'b0;
        end

        else
        begin
            if(aes_st == reg163_st)
                wr_reg163 = 1'b1;
            else
                wr_reg163 = 1'b0; 

            
            //if(aes_st == rom_st || aes_st == reg163_st)
	        if(aes_st == rom_st)
                req_rom =#1 1'b1;
            else
                req_rom =#1 1'b0;
            
        end
    end

    /*=========================================
                rom_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                            
    begin
        if(!resetn)
        begin
            rom_cnt = 0;
            shf_reg = 0;
        end


        else
        begin
            shf_reg = req_rom;
            if(aes_st == rom_st || aes_st == romw_st)
                rom_cnt = rom_cnt + 1;
            else
                rom_cnt = 0;
        end
    end 

    /*=========================================
            shifter_st state control
    ===========================================*/
    
    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
        begin
            wr_shf = 1'b0;
            outp_en_shf = 1'b0;
        end

        else
        begin
            if(aes_st == shf_st)
                outp_en_shf = 1'b1;
            else
                outp_en_shf = 1'b0;
            
        end
    end

    always @(aes_st)
    begin
          if(aes_st == rom_st || aes_st == romw_st)
            begin
                wr_shf = 1'b1;
            end
            else
                wr_shf = 1'b0;
    end



    /*=========================================
                mixCol_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            wr_mC = 1'b0;
        else
        begin
            if(aes_st == mixCol_st)
                wr_mC = 1'b1;
            else
                wr_mC = 1'b0; 
        end
    end

    /*=========================================
                reg162_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            wr_reg162 = 1'b0;
        else
        begin
            if(aes_st == reg162_st)
                wr_reg162 = 1'b1;
            else
                wr_reg162 = 1'b0; 
        end
    end

    /*=========================================
                AES top output control
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            ctrl_dataOut = 0;
            for(i=0; i < N; i=i+1)
                outAES[i] = 0;
        end 

        else
        begin
            if(aes_st == end_st)
            begin
                ctrl_dataOut = 1'b1;
                outAES = dataOut_addRK;
            end
            else
                ctrl_dataOut = 1'b0;
        end
    end

    /*=========================================
            FSM (Finite State Machine)
    ===========================================*/
    

    always @(regCTRL, aes_st, rom_cnt, round)                                 
    begin
        aes_st_next = aes_st;
        
        case(aes_st)
            idle_st: 
                begin
                    if(regCTRL[0] == 1)
                    begin
                        aes_st_next = addRK_st;
                    end
                end 
            addRK_st:
                begin
                    aes_st_next = reg163_st;
                end
            reg163_st:
                begin
                    aes_st_next = rom_st;
                end
            rom_st:
                begin
                    if(rom_cnt == (N-2))
                        aes_st_next = romw_st;
                end
            romw_st:
                begin
                        //  if(rom_cnt == (N))
                        aes_st_next = shf_st;	
                end	  
            shf_st:
                begin
                    if(round < 13)                                      // For round 14 (last round), mixColumns operation is not performed. 
                        aes_st_next = mixCol_st;

                    else
                        aes_st_next = reg162_st;
                end
            mixCol_st:
                begin
                    aes_st_next = reg162_st;
                end
            reg162_st:
                begin
                    aes_st_next = end_round_st;
                end
            end_round_st:
                begin
                    if(round == `AES_ROUNDS)
                        aes_st_next = end_st;
                    else
                        aes_st_next = addRK_st;
                end
        endcase
    end

    // ===================  CONTROL REGISTER  ========================
    mod_demuxInit demux_INIT (
                                .addr(addr), 
                                .inp_demux(inpAES), 
                                .outp_demux_flags(dataOut1_demux), .outp_demux_data(dataOut2_demux)
                             );


    // ===================  DATA ENCRYPTER  ========================

    mod_reg16_4to16_INIT reg416_INIT(
                                    .clk(clk), .resetn(resetn),
                                    .inp_regInit(dataOut2_demux), .req_axi_in(ctrl_dataIn), //.rd_en(1),
                                    .outp_regInit(dataOut_reg416) //, .reg_empty(reg416_empty), .reg_full(reg416_full)
                                    );
    
    mod_mux_2to1 mux(
                    .addr(round),
                    .inp0(dataOut_reg416), .inp1(dataOut_reg16_2), 
                    .outp(dataIn_addRK)
                    );

    // 16 XOR modules for date-key addition
    mod_enc_addRoundKey addRK(
                             .clk(clk), .resetn(resetn),     
                             .inp_addRK(dataIn_addRK), .inp_key_addRK(key),      
                             .outp_addRK(dataOut_addRK)              
                             );


    // Extracting corresponding key (column) from     
    mod_romKey  rom_key(                                
                        .clk(clk), .resetn(resetn),         
                        .addr_romKey(round),                  
                        .outp_romKey(key)                          
                       );

    mod_reg16_16to1 reg16_3(
                            .clk(clk), .resetn(resetn),
                            .inp_reg163(dataOut_addRK), .wr_en(wr_reg163), .req_rom(req_rom),
                            .outp_reg163(dataOut_reg163)                     
                           );

    // Substitution through ROM module
    mod_enc_rom256 rom_Sbox( 
                            .clk(clk), .resetn(resetn),                                 //.reg_full(reg41_full), .fifo_empty(fifo_empty),
                            .addr_romSbox(dataOut_reg163),
                            .outp_romSbox(dataOut_ROM)                                          //, .ctrl_dataOut(OK_ROM), .wr_req(req_ROM)
                           );

    mod_enc_shifter shifter(
                            .clk(clk), .resetn(resetn),                                 //.wr_en(reg161_full), .reg41_full(reg41_full),
                            .inp_shf(dataOut_ROM), .wr_en(shf_reg), .outp_en(outp_en_shf), 
                            .outp_shf(dataOut_shifter)
                            );    

    // Mixing all columns w/ polynomial matrix
    mod_enc_mixColumns mixColumns(
                                .clk(clk), .resetn(resetn),                             //.enable(reg162_full), .reg161_status(reg161_full), .reg162_reseted(reg162_reseted),
                                .inp_mC(dataOut_shifter), .wr_en(wr_mC),
                                .outp_mC(dataOut_mixColumns)                          //, .ctrl_dataOut(OK_mC), .mC_reseted(mC_reseted)
                                );

    // 16-byte reg storing entire matrix
    mod_reg16 reg16_2(
                    .clk(clk), .resetn(resetn), .wr_en(wr_reg162), .round(round),     //.rd_en(wr_reg163),
                    .inp_reg162_mC(dataOut_mixColumns), .inp_reg162_shf(dataOut_shifter),
                    .outp_reg162(dataOut_reg16_2)                                 //, .reg_full(reg162_full), .reg_reseted(reg162_reseted)
                    );

endmodule