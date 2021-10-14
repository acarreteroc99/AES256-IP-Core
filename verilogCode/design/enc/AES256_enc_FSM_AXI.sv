/**********************************************************************
                            PREGUNTAS DEL CODIGO
    1) Multiplexor inicial: si lo pongo dentro de un always, me dice que no se pueden hacer asignaciones a los wires (lo que 
    yo quiero es "empalmarlos") y si no lo pongo, las condiciones que hay en los if's no las respeta  --> CREO que esta resuelto
    2) En la ROM, la senyal 'done' NUNCA se pone a 0, de ahi que el reg41 no almacene los valores correctamente. Problema: No se 
    por que no entra dentro del if donde se cambia el valor de la variable done. 
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


`define AES_ROUNDS      14                              // AES-128 = 10 ;; AES-192 = 12 ;; AES-256 = 14    
`define BUF_WIDTH_FIFO  2                               // BUF_SIZE = 4 -> BUF_WIDTH = 2, no. of bits to be used in pointer
`define BUF_SIZE_FIFO   ( 1 << `BUF_WIDTH_FIFO )

module AES256_enc(
                    clk, resetn,
                    dataIn_AXI_valid, masterRd, masterRecDataRd,
                    inpAES,
                    outAES, slaveReady, dataOut_AXI_valid, slaveValidResp, masterSendDataRd
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
    input dataIn_AXI_valid;                                                     // S_AXI_WVALID
    input masterRd, masterRecDataRd;                                            // S_AXI_BREADY, S_AXI_RREADY
                                  
    reg [(nFlags-1):0] regCTRL;                                                 // Shall be deleted since it is strightly connected to slv_reg

    // OUTPUT signals from MASTER
    output reg masterSendDataRd;                                                // S_AXI_WREADY

    // OUTPUT signals from SLAVE
    output reg slaveRd, dataOut_AXI_valid, slaveValidResp;                      // S_AXI_ARREADY, S_AXI_RVALID, S_AXI_BVALID
    output reg [(N-1):0][7:0] outAES;                                           // goes to reg16_16to4

    // --- Discarded signals ---
    // input [1:0] addr;
    // output reg reg_empty;

    integer i;

    //------------ Signal control FSM -----------

    localparam [3:0]
                    idle_st = 4'b0000,
                    addRK_st =  4'b0001,
                    reg163_st = 4'b0010,
                    rom_st = 4'b0011, 
                    shf_st = 4'b0100,
                    mixCol_st = 4'b0101,
                    reg162_st = 4'b0110,

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
    reg [3:0] rom_cnt;
    reg req_rom;

    //------------ reg16_1 ------------
    wire [(N-1):0][7:0] dataOut_reg161;

    //------------ shifter -------------
    wire [(N-1):0][7:0] dataOut_shifter;
    reg wr_shf;
    reg outp_en_shf;


    //------------ mixColumns ------------
    wire [(N-1):0][7:0] dataOut_demux_0;
    wire [(N-1):0][7:0] dataOut_mixColumns;
    reg wr_mC;
    reg wr_mC_delay;

    //------------ reg16_2 ------------
    wire [(N-1):0][7:0] dataOut_demux_1;
    wire [(N-1):0][7:0] dataOut_reg16_2;
    reg [1:0] reg162_cnt;
    reg wr_reg162;

    //------------ mux -------------

    //------------ addRoundKey -------------
    wire [(N-1):0][7:0] dataIn_addRK;
    reg [(N-1):0][7:0] dataOut_addRK;
    //wire [(N-1):0][7:0] dataOut_addRK;

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
            regCTRL <= 8'h0;
        end
        else
        begin
            if(addr == 0 && req_axi_in == 1)
            begin
                regCTRL <= inpAES;
            end
            else if(done == 1)
            begin
                regCTRL <= 0;
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

            
            if(aes_st == rom_st || aes_st == reg163_st)
                req_rom = 1'b1;
            else
                req_rom = 1'b0;
            
        end
    end

    /*=========================================
                rom_st state control
    ===========================================*/

    always @(posedge clk or negedge resetn)                            
    begin
        if(!resetn)
            rom_cnt = 0;

        else
        begin
            if(aes_st == rom_st)
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
            if(aes_st == rom_st)
                wr_shf = 1'b1;
            else
                wr_shf = 1'b0;
            
            if(aes_st == shf_st)
                outp_en_shf = 1'b1;
            else
                outp_en_shf = 1'b0;
        end
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
            wr_mC_delay = wr_mC;

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
            done = 0;
            for(i=0; i < N; i=i+1)
                outAES[i] = 0;
        end 

        else
        begin
            if(aes_st == end_st)
            begin
                done = 1'b1;
                outAES = dataOut_addRK;
            end
            else
                done = 1'b0;
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
                    if(rom_cnt == N-1)
                        aes_st_next = shf_st;
                end
            shf_st:
                begin
                    if(round < 14)
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
                                .inp(inpAES), 
                                .outp0(dataOut1_demux), .outp1(dataOut2_demux)
                             );


    // ===================  DATA ENCRYPTER  ========================

    mod_reg16_4to16_INIT reg416_INIT(
                                    .clk(clk), .resetn(resetn),
                                    .i(dataOut2_demux), .req_axi_in(req_axi_in), //.rd_en(1),
                                    .o(dataOut_reg416), .reg_empty(reg416_empty), .reg_full(reg416_full)
                                    );
    
    mod_mux_2to1 mux(
                    .addr(round),
                    .inp0(dataOut_reg416), .inp1(dataOut_reg16_2), 
                    .outp(dataIn_addRK)
                    );

    // 16 XOR modules for date-key addition
    mod_enc_addRoundKey addRK(
                             .clk(clk), .resetn(resetn),     
                             .p(dataIn_addRK), .k(key),      
                             .o(dataOut_addRK)              
                             );


    // Extracting corresponding key (column) from     
    mod_romKey  rom_key(                                
                        .clk(clk), .resetn(resetn),         
                        .selectKey(round),                  
                        .data(key)                          
                       );

    mod_reg16_16to1 reg16_3(
                            .clk(clk), .resetn(resetn),
                            .i(dataOut_addRK), .wr_en(wr_reg163), .req_rom(req_rom),
                            .o(dataOut_reg163), .reg_empty(reg163_empty)                       
                           );

    // Substitution through ROM module
    mod_enc_rom256 rom_Sbox( 
                            .clk(clk), .resetn(resetn),                                 //.reg_full(reg41_full), .fifo_empty(fifo_empty),
                            .addr(dataOut_reg163),
                            .data(dataOut_ROM)                                          //, .done(OK_ROM), .wr_req(req_ROM)
                           );

    // Shifting 1 row     
    mod_enc_shifter shifter(
                            .clk(clk), .resetn(resetn),                                 //.wr_en(reg161_full), .reg41_full(reg41_full),
                            .inp(dataOut_ROM), .wr_en(wr_shf), .outp_en(outp_en_shf), 
                            .outp(dataOut_shifter)                                      //, .done(OK_shifter)
                            );

    mod_demux_2to1 demux(
                            .clk(clk), .addr(round), 
                            .inp(dataOut_shifter), 
                            .outp_0(dataOut_demux_0), .outp_1(dataOut_demux_1)
                        );

    

    // Mixing all columns w/ polynomial matrix
    mod_enc_mixColumns mixColumns(
                                .clk(clk), .resetn(resetn),                             //.enable(reg162_full), .reg161_status(reg161_full), .reg162_reseted(reg162_reseted),
                                .state(dataOut_demux_0), .wr_en(wr_mC_delay),
                                .state_out(dataOut_mixColumns)                          //, .done(OK_mC), .mC_reseted(mC_reseted)
                                );

    // 16-byte reg storing entire matrix
    mod_reg16 reg16_2(
                    .clk(clk), .resetn(resetn), .wr_en(wr_reg162), .round(round),     //.rd_en(wr_reg163),
                    .i(dataOut_mixColumns), .i2(dataOut_demux_1),
                    .o(dataOut_reg16_2)                                 //, .reg_full(reg162_full), .reg_reseted(reg162_reseted)
                    );

    
    

endmodule
