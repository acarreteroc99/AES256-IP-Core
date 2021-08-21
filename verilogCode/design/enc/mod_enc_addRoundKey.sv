


module mod_enc_addRoundKey(clk,
                            p, k,
                            o, ok
                            );

    /* verilator lint_off UNUSED */
    input clk;
    
    input [15:0][7:0]   p;
    input [15:0][7:0]   k;

    output [15:0][7:0]  o;
    output ok;
    

    //input [7:0] p [15:0];
    //input [7:0] k [15:0];

    //output [7:0] out [15:0];
    
    genvar i;

    // Pasar esto a for's
    for(i=0; i < 16; i=i+1)
        assign o[i] = p[i] ^ k[i];
    
    assign ok = 1'b1;
    
endmodule