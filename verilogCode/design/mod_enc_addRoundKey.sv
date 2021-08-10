


module mod_enc_addRoundKey(clk,
                    p00, p01, p02, p03, p10, p11, p12, p13, p20, p21, p22, p23, p30, p31, p32, p33,
                    k00, k01, k02, k03, k10, k11, k12, k13, k20, k21, k22, k23, k30, k31, k32, k33,
                    out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15
                    );

    /* verilator lint_off UNUSED */
    input clk;
    input [15:0][7:0] p;

    input [7:0] p00;     input [7:0] k00;
    input [7:0] p01;     input [7:0] k01;
    input [7:0] p02;     input [7:0] k02;
    input [7:0] p03;     input [7:0] k03;
    input [7:0] p10;     input [7:0] k10;
    input [7:0] p11;     input [7:0] k11;
    input [7:0] p12;     input [7:0] k12;
    input [7:0] p13;     input [7:0] k13;
    input [7:0] p20;     input [7:0] k20;
    input [7:0] p21;     input [7:0] k21;
    input [7:0] p22;    input [7:0] k22;
    input [7:0] p23;    input [7:0] k23;
    input [7:0] p30;    input [7:0] k30;
    input [7:0] p31;    input [7:0] k31;
    input [7:0] p32;    input [7:0] k32;
    input [7:0] p33;    input [7:0] k33;

    output [7:0]   out0;  output [7:0]   out8;
    output [7:0]   out1;  output [7:0]   out9;
    output [7:0]   out2;  output [7:0]   out10;
    output [7:0]   out3;  output [7:0]   out11;
    output [7:0]   out4;  output [7:0]   out12;
    output [7:0]   out5;  output [7:0]   out13;
    output [7:0]   out6;  output [7:0]   out14;
    output [7:0]   out7;  output [7:0]   out15;

    // Pasar esto a for's
    for...
        p00[3]

    assign out0 = p00 ^ k00;
    assign out1 = p01 ^ k01;
    assign out2 = p02 ^ k02;
    assign out3 = p03 ^ k03;
    assign out4 = p10 ^ k10;
    assign out5 = p11 ^ k11;
    assign out6 = p12 ^ k12;
    assign out7 = p13 ^ k13;
    assign out8 = p20 ^ k20;
    assign out9 = p21 ^ k21;
    assign out10 = p22 ^ k22;
    assign out11 = p23 ^ k23;
    assign out12 = p30 ^ k30;
    assign out13 = p31 ^ k31;
    assign out14 = p32 ^ k32;
    assign out15 = p33 ^ k33;
    
endmodule