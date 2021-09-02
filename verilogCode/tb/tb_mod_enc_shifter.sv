
`include "../design/enc/mod_enc_shifter.sv"

`timescale 1ns/10ps     //time-unit = 1 ns, precision 10 ps

module tb_mod_enc_shifter();


    localparam period = 20;
    localparam N = 4;
    integer index;

    reg clk, resetn, wr_en;
    reg [(N-1):0][7:0] p00;

    wire [(N-1):0][7:0] o00;
    wire done;

    mod_enc_shifter DUT (.clk(clk), .resetn(resetn), .wr_en(wr_en),
                        .inp(p00),
                        .outp(o00), .done(done)
                        );

    // Clock signal generation
    /* verilator lint_off STMTDLY */            // Used to disable a warning message regarding delaying clock signal.
    always #10 clk = !clk;     

    initial begin

        $dumpfile("wv_mod_enc_shifter.vcd");
            $dumpvars(0, tb_mod_enc_shifter);

        p00[0] = 8'h00;
        for(index=1; index < N; index=index+1)
            p00[index] = p00[index-1] + 8'h01;
        
    end

    task test_shifter_row0;
    
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

        //$display("Status for DONE signal is: ", done);

    end
    endtask

    task test_shifter_row1;
 
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

        //$display("Status for DONE signal is: ", done);

    end
    endtask

    task test_shifter_row2;
    
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

        //$display("Status for DONE signal is: ", done);

    end
    endtask

    task test_shifter_row3;
    
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

        //$display("Status for DONE signal is: ", done);

    end
    endtask

    initial 
    begin
        clk = 1'b0;
        resetn = 1'b0;
        #period resetn = 1'b1;

        @(posedge clk);
        wr_en = 0;
        test_shifter_row0;
        wr_en = 1;
        
        #period;
        @(posedge clk);
        wr_en = 0;
        test_shifter_row1;
        #period wr_en = 1;

        #period;
        @(posedge clk);
        wr_en = 0;
        test_shifter_row2;
        #period wr_en = 1;

        #period;
        @(posedge clk);
        wr_en = 0;
        test_shifter_row3;
        #period wr_en = 1;

        $finish;
    end

endmodule