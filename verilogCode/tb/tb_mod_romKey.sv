

`include "../design/mod_romKey.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_romKey();

    localparam period = 50;
    parameter data_width = 128;                                 // More efficient since we output an entire matrix to encode
    parameter addr_width = 4;  

    reg clk, resetn, wr_en;
    reg [(addr_width-1):0] addr;

    wire [(data_width-1):0] data;
    wire done;

    mod_romKey DUT (.clk(clk), .resetn(resetn), .wr_en(wr_en),
                .addr(addr),
                .data(data), .done(done)
                );

    always #100 clk = !clk;

    initial 
    begin

        $dumpfile("wv_mod_romKey.vcd");
        $dumpvars(0, tb_mod_romKey);

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
        #period resetn = 1'b0;

        @(posedge clk)
        resetn = 1'b1;
        wr_en = 1'b1;
        addr = 0;
        test_rom;
        wr_en = 1'b0;

        @(posedge clk)
        wr_en = 1'b1;
        addr = 1;
        test_rom;
        wr_en = 1'b0;

        @(posedge clk)
        wr_en = 1'b1;
        addr = 2;
        test_rom;
        wr_en = 1'b0;

        $finish;
    end

endmodule