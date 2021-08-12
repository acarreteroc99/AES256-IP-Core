
`include "../../design/mod_enc_shifter.sv"

`timescale 1ns/10ps     //time-unit = 1 ns, precision 10 ps

module tb_mod_enc_shifter();

    /* verilator lint_off UNOPTFLAT */
    reg clk;
    reg [15:0][7:0] p00;

    wire [15:0][7:0] o00;

    localparam period = 20;

    mod_enc_shifter DUT (.clk(clk), 
                        .in(p00),
                        .out(o00)
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

        $dumpfile("wv_mod_enc_shifter.vcd");
            $dumpvars(0, tb_mod_enc_shifter);

        p00[0] = 8'h00; //8'hD4;
        p00[1] = 8'h01; //8'hE0;
        p00[2] = 8'h02; //8'hB8;
        p00[3] = 8'h03; //8'h1E;
        
        p00[4] = 8'h10; //8'h27;
        p00[5] = 8'h11; //8'hBF;
        p00[6] = 8'h12; //8'hB4;
        p00[7] = 8'h13; //8'h41;

        p00[8] = 8'h20; //8'h11;
        p00[9] = 8'h21; //8'h98;
        p00[10] = 8'h22; //8'h5D;
        p00[11] = 8'h23; //8'h52;

        p00[12] = 8'h30; //8'hAE;
        p00[13] = 8'h31; //8'hF1;
        p00[14] = 8'h32; //8'hE5;
        p00[15] = 8'h33; //8'h30;
        
    end

    always @(posedge clk)
    begin
        if(o00[0] == p00[0])
            $display("Correct value for o00: %h \n", o00[0]);
        else
            $display("Something not working properly %h \n", p00[0]);
        if(o00[1] == p00[1])
            $display("Correct value for o01: %h \n", o00[1]);
        else
            $display("Something not working properly \n");
        if(o00[2] == p00[2])
            $display("Correct value for o02: %h \n", o00[2]);
        else
            $display("Something not working properly \n");
        if(o00[3] == p00[3])
            $display("Correct value for o03: %h \n", o00[3]);
        else
            $display("Something not working properly \n");

        // ----------- Row 2 ------------
        if(o00[4] == p00[7])
            $display("Correct value for o10: %h \n", o00[4]);
        else
            $display("Something not working properly \n");
        if(o00[5] == p00[4])
            $display("Correct value for o11: %h \n", o00[5]);
        else
            $display("Something not working properly \n");
        if(o00[6] == p00[5])
            $display("Correct value for o12: %h \n", o00[6]);
        else
            $display("Something not working properly \n");
        if(o00[7] == p00[6])
            $display("Correct value for o13: %h \n", o00[7]);
        else
            $display("Something not working properly \n");

        // ------------ Row 3 ------------
        if(o00[8] == p00[10])
            $display("Correct value for o20: %h \n", o00[8]);
        else
            $display("Something not working properly \n");
        if(o00[9] == p00[11])
            $display("Correct value for o21: %h \n", o00[9]);
        else
            $display("Something not working properly \n");
        if(o00[10] == p00[8])
            $display("Correct value for o22: %h \n", o00[10]);
        else
            $display("Something not working properly \n");
        if(o00[11] == p00[9])
            $display("Correct value for o23: %h \n", o00[11]);
        else
            $display("Something not working properly \n");
        
        // ------------ Row 4 ------------
        if(o00[12] == p00[13])
            $display("Correct value for o30: %h \n", o00[12]);
        else
            $display("Something not working properly \n");
        if(o00[13] == p00[14])
            $display("Correct value for o31: %h \n", o00[13]);
        else
            $display("Something not working properly \n");
        if(o00[14] == p00[15])
            $display("Correct value for o32: %h \n", o00[14]);
        else
            $display("Something not working properly \n");
        if(o00[15] == p00[12])
            $display("Correct value for o33: %h \n", o00[15]);
        else
            $display("Something not working properly \n");

        $stop;   // end of simulation
    end

endmodule