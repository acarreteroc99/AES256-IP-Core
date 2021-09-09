
/**********************************************************************
                            PREGUNTAS DEL CODIGO

    1) Multiplexor inicial: si lo pongo dentro de un always, me dice que no se pueden hacer asignaciones a los wires (lo que 
    yo quiero es "empalmarlos") y si no lo pongo, las condiciones que hay en los if's no las respeta  --> CREO que esta resuelto
    2) En la ROM, la senyal 'done' NUNCA se pone a 0, de ahi que el reg41 no almacene los valores correctamente. Problema: No se 
    por que no entra dentro del if donde se cambia el valor de la variable done. 
    

**********************************************************************/


`include "../design/mod_fifo1.sv"
`include "../design/mod_reg4_1to4.sv"
`include "../design/mod_reg16.sv"
`include "../design/mod_reg16_16to1.sv"
`include "../design/mod_reg16_4to16.sv"
`include "../design/mod_regCTRL.sv"
`include "../design/mod_romKey.sv"
`include "../design/mod_mux_2to1.sv"
`include "../design/mod_demuxInit.sv"

`include "../design/enc/mod_enc_rom256.sv"
`include "../design/enc/mod_enc_shifter.sv"
`include "../design/enc/mod_enc_mixColumns.sv"
`include "../design/enc/mod_enc_addRoundKey.sv"



`define AES_ROUNDS      14                              // AES-128 = 10 ;; AES-192 = 12 ;; AES-256 = 14    
`define BUF_WIDTH_FIFO  2                               // BUF_SIZE = 4 -> BUF_WIDTH = 2, no. of bits to be used in pointer
`define BUF_SIZE_FIFO   ( 1 << `BUF_WIDTH_FIFO )

module AES256_enc(
                    clk, resetn, 
                    addr, plaintext, flags,
                    encData
                 );

    //------------ AES Top -------------
    localparam inBits = 64;
    localparam N = 16;
    localparam nFlags = 8;
    localparam keyLength = 128;

    integer i;
    reg [3:0] round;
    

    input clk, resetn;

    input [(nFlags-1):0] flags;              
    input [(N-1):0][7:0] plaintext;
    input addr;
    //input [1:0] addr;                                   

    reg [(nFlags-1):0] regCTRL;
    reg [(N-1):0][7:0] encryptedData;

    output [(N-1):0][7:0] encData;



    //------------ demux -------------

    wire [(nFlags-1):0] dataOut1_demux;
    wire [(N-1):0][7:0] dataOut2_demux;

    //------------ FIFO -------------
    //wire fifo_wr_en;

    wire fifo_empty;
    wire [7:0] dataOut_fifo;
    //wire [`BUF_WIDTH_FIFO:0] fifo_counter;

    //------------ ROM -------------
    wire [7:0] dataOut_ROM;
    wire OK_ROM;
    wire req_ROM;

    //------------ reg_4to1 ------------
    wire [31:0] dataOut_reg4_1;
    wire reg41_full;

    //------------ shifter -------------
    wire [31:0] dataOut_shifter;
    wire [1:0] row;
    wire OK_shifter;

    //------------ reg16_1 ------------
    wire [(N-1):0][7:0] dataOut_reg16_1;
    wire reg161_full;

    //------------ mixColumns ------------
    wire OK_mC;
    wire [(N-1):0][7:0] dataOut_mixColumns;
    wire req_mixColumns;

    //------------ reg16_2 ------------
    wire [(N-1):0][7:0] dataOut_reg16_2;
    wire reg162_full;

    //------------ mux -------------

    //------------ addRoundKey -------------
    wire OK_addRK;
    wire [(N-1):0][7:0] dataIn_addRK;
    wire [(N-1):0][7:0] dataOut_addRK;
    //reg [(N-1):0][7:0] auxAddRK;

    //------------ reg16_3 ------------
    wire [7:0] dataOut_reg163;
    wire reg163_empty;

    //------------ ROM_Key -------------
    wire [(keyLength-1):0] key;
    wire OK_romKey;


    always @(posedge clk) //or negedge resetn)
    begin
        if(!resetn)
        begin
            round = 0;
            
            for(i=0; i<nFlags; i=i+1)
                regCTRL[i] = 0;
            for(i=0; i<N; i=i+1)
                encryptedData[i] = 0; 
        end

        else
        begin
            if(round == `AES_ROUNDS)
            begin
                round = 0;
                encryptedData = dataOut_addRK;
            end
            //else
                //round = round + 1;
            
            regCTRL = dataOut1_demux;

            //$display("regCTRL status: %b", regCTRL);
        end
    end

    
    always @(OK_addRK)
    begin
        round = round + 1;
    end
    

    /*
    always @(posedge clk)
    begin
        if(round == `AES_ROUNDS)
        begin
            round = 0;
            encryptedData = dataOut_addRK;
        end
        else
            round = round + 1;
    end
    */

    // ===================  CONTROL REGISTER  ========================
    mod_demuxInit demux (
                        .addr(addr), 
                        .inp(plaintext), 
                        .outp0(dataOut1_demux), .outp1(dataOut2_demux)
                        );

    /*
    always @(posedge clk)
    begin
        regCTRL = dataOut1_demux;
        //$display("Value coming out of demux is: ", dataOut1_demux);
        //$display("Value for flags is: ", regCTRL);
    end
    */

    // ===================  DATA ENCRYPTER  ========================

    // Store 1 element in FIFO
    mod_fifo1 fifo(
                    .clk(clk), .resetn(resetn), 
                    .inp(dataOut_reg163), .rd_ROM(OK_ROM), .reg16_empty(reg163_empty),
                    .outp(dataOut_fifo), .empty(fifo_empty)
                    );
    // Substitution through ROM module
    mod_enc_rom256 rom_Sbox( 
                        .clk(clk), .resetn(resetn), .reg_full(reg41_full), .fifo_empty(fifo_empty),
                        .addr(dataOut_fifo),
                        .data(dataOut_ROM), .done(OK_ROM), .wr_req(req_ROM)
                        );

    // 4-byte reg storing 1 row
    mod_reg4_1to4 reg4_1(
                        .clk(clk), .resetn(resetn), .rd_en(OK_shifter), .wr_en(OK_ROM),
                        .i(dataOut_ROM),
                        .o(dataOut_reg4_1), .reg_full(reg41_full)
                        );
    // Shifting 1 row     
    mod_enc_shifter shifter(
                            .clk(clk), .resetn(resetn), .wr_en(reg161_full),
                            .inp(dataOut_reg4_1), 
                            .outp(dataOut_shifter), .done(OK_shifter)
                            );
    // 16-byte reg storing the whole matrix
    mod_reg16_4to16 reg16_1(
                            .clk(clk), .resetn(resetn), .rd_en(OK_mC), .wr_en(OK_shifter), 
                            .i(dataOut_shifter), 
                            .o(dataOut_reg16_1), .reg_full(reg161_full)
                            );

    // Mixing all columns w/ polynomial matrix
    mod_enc_mixColumns mixColumns(
                                .clk(clk), .enable(reg162_full), .reset(resetn),
                                .state(dataOut_reg16_1), 
                                .state_out(dataOut_mixColumns), .done(OK_mC)
                                );

    // 16-byte reg storing entire matrix
    mod_reg16 reg16_2(
                    .clk(clk), .resetn(resetn), .wr_en(OK_mC),
                    .i(dataOut_mixColumns), 
                    .o(dataOut_reg16_2), .reg_full(reg162_full)
                    );

    mod_mux_2to1 mux(
                    .addr(regCTRL[0]),
                    .inp0(dataOut2_demux), .inp1(dataOut_reg16_2), 
                    .outp(dataIn_addRK)
                    );


    // 16 XOR modules for date-key addition
    mod_enc_addRoundKey addRK(
                            .clk(clk), .resetn(resetn), .reg_empty(reg163_empty), .rd_comp(OK_romKey),
                            .p(dataIn_addRK), .k(key),
                            .o(dataOut_addRK), .ok(OK_addRK)
                            );


    // Extracting corresponding key (column) from     
    mod_romKey  rom_key(                                
                        .clk(clk), .resetn(resetn), .startBit(addr),
                        .selectKey(round), .wr_en(OK_addRK),
                        .data(key), .done(OK_romKey)
                        );

    mod_reg16_16to1 reg16_3(
                        .clk(clk), .resetn(resetn), .wr_en(OK_addRK),
                        .i(dataOut_addRK), .req_fifo(fifo_empty),
                        .o(dataOut_reg163), .reg_empty(reg163_empty)                       
                        );
    

    assign encData = encryptedData;

endmodule

// ===================================================================================================

// =================  CONTROL FLOW ELEMENTS  =====================

    /*
    always @*
    begin
        case(addr)
            0:
            begin
                flags = plaintext[(nFlags-1):0];
            end
            1:
            begin
                if(round == 0)
                begin
                    for(i=0; i < N; i=i+1)
                        auxAddRK[i] = plaintext[8*i +: 8];
                    
                   dataIn_addRK = auxAddRK;
                end
                else
                    dataIn_addRK = dataOut_reg16_2;

                if(round == `AES_ROUNDS)                                                  // If all round have been completed, encrypted data goes to the AXI bus. 
                    encData = dataOut_addRK;
            end
        endcase

        if(currFlags[0])
            assign enEncryption = curFlags[0];
                                          
    end
    */   