


module mod_enc_addRoundKey(clk, reg_full, rd_comp,
                            p, k,
                            o, ok
                            );

    localparam N = 16;

    input clk, reg_full, rd_comp;
    
    input [(N-1):0][7:0]   p;
    input [127:0]       k;                  // 4 columns to encode an entire matrix (therefore, 4*4*8 = 128)
    

    output reg [(N-1):0][7:0]  o;
    output ok;
    
    integer i;


    always @*
    begin
        if(!reg_full && rd_comp)
            for(i=0; i < N; i=i+1)
            begin
                assign o[i] = p[i] ^ k[8*i +: 8];
            end
        
    end

    assign ok = 1'b1;

endmodule