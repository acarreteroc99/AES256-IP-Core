
`include "../../design/mod_enc_shifter.sv"

module tb_mod_enc_shifter2();

    /* verilator lint_off UNOPTFLAT */
    //reg clk;

    reg [15:0][7:0] in;
    wire [15:0][7:0] out;

    mod_enc_shifter DUT (//.clk(clk), 
                            .in(in), .out(out)
                        );

    // Clock signal generation
    /* verilator lint_off STMTDLY */            // Used to disable a warning message regarding delaying clock signal.
    //always #100 clk = !clk;      

    initial begin

        $dumpfile("wv_mod_enc_shifter.vcd");
            $dumpvars(0, tb_mod_enc_shifter2);

        in[0] = 8'h00; //8'hD4;
        in[1] = 8'h01; //8'hE0;
        in[2] = 8'h02; //8'hB8;
        in[3] = 8'h03; //8'h1E;
    
        in[4] = 8'h10; //8'h27;
        in[5] = 8'h11; //8'hBF;
        in[6] = 8'h12; //8'hB4;
        in[7] = 8'h13; //8'h41;

        in[8] = 8'h20; //8'h11;
        in[9] = 8'h21; //8'h98;
        in[10] = 8'h22; //8'h5D;
        in[11] = 8'h23; //8'h52;

        in[12] = 8'h30; //8'hAE;
        in[13] = 8'h31; //8'hF1;
        in[14] = 8'h32; //8'hE5;
        in[15] = 8'h33; //8'h30;

        // ------------ Row 1 ------------
        if(out[0] == in[0])
            $display("Correct value for o00: %h \n", in[0]);
        else
            $display("Something not working properly %h \n", out[0]);
        if(out[1] == in[1])
            $display("Correct value for o01: %h \n", in[1]);
        else
            $display("Something not working properly \n");
        if(out[2] == in[2])
            $display("Correct value for o02: %h \n", in[2]);
        else
            $display("Something not working properly \n");
        if(out[3] == in[3])
            $display("Correct value for o03: %h \n", in[3]);
        else
            $display("Something not working properly \n");

        // ----------- Row 2 ------------
        if(out[4] == in[7])
            $display("Correct value for o10: %h \n", in[7]);
        else
            $display("Something not working properly \n");
        if(out[5] == in[4])
            $display("Correct value for o11: %h \n", in[4]);
        else
            $display("Something not working properly \n");
        if(out[6] == in[5])
            $display("Correct value for o12: %h \n", in[5]);
        else
            $display("Something not working properly \n");
        if(out[7] == in[6])
            $display("Correct value for o13: %h \n", in[6]);
        else
            $display("Something not working properly \n");

        // ------------ Row 3 ------------
        if(out[8] == in[10])
            $display("Correct value for o20: %h \n", in[10]);
        else
            $display("Something not working properly \n");
        if(out[9] == in[11])
            $display("Correct value for o21: %h \n", in[11]);
        else
            $display("Something not working properly \n");
        if(out[10] == in[8])
            $display("Correct value for o22: %h \n", in[8]);
        else
            $display("Something not working properly \n");
        if(out[11] == in[9])
            $display("Correct value for o23: %h \n", in[9]);
        else
            $display("Something not working properly \n");
        
        // ------------ Row 4 ------------
        if(out[12] == in[13])
            $display("Correct value for o30: %h \n", in[13]);
        else
            $display("Something not working properly \n");
        if(out[13] == in[14])
            $display("Correct value for o31: %h \n", in[14]);
        else
            $display("Something not working properly \n");
        if(out[14] == in[15])
            $display("Correct value for o32: %h \n", in[15]);
        else
            $display("Something not working properly \n");
        if(out[15] == in[12])
            $display("Correct value for o33: %h \n", in[12]);
        else
            $display("Something not working properly \n");
    end

endmodule