
/****** enc_multiplicator.sv *******/

// Inputs: 16+4 inputs, 8 bits each
// Outputs: 1 output, 16 bits

`include "comp_mul_2to1.sv"
`include "comp_sum_4to1.sv"

module mod_enc_multiplicator(clk, 
                            val1m0, val1m1, val1m2, val1m3, val1m4, val1m5, val1m6, val1m7, val1m8, val1m9, val1m10, val1m11, val1m12, val1m13, val1m14, val1m15,
                            val2m0, val2m1, val2m2, val2m3, val2m4, val2m5, val2m6, val2m7, val2m8, val2m9, val2m10, val2m11, val2m12, val2m13, val2m14, val2m15,
                            outm0, outm1, outm2, outm3, outm4, outm5, outm6, outm7, outm8, outm9, outm10, outm11, outm12, outm13, outm14, outm15,
                            carrym0, carrym1, carrym2, carrym3, carrym4, carrym5, carrym6, carrym7, carrym8, carrym9, carrym10, carrym11, carrym12, carrym13, carrym14, carrym15,
                            outs0, outs1, outs2, outs3,
                            carrys0, carrys1, carrys2, carrys3,
                            out0, out1, out2, out3);
    
    input clk;

    input [7:0] val1m0;     input [7:0] val2m0;
    input [7:0] val1m1;     input [7:0] val2m1;
    input [7:0] val1m2;     input [7:0] val2m2;
    input [7:0] val1m3;     input [7:0] val2m3;
    input [7:0] val1m4;     input [7:0] val2m4;
    input [7:0] val1m5;     input [7:0] val2m5;
    input [7:0] val1m6;     input [7:0] val2m6;
    input [7:0] val1m7;     input [7:0] val2m7;
    input [7:0] val1m8;     input [7:0] val2m8;
    input [7:0] val1m9;     input [7:0] val2m9;
    input [7:0] val1m10;    input [7:0] val2m10;
    input [7:0] val1m11;    input [7:0] val2m11;
    input [7:0] val1m12;    input [7:0] val2m12;
    input [7:0] val1m13;    input [7:0] val2m13;
    input [7:0] val1m14;    input [7:0] val2m14;
    input [7:0] val1m15;    input [7:0] val2m15;

    /*
    input [7:0] val2m0;
    input [7:0] val2m1;
    input [7:0] val2m2;
    input [7:0] val2m3;
    input [7:0] val2m4;
    input [7:0] val2m5;
    input [7:0] val2m6;
    input [7:0] val2m7;
    input [7:0] val2m8;
    input [7:0] val2m9;
    input [7:0] val2m10;
    input [7:0] val2m11;
    input [7:0] val2m12;
    input [7:0] val2m13;
    input [7:0] val2m14;
    input [7:0] val2m15;
    */

    output [15:0]   outm0;  output [15:0]   outm8;
    output [15:0]   outm1;  output [15:0]   outm9;
    output [15:0]   outm2;  output [15:0]   outm10;
    output [15:0]   outm3;  output [15:0]   outm11;
    output [15:0]   outm4;  output [15:0]   outm12;
    output [15:0]   outm5;  output [15:0]   outm13;
    output [15:0]   outm6;  output [15:0]   outm14;
    output [15:0]   outm7;  output [15:0]   outm15;

    output [15:0]   outs0;
    output [15:0]   outs1;
    output [15:0]   outs2;
    output [15:0]   outs3;
    
    output [15:0]   out0;
    output [15:0]   out1;
    output [15:0]   out2;
    output [15:0]   out3;

    output          carrym0;    output      carrym8;
    output          carrym1;    output      carrym9;    
    output          carrym2;    output      carrym10;
    output          carrym3;    output      carrym11;
    output          carrym4;    output      carrym12;
    output          carrym5;    output      carrym13;
    output          carrym6;    output      carrym14;
    output          carrym7;    output      carrym15;

    output          carrys0;
    output          carrys1;
    output          carrys2;
    output          carrys3;

    comp_mul_2to1 m0(clk, val1m0, val2m0, outm0, carrym0);
    comp_mul_2to1 m1(clk, val1m1, val2m1, outm1, carrym1);
    comp_mul_2to1 m2(clk, val1m2, val2m2, outm2, carrym2);
    comp_mul_2to1 m3(clk, val1m3, val2m3, outm3, carrym3);

    comp_mul_2to1 m4(clk, val1m4, val2m4, outm4, carrym4);
    comp_mul_2to1 m5(clk, val1m5, val2m5, outm5, carrym5);
    comp_mul_2to1 m6(clk, val1m6, val2m6, outm6, carrym6);
    comp_mul_2to1 m7(clk, val1m7, val2m7, outm7, carrym7);

    comp_mul_2to1 m8(clk, val1m8, val2m8, outm8, carrym8);
    comp_mul_2to1 m9(clk, val1m9, val2m9, outm9, carrym9);
    comp_mul_2to1 m10(clk, val1m10, val2m10, outm10, carrym10);
    comp_mul_2to1 m11(clk, val1m11, val2m11, outm11, carrym11);

    comp_mul_2to1 m12(clk, val1m12, val2m12, outm12, carrym12);
    comp_mul_2to1 m13(clk, val1m13, val2m13, outm13, carrym13);
    comp_mul_2to1 m14(clk, val1m14, val2m14, outm14, carrym14);
    comp_mul_2to1 m15(clk, val1m15, val2m15, outm15, carrym15);

    comp_sum_4to1 s0(clk, outm0, outm1, outm2, outm3, outs0, carrys0);
    comp_sum_4to1 s1(clk, outm4, outm5, outm6, outm7, outs1, carrys1); 
    comp_sum_4to1 s2(clk, outm8, outm9, outm10, outm11, outs2, carrys2);
    comp_sum_4to1 s3(clk, outm12, outm13, outm14, outm15, outs3, carrys3);

    
    assign out0 = outs0;
    assign out1 = outs1;
    assign out2 = outs2;
    assign out3 = outs3;  

endmodule