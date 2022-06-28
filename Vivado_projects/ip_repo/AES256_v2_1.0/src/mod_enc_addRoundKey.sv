

module mod_enc_addRoundKey( 
                            clk, resetn, 
                            inp_addRK, inp_key_addRK, 
                            outp_addRK
                          );

    localparam N = 16;
    localparam Nrows = 4;

    input clk, resetn;
    input [127:0]           inp_key_addRK;                                      // Key
    input [(N-1):0][7:0]    inp_addRK;                                          // Data to be encrypted

    output reg [(N-1):0][7:0]  outp_addRK;                                      // Data encrypted

    integer index, row;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     
        begin
            row <= 0;
            outp_addRK <= 0;
        end
        else
        begin
            row <= 0;
            for(index=0; index < N; index=index+1)
            begin
                if(index % 4 == 0)
                    row <= row + 1;

                // Data shall be adapted since 16x8 matrix is being multiplied by a 128-bit array    
                outp_addRK[index] <= inp_addRK[index] ^ inp_key_addRK[8*index +: 8];          
            end
        end
    end

endmodule
