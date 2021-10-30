

module mod_enc_addRoundKey( 
                            clk, resetn, 
                            inp_addRK, inp_key_addRK, 
                            outp_addRK
                          );

    localparam N = 16;
    localparam Nrows = 4;

    input clk, resetn;
    input [127:0]           inp_key_addRK;                                              // Key coming from romKey module
    input [(N-1):0][7:0]    inp_addRK;                                      // Input coming from reg16_4to16 or reg162

    output reg [(N-1):0][7:0]  outp_addRK;                                               // Output

    integer index;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     
        begin
            for(index=0; index < N; index=index+1)
                outp_addRK[index] = 8'b0;
        end
        else
        begin
            for(index=0; index < N; index=index+1)
                outp_addRK[index] = inp_addRK[index] ^ inp_key_addRK[8*index +: 8];              // Since 'k' is 128-bit string, its format shall be adapted to perform the XOR operation
        
        end
    end

endmodule
