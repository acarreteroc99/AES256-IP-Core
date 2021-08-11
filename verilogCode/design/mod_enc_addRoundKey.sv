


module mod_enc_addRoundKey(clk,
                            p, k,
                            out
                            );

    /* verilator lint_off UNUSED */
    input clk;
    /*
    input [15:0][7:0]   p;
    input [15:0][7:0]   k;

    output [15:0][7:0]  out;
    */

    input [7:0] p [15:0];
    input [7:0] k [15:0];

    output [7:0] out [15:0];
    
    genvar i;

    // Pasar esto a for's
    for(i=0; i < 16; i=i+1)
        assign out[i] = p[i] ^ k[i];
    
endmodule