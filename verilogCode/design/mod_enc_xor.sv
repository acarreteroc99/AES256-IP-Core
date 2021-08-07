


module mod_enc_xor(clk,
                    p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15,
                    k0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15,
                    out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15
                    );

    input clk;

    input [7:0] p0;     input [7:0] k0;
    input [7:0] p1;     input [7:0] k1;
    input [7:0] p2;     input [7:0] k2;
    input [7:0] p3;     input [7:0] k3;
    input [7:0] p4;     input [7:0] k4;
    input [7:0] p5;     input [7:0] k5;
    input [7:0] p6;     input [7:0] k6;
    input [7:0] p7;     input [7:0] k7;
    input [7:0] p8;     input [7:0] k8;
    input [7:0] p9;     input [7:0] k9;
    input [7:0] p10;    input [7:0] k10;
    input [7:0] p11;    input [7:0] k11;
    input [7:0] p12;    input [7:0] k12;
    input [7:0] p13;    input [7:0] k13;
    input [7:0] p14;    input [7:0] k14;
    input [7:0] p15;    input [7:0] k15;

    output [15:0]   out0;  output [15:0]   out8;
    output [15:0]   out1;  output [15:0]   out9;
    output [15:0]   out2;  output [15:0]   out10;
    output [15:0]   out3;  output [15:0]   out11;
    output [15:0]   out4;  output [15:0]   out12;
    output [15:0]   out5;  output [15:0]   out13;
    output [15:0]   out6;  output [15:0]   out14;
    output [15:0]   out7;  output [15:0]   out15;

    reg [7:0] aux0;     
    reg [7:0] aux1;     
    reg [7:0] aux2;    
    reg [7:0] aux3;     
    reg [7:0] aux4;     
    reg [7:0] aux5;     
    reg [7:0] aux6;     
    reg [7:0] aux7;     
    reg [7:0] aux8;     
    reg [7:0] aux9;     
    reg [7:0] aux10;    
    reg [7:0] aux11;    
    reg [7:0] aux12;    
    reg [7:0] aux13;    
    reg [7:0] aux14;    
    reg [7:0] aux15;    


    /*
    aux0 = p0 ^ k0;
    aux1 = p1 ^ k1;
    aux2 = p2 ^ k2;
    aux3 = p3 ^ k3;
    aux4 = p4 ^ k4;
    aux5 = p5 ^ k5;
    aux6 = p6 ^ k6;
    aux7 = p7 ^ k7;
    aux8 = p8 ^ k8;
    aux9 = p9 ^ k9;
    aux10 = p10 ^ k10;
    aux11 = p11 ^ k11;
    aux12 = p12 ^ k12;
    aux13 = p13 ^ k13;
    aux14 = p14 ^ k14;
    aux15 = p15 ^ k15;
    */

    
    assign aux0 = p0 ^ k0;
    assign aux1 = p1 ^ k1;
    assign aux2 = p2 ^ k2;
    assign aux3 = p3 ^ k3;
    assign aux4 = p4 ^ k4;
    assign aux5 = p5 ^ k5;
    assign aux6 = p6 ^ k6;
    assign aux7 = p7 ^ k7;
    assign aux8 = p8 ^ k8;
    assign aux9 = p9 ^ k9;
    assign aux10 = p10 ^ k10;
    assign aux11 = p11 ^ k11;
    assign aux12 = p12 ^ k12;
    assign aux13 = p13 ^ k13;
    assign aux14 = p14 ^ k14;
    assign aux15 = p15 ^ k15;
    

    assign out0 = aux0;
    assign out1 = aux1;
    assign out2 = aux2;
    assign out3 = aux3;
    assign out4 = aux4;
    assign out5 = aux5;
    assign out6 = aux6;
    assign out7 = aux7;
    assign out8 = aux8;
    assign out9 = aux9;
    assign out10 = aux10;
    assign out11 = aux11;
    assign out12 = aux12;
    assign out13 = aux13;
    assign out14 = aux14;
    assign out15 = aux15;

endmodule