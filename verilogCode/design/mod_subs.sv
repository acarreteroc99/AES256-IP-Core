


module mod_subs(clk, load,
                p00, p01, p02, p03, p10, p11, p12, p13, p20, p21, p22, p23, p30, p31, p32, p33,
                o00, o01, o02, o03, o10, o11, o12, o13, o20, o21, o22, o23, o30, o31, o32, o33
                );

        /* verilator lint_off UNUSED */
    input clk;
    input load;

    input [7:0] p00;
    input [7:0] p01;
    input [7:0] p02;
    input [7:0] p03;
    input [7:0] p10;
    input [7:0] p11;
    input [7:0] p12;
    input [7:0] p13;
    input [7:0] p20;
    input [7:0] p21;
    input [7:0] p22;
    input [7:0] p23;
    input [7:0] p30;
    input [7:0] p31;
    input [7:0] p32;
    input [7:0] p33;

    wire [7:0] io00;
    wire [7:0] io01;
    wire [7:0] io02;
    wire [7:0] io03;
    wire [7:0] io10;
    wire [7:0] io11;
    wire [7:0] io12;
    wire [7:0] io13;
    wire [7:0] io20;
    wire [7:0] io21;
    wire [7:0] io22;
    wire [7:0] io23;
    wire [7:0] io30;
    wire [7:0] io31;
    wire [7:0] io32;
    wire [7:0] io33;

    output [7:0] o00;
    output [7:0] o01;
    output [7:0] o02;
    output [7:0] o03;
    output [7:0] o10;
    output [7:0] o11;
    output [7:0] o12;
    output [7:0] o13;
    output [7:0] o20;
    output [7:0] o21;
    output [7:0] o22;
    output [7:0] o23;
    output [7:0] o30;
    output [7:0] o31;
    output [7:0] o32;
    output [7:0] o33;

    // Send inputs through wires to swap them for the corresponding Rijndael S-box value
    io00 = p00;
    io01 = p01;
    io02 = p02;
    io03 = p03;
    io10 = p10;
    io11 = p11;
    io12 = p12;
    io13 = p13;
    io20 = p20;
    io21 = p21;
    io22 = p22;
    io23 = p23;
    io30 = p30;
    io31 = p31;
    io32 = p32;
    io33 = p33;

    // Receiving swaps and assigning them to the output wires
    o00 = io00;
    o01 = io01;
    o02 = io02;
    o03 = io03;
    o10 = io10;
    o11 = io11;
    o12 = io12;
    o13 = io13;
    o20 = io20;
    o21 = io21;
    o22 = io22;
    o23 = io23;
    o30 = io30;
    o31 = io31;
    o32 = io32;
    o33 = io33;

endmodule