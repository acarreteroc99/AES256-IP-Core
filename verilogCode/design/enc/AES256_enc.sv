

`include "../mod_fifo1.sv"
`include "../mod_reg4_1to4.sv"
`include "../mod_reg16.sv"

`include "../mod_rom256.sv"
`include "mod_enc_shifter.sv"
`include "mod_mixColumns.sv"
`include "mod_enc_addRoundKey.sv"

`define AES_ROUNDS      14                              // AES-128 = 10 ;; AES-192 = 12 ;; AES-256 = 14    
`define BUF_WIDTH_FIFO  2                               // BUF_SIZE = 4 -> BUF_WIDTH = 2, no. of bits to be used in pointer
`define BUF_SIZE_FIFO   ( 1 << `BUF_WIDTH_FIFO )

module AES256_enc(
                 );

    //------------ AES Top -------------
    localparam N = 16;
    integer round;

    input clk, resetn;
    input [(N:1):0][7:0] data;
    input [1:0] addr;

    output [(N-1):0][7:0] encData;

    //------------ FIFO -------------
    wire fifo_wr_en, fifo_rd_en;

    wire fifo_empty, fifo_full;
    wire [7:0] dataOut_fifo;
    wire [`BUF_WIDTH_FIFO:0] fifo_counter;

    //------------ ROM -------------
    wire [7:0] dataOut_ROM;
    wire OK_ROM;

    //------------ reg_4to1 ------------
    wire [31:0] dataOut_reg4_1;

    //------------ shifter -------------
    wire [31:0] dataOut_shifter;
    wire [1:0] row;

    //------------ addRoundKey -------------
    wire OK_addRK;
    wire [(N-1):0][7:0]dataOut_addRK;

    //------------ reg16 ------------
    wire [(N-1):0][7:0]dataOut_reg163;

    // Control register
    if(addr == 1'b0)
    begin
    /*
    *   MODIFY CONTROL REGISTER
    */

    end

    // Encrypt data
    else
    begin

        // Store 1 element in FIFO
        mod_fifo1 fifo( 
                        .clk(clk), .rst(resetn), 
                        .buf_in(/*8 bit input*/), .buf_out(dataOut_fifo), 
                        .wr_en(fifo_wr_en), .rd_en(fifo_rd_en), 
                        .buf_empty(fifo_empty), .buf_full(fifo_full), .fifo_counter(fifo_counter) 
                        );
        // Substitution through ROM module
        mod_rom256 rom_Sbox( 
                            .clk(clk), .en(fifo_empty),
                            .addr(dataOut_fifo),
                            .data(dataOut_ROM), .opComp(OK_ROM)
                            );
        // 4-byte reg storing 1 row
        mod_reg4_1to4 reg4_1(
                        .clk(clk), .resetn(resetn), .read(OK_ROM),
                        .i(dataOut_rom),
                        .o(dataOut_reg4_1)
                        );
        // Shifting 1 row
        // Need a counter that says which row I am dealing with. 
        mod_enc_shifter shifter(
                                .clk(clk), 
                                .in(dataOut_reg4_1), .row(row)
                                .out(dataOut_shifter)
                                );
        // 16-byte reg storing the whole matrix

        // Mixing all columns w/ polynomial matrix

        // 16-byte reg storing entire matrix

        // 16 XOR modules for date-key addition
        mod_enc_addRoundKey addRK(
                                .clk(clk),
                                .p(data), .k(key),
                                .out(dataOut_addRK), .ok(OK_addRK)
                                );
        mod_reg16 reg16_3(
                        .clk(clk), .resetn(resetn), .read(OK_addRK),
                        .i(dataOut_addRK),
                        .o(/*should output 8 in 8 bits*/)      //output 8 in 8 bits
                        );
        end
        //encData = dataOut;
    end


endmodule