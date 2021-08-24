

`include "../design/enc/mod_enc_rom256.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_enc_rom256();

    localparam period = 50;

    reg clk, reg_full, fifo_full;
    reg [7:0] addr;

    wire [7:0] data;
    wire done, wr_req;

    mod_enc_rom256 DUT (.clk(clk), .reg_full(reg_full), .fifo_full(fifo_full),
                .addr(addr),
                .data(data), .done(done), .wr_req(wr_req)
                );

    always #100 clk = !clk;

    initial 
    begin

        $dumpfile("wv_mod_enc_rom256.vcd");
        $dumpvars(0, tb_mod_enc_rom256);

    end

    task test_rom;
    begin
        @(posedge clk)
        $display("TEST - The corresponding value for address %h is %h \n", addr, data);
    end
    endtask

    initial 
    begin
        clk = 1'b0;
        fifo_full = 1'b1;
        reg_full = 1'b0;
        #period;
        addr = 8'h01;
        test_rom;
        fifo_full = 1'b1;
        reg_full = 1'b0;
        addr = 8'h09;
        test_rom;
        fifo_full = 1'b1;
        reg_full = 1'b0;
        addr = 8'h0E;
        test_rom;
        $finish;
    end

endmodule