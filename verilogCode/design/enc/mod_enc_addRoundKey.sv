


module mod_enc_addRoundKey(clk, reg_full,
                            p, k,
                            o, ok
                            );

    /* verilator lint_off UNUSED */
    input clk, reg_full;
    
    input [15:0][7:0]   p;
    input [15:0][7:0]   k;

    output [15:0][7:0]  o;
    output ok;
    
    genvar i;

    if(!reg_full)
        for(i=0; i < 16; i=i+1)
            assign o[i] = p[i] ^ k[i];
    
    assign ok = 1'b1;
    
endmodule