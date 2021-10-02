

module mod_enc_addRoundKey( clk, resetn, 
                            p, k, 
                            o
                          );

    localparam N = 16;

    input clk, resetn;
    input [127:0]           k;                                          // Key coming from romKey module
    input [(N-1):0][7:0]    p;                                          // Input coming from reg16_4to16 or reg162

    output reg [(N-1):0][7:0]  o;                                       // Output

    integer index;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     
        begin
            for(index=0; index < N; index=index+1)
                o[index] = 8'b0;
        end
        else
        begin
            for(index=0; index < N; index=index+1)
                o[index] = p[index] ^ k[8*index +: 8];                  // Since 'k' is 128-bit string, its format shall be adapted to perform the XOR operation
        end
    end

endmodule
