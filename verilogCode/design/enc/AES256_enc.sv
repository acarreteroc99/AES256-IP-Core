

`include "../mod_fifo1.sv"
`include "../mod_reg4.sv"
`include "../mod_reg16.sv"

`include "../mod_rom256.sv"
`include "mod_enc_shifter.sv"
`include "mod_mixColumns.sv"
`include "mod_enc_addRoundKey.sv"

module AES256_enc(clk, resetn,
                 data, addr,
                 encData
                 );

    localparam N = 16;

    input clk, resent;
    input [(N:1):0][7:0] data;
    input [1:0] addr;

    output [(N-1):0][7:0] encData;



    clk, rst, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter

    // Modify control register
    if(addr == 1'b0)
    begin
    

    end

    // Encrypt data
    else
    begin
        // Store 1 element in FIFO
        mod_fifo1 fifo( .clk(clk), .rst(rst), 
                        .buf_in(buf_in), .buf_out(buf_out), 
                        .wr_en(wr_en), .rd_en(rd_en), 
                        .buf_empty(buf_empty), buf_full(buf_full), .fifo_counter(fifo_counter) );
        // Substitution through ROM module

        // 4-byte reg storing 1 row

        // Shifting 1 row

        // 16-byte reg storing the whole matrix

        // Mixing all columns w/ polynomial matrix

        // 16-byte reg storing entire matrix

        // 16 XOR modules for date-key addition


    end


endmodule