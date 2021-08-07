
`include "../design/mod_enc_multiplicator.sv"

module tb_mod_enc_multiplicator();

    reg clk;

    reg [7:0] a0;       reg [7:0] b0;
    reg [7:0] a1;       reg [7:0] b1;
    reg [7:0] a2;       reg [7:0] b2;
    reg [7:0] a3;       reg [7:0] b3;
    reg [7:0] a4;       reg [7:0] b4;
    reg [7:0] a5;       reg [7:0] b5;
    reg [7:0] a6;       reg [7:0] b6;
    reg [7:0] a7;       reg [7:0] b7;
    reg [7:0] a8;       reg [7:0] b8;
    reg [7:0] a9;       reg [7:0] b9;
    reg [7:0] a10;      reg [7:0] b10;
    reg [7:0] a11;      reg [7:0] b11;
    reg [7:0] a12;      reg [7:0] b12;
    reg [7:0] a13;      reg [7:0] b13;
    reg [7:0] a14;      reg [7:0] b14;
    reg [7:0] a15;      reg [7:0] b15;

    reg [15:0]   om0;  reg [15:0]   om8;
    reg [15:0]   om1;  reg [15:0]   om9;
    reg [15:0]   om2;  reg [15:0]   om10;
    reg [15:0]   om3;  reg [15:0]   om11;
    reg [15:0]   om4;  reg [15:0]   om12;
    reg [15:0]   om5;  reg [15:0]   om13;
    reg [15:0]   om6;  reg [15:0]   om14;
    reg [15:0]   om7;  reg [15:0]   om15;

    reg [15:0]   os0;
    reg [15:0]   os1;
    reg [15:0]   os2;
    reg [15:0]   os3;

    reg [15:0]   o0;
    reg [15:0]   o1;
    reg [15:0]   o2;
    reg [15:0]   o3;

    reg          cm0;    reg        cm8;
    reg          cm1;    reg        cm9;    
    reg          cm2;    reg        cm10;
    reg          cm3;    reg        cm11;
    reg          cm4;    reg        cm12;
    reg          cm5;    reg        cm13;
    reg          cm6;    reg        cm14;
    reg          cm7;    reg        cm15;

    reg          cs0;
    reg          cs1;
    reg          cs2;
    reg          cs3;

    mod_enc_multiplicador DUT(
                                .clk    (clk),
                                .val1m0 (a0), .val1m1 (a1), .val1m2 (a2), .val1m3 (a3), .val1m4 (a4), .val1m5 (a5), .val1m6 (a6), .val1m7 (a7), .val1m8 (a8), .val1m9 (a9), .val1m10 (a10), .val1m11 (a11), .val1m12 (a12), .val1m13 (a13), .val1m14 (a14), .val1m15 (a15),
                                .val2m0 (b0), .val2m1 (b1), .val2m2 (b2), .val2m3 (b3), .val2m4 (b4), .val2m5 (b5), .val2m6 (b6), .val2m7 (b7), .val2m8 (b8), .val2m9 (b9), .val2m10 (b10), .val2m11 (b11), .val2m12 (b12), .val2m13 (b13), .val2m14 (b14), .val2m15 (b15),
                                .outm0 (om0), .outm1 (om1), .outm2 (om2), .outm3 (om3), .outm4 (om4), .outm5 (om5), .outm6 (om6), .outm7(om7), .outm8 (om8), .outm9 (om9), .outm10 (om10), .outm11 (om11), .outm12 (om12), .outm13 (om13), .outm14 (om14), .outm15 (om15),
                                .carrym0 (cm0), .carrym1 (cm1), .carrym2 (cm2), .carrym3 (cm3), .carrym4 (cm4), .carrym5 (cm5), .carrym6 (cm6), .carrym7 (cm7), .carrym8 (cm8), .carrym9 (cm9), .carrym10 (c10), .carrym11 (cm11), .carrym12 (cm12), .carrym13 (cm13), .carrym14 (cm14), .carrym15 (cm15),
                                .outs0 (os0), .outs1 (os1), .outs2 (os2), .outs3 (os3),
                                .carrys0 (cs0), .carrys1 (cs1), .carrys2 (cs2), .carrys3 (cs3),
                                .out0 (o0), .out1 (o1), .out2 (o2), .out3 (o3)
                            );

    // Clock generation
    always
        #100 clk = !clk;

    // Clock initialization
    initial
        begin
            clk = 1'b1;

            //Matrix A
            a0 = ;        a1 = ;        a2 = ;        a3 = ;        
            a4 = ;        a5 = ;        a6 = ;        a7 = ;       
            a8 = ;        a9 = ;        a10 = ;       a11 = ;       
            a12 = ;       a13 = ;       a14 = ;       a15 = ;       

            //Matrix B
            b0 = ;        b1 = ;        b2 = ;        b3 = ;        
            b4 = ;        b5 = ;        b6 = ;        b7 = ;       
            b8 = ;        b9 = ;        b10 = ;       b11 = ;       
            b12 = ;       b13 = ;       b14 = ;       b15 = ;  

        end

endmodule