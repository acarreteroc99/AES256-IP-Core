


`include "../../design/mod_keygen_shifter.sv"

`timescale 1ns/10ps     //time-unit = 1 ns, precision 10 ps

module tb_mod_keygen_shifter();

    /* verilator lint_off UNOPTFLAT */
    reg clk;
    reg [3:0][7:0] p;

    wire [3:0][7:0] o;

    localparam period = 20;

    mod_keygen_shifter DUT (.clk(clk), 
                        .i(p),
                        .o(o)
                        );

    // Clock signal generation
    /* verilator lint_off STMTDLY */            // Used to disable a warning message regarding delaying clock signal.
    always
    begin
        clk = 1'b1;
        #20;

        clk = 1'b0;
        #20;
    end     

    initial begin

        $dumpfile("wv_mod_keygen_shifter.vcd");
            $dumpvars(0, tb_mod_keygen_shifter);

        p[0] = 8'h00; //8'hD4;
        p[1] = 8'h01; //8'hE0;
        p[2] = 8'h02; //8'hB8;
        p[3] = 8'h03; //8'h1E;
        
        
    end

    always @(posedge clk)
    begin
        if(o[0] == p[1])
            $display("Correct value for o00: %h \n", o[0]);
        else
            $display("Something not working properly %h \n");
        if(o[1] == p[2])
            $display("Correct value for o01: %h \n", o[1]);
        else
            $display("Something not working properly \n");
        if(o[2] == p[3])
            $display("Correct value for o02: %h \n", o[2]);
        else
            $display("Something not working properly \n");
        if(o[3] == p[0])
            $display("Correct value for o03: %h \n", o[3]);
        else
            $display("Something not working properly \n");

        $stop;   // end of simulation
    end

endmodule