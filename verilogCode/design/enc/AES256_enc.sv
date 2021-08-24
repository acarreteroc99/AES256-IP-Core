

`include "../mod_fifo1.sv"
`include "../mod_reg4_1to4.sv"
`include "../mod_reg16.sv"
`include "../mod_reg16_16to1.sv"
`include "../mod_reg16_4to16.sv"
`include "../mod_regCTRL.sv"
`include "../mod_romKey.sv"

`include "mod_enc_rom256.sv"
`include "mod_enc_shifter.sv"
`include "mod_enc_mixColumns.sv"
`include "mod_enc_addRoundKey.sv"

`define AES_ROUNDS      14                              // AES-128 = 10 ;; AES-192 = 12 ;; AES-256 = 14    
`define BUF_WIDTH_FIFO  2                               // BUF_SIZE = 4 -> BUF_WIDTH = 2, no. of bits to be used in pointer
`define BUF_SIZE_FIFO   ( 1 << `BUF_WIDTH_FIFO )

module AES256_enc(clk, resetn, 
                    plaintext, addr, pos, flagVal,
                    encData
                 );

    //------------ AES Top -------------
    localparam N = 16;
    localparam flags = 5;                               // Number of flags in control register (regCTRL)
    integer round;

    input clk, resetn;

    input flagVal;                                      // 0 or 1 to turn on/off a flag
    input [(N-1):0] pos;                                // Position of the flag to be turned up/down
    input [(N-1):0][7:0] plaintext;
    input [1:0] addr;                                   // --------   CHECK NUM OF BITS NEEDED TO ADDRESS   --------

    output [(N-1):0][7:0] encData;


    //------------ FIFO -------------
    wire fifo_wr_en;

    wire fifo_empty, fifo_full;
    wire [7:0] dataOut_fifo;
    wire [`BUF_WIDTH_FIFO:0] fifo_counter;

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

    //------------ addRoundKey -------------
    wire OK_addRK;
    wire [(N-1):0][7:0] dataIn_addRK;
    wire [(N-1):0][7:0] dataOut_addRK;

    //------------ reg16_3 ------------
    wire [7:0] dataOut_reg163;
    wire reg163_empty;

    // Control register
    if(addr == 1'b0)
    begin
        mod_regCTRL regCRTL (
                            .clk(clk), .resetn(resetn), .read(!addr), 
                            .pos(pos), .value(flagVal)
                            );
    end

    // Encrypt data
    else
    begin

        // Store 1 element in FIFO
        mod_fifo1 fifo(
                        .clk(clk), .rst(resetn), 
                        .buf_in(dataOut_reg163), .buf_out(dataOut_fifo), 
                        .wr_en(fifo_wr_en), .rd_en(OK_ROM), 
                        .buf_empty(fifo_empty), .buf_full(fifo_full), .fifo_counter(fifo_counter) 
                        );
        // Substitution through ROM module
        mod_enc_rom256 rom_Sbox( 
                            .clk(clk), .reg_full(reg41_full), .fifo_full(fifo_full),
                            .addr(dataOut_fifo),
                            .data(dataOut_ROM), .done(OK_ROM), .wr_req(req_ROM)
                            );
        // 4-byte reg storing 1 row
        mod_reg4_1to4 reg4_1(
                            .clk(clk), .resetn(resetn), .rd_en(OK_shifter), .wr_en(req_ROM),
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
                                .clk(clk), .resetn(resetn), .rd_en(req_mixColumns), .wr_en(OK_shifter), 
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

        // 16 XOR modules for date-key addition
        if(round == 0)
            assign dataIn_addRK = plaintext;
        else
            assign dataIn_addRK = dataOut_reg16_2;

        mod_enc_addRoundKey addRK(
                                .clk(clk), .reg_full(reg163_empty),
                                .p(dataIn_addRK), .k(key),
                                .o(dataOut_addRK), .ok(OK_addRK)
                                );

        // Extracting corresponding key (column) from                                      !!!!!!! FIIIIX !!!!!!!
        mod_romKey rom_key( 
                            .clk(clk), 
                            .addr(dataOut_fifo), .wr_en(),
                            .data(key), .done(OK_ROM)
                            );

        mod_reg16_16to1 reg16_3(
                        .clk(clk), .resetn(resetn), .wr_en(OK_addRK),
                        .i(dataOut_addRK), .req_fifo(fifo_empty),
                        .o(dataOut_reg163), .reg_empty(reg163_empty)                       //output 8 in 8 bits
                        );
        
        if(round == `AES_ROUNDS)                                                  // If all round have been completed, encrypted data goes to the AXI bus. 
            assign encData = dataOut_addRK;

    end


endmodule