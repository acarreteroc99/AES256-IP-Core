



module mod_dec_addRoundKey( 
                            clk, resetn, 
                            inp_addRK, inp_key_addRK, 
                            outp_addRK
                          );

    localparam N = 16;
    localparam Nrows = 4;

    input clk, resetn;
    input [127:0]           inp_key_addRK;                                  // Key to decypher data
    input [(N-1):0][7:0]    inp_addRK;                                      // Cyphered input 

    output reg [(N-1):0][7:0]  outp_addRK;                                  // Output

    integer index, row;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     
        begin
            row <= 0;
            for(index=0; index < N; index=index+1)
                outp_addRK[index] <= 8'b0;
        end
        else
        begin
            row <= 0;
            for(index=0; index < N; index=index+1)
            begin
                if(index % 4 == 0)
                    row <= row + 1;

                outp_addRK[index] <= inp_addRK[index] ^ inp_key_addRK[8*index +: 8];              
            end
        end
    end

endmodule

