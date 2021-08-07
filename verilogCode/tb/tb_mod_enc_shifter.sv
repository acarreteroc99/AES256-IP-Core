

module tb_mod_enc_shifter();

    /* verilator lint_off UNOPTFLAT */
    reg clk;

    reg [7:0] p00;
    reg [7:0] p01;
    reg [7:0] p02;
    reg [7:0] p03;
    reg [7:0] p10;
    reg [7:0] p11;
    reg [7:0] p12;
    reg [7:0] p13;
    reg [7:0] p20;
    reg [7:0] p21;
    reg [7:0] p22;
    reg [7:0] p23;
    reg [7:0] p30;
    reg [7:0] p31;
    reg [7:0] p32;
    reg [7:0] p33;

    reg [7:0] o00;
    reg [7:0] o01;
    reg [7:0] o02;
    reg [7:0] o03;
    reg [7:0] o10;
    reg [7:0] o11;
    reg [7:0] o12;
    reg [7:0] o13;
    reg [7:0] o20;
    reg [7:0] o21;
    reg [7:0] o22;
    reg [7:0] o23;
    reg [7:0] o30;
    reg [7:0] o31;
    reg [7:0] o32;
    reg [7:0] o33;

    mod_enc_shifter DUT (.clk(clk), 
                        .p00(p00), .p01(p01), .p02(p02), .p03(p03), .p10(p10), .p11(p11), .p12(p12), .p13(p13), .p20(p20), .p21(p21), .p22(p22), .p23(p23), .p30(p30), .p31(p31), .p32(p32), .p33(p33),
                        .o00(o00), .o01(o01), .o02(o02), .o03(o03), .o10(o10), .o11(o11), .o12(o12), .o13(o13), .o20(o20), .o21(o21), .o22(o22), .o23(o23), .o30(o30), .o31(o31), .o32(o32), .o33(o33)
                        );

    // Clock signal generation
    /* verilator lint_off STMTDLY */            // Used to disable a warning message regarding delaying clock signal.
    always #100 clk = !clk;      

    initial begin
        p00 = 8'h00; //8'hD4;
        p01 = 8'h01; //8'hE0;
        p02 = 8'h02; //8'hB8;
        p03 = 8'h03; //8'h1E;
        
        p10 = 8'h10; //8'h27;
        p11 = 8'h11; //8'hBF;
        p12 = 8'h12; //8'hB4;
        p13 = 8'h13; //8'h41;

        p20 = 8'h20; //8'h11;
        p21 = 8'h21; //8'h98;
        p22 = 8'h22; //8'h5D;
        p23 = 8'h23; //8'h52;

        p30 = 8'h30; //8'hAE;
        p31 = 8'h31; //8'hF1;
        p32 = 8'h32; //8'hE5;
        p33 = 8'h33; //8'h30;
    end

    task testShifter;
    /* The purpose of this variables were to nest two for loops and print all the numbers, 
    but seems to not be possible chaning variable names on the fly. */
        //reg [1:0] x;
        //reg [1:0] y;
        begin
            // ------------ Row 1 ------------
            if(o00 == p00)
                $display("Correct value for o00: %h \n", p00);
            else
                $display("Something not working properly \n");
            if(o01 == p01)
                $display("Correct value for o01: %h \n", p01);
            else
                $display("Something not working properly \n");
            if(o02 == p02)
                $display("Correct value for o02: %h \n", p02);
            else
                $display("Something not working properly \n");
            if(o03 == p03)
                $display("Correct value for o03: %h \n", p03);
            else
                $display("Something not working properly \n");

            // ----------- Row 2 ------------
            if(o10 == p13)
                $display("Correct value for o10: %h \n", p13);
            else
                $display("Something not working properly \n");
            if(o11 == p10)
                $display("Correct value for o11: %h \n", p10);
            else
                $display("Something not working properly \n");
            if(o12 == p11)
                $display("Correct value for o12: %h \n", p11);
            else
                $display("Something not working properly \n");
            if(o13 == p12)
                $display("Correct value for o13: %h \n", p12);
            else
                $display("Something not working properly \n");

            // ------------ Row 3 ------------
            if(o20 == p22)
                $display("Correct value for o20: %h \n", p22);
            else
                $display("Something not working properly \n");
            if(o21 == p23)
                $display("Correct value for o21: %h \n", p23);
            else
                $display("Something not working properly \n");
            if(o22 == p20)
                $display("Correct value for o22: %h \n", p20);
            else
                $display("Something not working properly \n");
            if(o23 == p21)
                $display("Correct value for o23: %h \n", p21);
            else
                $display("Something not working properly \n");
            
            // ------------ Row 4 ------------
            if(o30 == p31)
                $display("Correct value for o30: %h \n", p31);
            else
                $display("Something not working properly \n");
            if(o31 == p32)
                $display("Correct value for o31: %h \n", p32);
            else
                $display("Something not working properly \n");
            if(o32 == p33)
                $display("Correct value for o32: %h \n", p33);
            else
                $display("Something not working properly \n");
            if(o33 == p30)
                $display("Correct value for o33: %h \n", p30);
            else
                $display("Something not working properly \n");
        end
    endtask 

endmodule