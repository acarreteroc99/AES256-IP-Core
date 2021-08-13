


`include "../../design/mod_keygen_shifter.sv"

`timescale 1ns/10ps     //time-unit = 1 ns, precision 10 ps

module tb_mod_keygen_shifter();

    /* verilator lint_off UNOPTFLAT */
    reg clk;
    reg [3:0][7:0] p;

    wire [3:0][7:0] o;

    localparam period = 20;
    localparam N = 4;
    integer index;

    mod_keygen_shifter DUT (.clk(clk), 
                        .i(p),
                        .o(o)
                        );

    // Clock signal generation
    /* verilator lint_off STMTDLY */            // Used to disable a warning message regarding delaying clock signal.
    always #100 clk = !clk;   

    initial begin

        $dumpfile("wv_mod_keygen_shifter.vcd");
            $dumpvars(0, tb_mod_keygen_shifter);

        p[0] = 8'h00;
        for(index=1; index < N; index=index+1)
            p[index] = p[index-1] + 8'h01;
        
        
    end

    task test_upShifter;
    begin
        for(index=0; index < N-1; index=index+1)
        begin
            if(o[index] == p[index+1])
                $display("Correct value for o[%d]: %h \n", index, o[index]);
            else
                $display("Something not working properly \n");
        end
            if(o[N-1] == p[0])
                $display("Correct value for o[%d]: %h \n", N-1, o[N-1]);
            else
                $display("Something not working properly \n");
        $stop;   // end of simulation
    end
    endtask

    initial 
    begin
        clk = 1'b0;
        test_upShifter;
    end

endmodule