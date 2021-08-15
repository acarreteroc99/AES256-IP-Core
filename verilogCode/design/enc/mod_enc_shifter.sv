
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

/*
module mod_enc_shifter( 
                        p00, p01, p02, p03, p10, p11, p12, p13, p20, p21, p22, p23, p30, p31, p32, p33,
                        o00, o01, o02, o03, o10, o11, o12, o13, o20, o21, o22, o23, o30, o31, o32, o33
                      );
    
    //input clk;

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


    assign o00 = p00;
    assign o01 = p01;
    assign o02 = p02;
    assign o03 = p03;

    assign o10 = p13;
    assign o11 = p10;
    assign o12 = p11;
    assign o13 = p12;

    assign o20 = p22;
    assign o21 = p23;
    assign o22 = p20;
    assign o23 = p21;

    assign o30 = p31;
    assign o31 = p32;
    assign o32 = p33;
    assign o33 = p30;
    
endmodule
*/


module mod_enc_shifter(clk, in, out);

  localparam N = 16;

    /* verilator lint_off UNUSED */
    input clk;
    input [N-1:0][7:0] in;

    output [N-1:0][7:0] out;

    genvar i;

    for(i=0; i < 4; i = i+1)
      assign out[i] = in[i];

    for(i=4; i < 7; i = i+1)
      assign out[i] = in[i+1];

    assign out[7] = in[4];

    for(i=8; i < 10; i = i + 1)
    begin
      assign out[i] = in[i+2];
      assign out[i+2] = in[i];
    end

    assign out[12] = in[15];

    for(i = 13; i < N; i=i+1)
      assign out[i] = in[i-1];
        

endmodule
