
`include "../design/enc/mod_enc_shifter.sv"

`timescale 1ns/10ps     //time-unit = 1 ns, precision 10 ps

module tb_mod_enc_shifter();


    localparam period = 20;
    localparam N = 4;
    integer index;

    reg clk;
    reg [(N-1):0][7:0] p00;
    reg [1:0] row;

    wire [(N-1):0][7:0] o00;

    mod_enc_shifter DUT (.clk(clk), 
                        .inp(p00), .row(row),
                        .outp(o00)
                        );

    // Clock signal generation
    /* verilator lint_off STMTDLY */            // Used to disable a warning message regarding delaying clock signal.
    always #100 clk = !clk;     

    initial begin

        $dumpfile("wv_mod_enc_shifter.vcd");
            $dumpvars(0, tb_mod_enc_shifter);

        p00[0] = 8'h00;
        for(index=1; index < N; index=index+1)
            p00[index] = p00[index-1] + 8'h01;
        
    end

    task test_shifter_row0;
    //input [1:0] row;
    begin
        #period;

        // ----------- Row 0 ------------
        if(o00[0] == p00[0])
            $display("Correct value for o00: %h \n", o00[0]);
        else
            $display("Something not working properly: %h\n", o00[0]);
        if(o00[1] == p00[1])
            $display("Correct value for o01: %h \n", o00[1]);
        else
            $display("Something not working properly: %h \n", o00[1]);
        if(o00[2] == p00[2])
            $display("Correct value for o02: %h \n", o00[2]);
        else
            $display("Something not working properly: %h \n", o00[2]);
        if(o00[3] == p00[3])
            $display("Correct value for o03: %h \n", o00[3]);
        else
            $display("Something not working properly: %h \n", o00[3]);

    end
    endtask

    task test_shifter_row1;
    //input [1:0] row;
    begin
        #period;

        // ----------- Row 1 ------------
        if(o00[0] == p00[1])
            $display("Correct value for o10: %h \n", o00[0]);
        else
            $display("Something not working properly: %h \n", o00[0]);
        if(o00[1] == p00[2])
            $display("Correct value for o11: %h \n", o00[1]);
        else
            $display("Something not working properly: %h \n", o00[1]);
        if(o00[2] == p00[3])
            $display("Correct value for o12: %h \n", o00[2]);
        else
            $display("Something not working properly: %h \n", o00[2]);
        if(o00[3] == p00[0])
            $display("Correct value for o13: %h \n", o00[3]);
        else
            $display("Something not working properly: %h \n", o00[3]);

    end
    endtask

    task test_shifter_row2;
    //input [1:0] row;
    begin
        #period;

        // ------------ Row 2 ------------
        if(o00[0] == p00[2])
            $display("Correct value for o20: %h \n", o00[0]);
        else
            $display("Something not working properly \n");
        if(o00[1] == p00[3])
            $display("Correct value for o21: %h \n", o00[1]);
        else
            $display("Something not working properly \n");
        if(o00[2] == p00[0])
            $display("Correct value for o22: %h \n", o00[2]);
        else
            $display("Something not working properly \n");
        if(o00[3] == p00[1])
            $display("Correct value for o23: %h \n", o00[3]);
        else
            $display("Something not working properly \n");

    end
    endtask

    task test_shifter_row3;
    //input [1:0] row;
    begin
        #period;
        
        // ------------ Row 3 ------------
        if(o00[0] == p00[3])
            $display("Correct value for o30: %h \n", o00[0]);
        else
            $display("Something not working properly \n");
        if(o00[1] == p00[0])
            $display("Correct value for o31: %h \n", o00[1]);
        else
            $display("Something not working properly \n");
        if(o00[2] == p00[1])
            $display("Correct value for o32: %h \n", o00[2]);
        else
            $display("Something not working properly \n");
        if(o00[3] == p00[2])
            $display("Correct value for o33: %h \n", o00[3]);
        else
            $display("Something not working properly \n");

    end
    endtask

    initial 
    begin
        clk = 1'b0;
        row = 2'b00;
        test_shifter_row0;
        row = 2'b01;
        test_shifter_row1;
        row = 2'b10;
        test_shifter_row2;
        row = 2'b11;
        test_shifter_row3;
        $finish;
    end

endmodule