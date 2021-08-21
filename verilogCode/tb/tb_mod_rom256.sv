

`include "../design/mod_rom256.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_rom256();

    localparam period = 50;

    reg clk;
    reg [7:0] addr;
    reg en;

    wire [7:0] data;
    wire ok;

    mod_rom256 DUT (.clk(clk), 
                .en(en),
                .addr(addr),
                .data(data), .opComp(ok)
                );

    always #100 clk = !clk;

    initial 
    begin

        $dumpfile("wv_mod_rom256.vcd");
        $dumpvars(0, tb_mod_rom256);

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
        en = 1'b1;
        #period;
        addr = 8'h01;
        //addr = 8'h0F;
        test_rom;
        addr = 8'h09;
        //addr = 8'h34;
        test_rom;
        addr = 8'h0E;
        //addr = 8'b01101010;
        test_rom;
        $finish;
    end

endmodule