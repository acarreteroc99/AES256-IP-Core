

module mod_enc_addRoundKey( clk, resetn, 
                            p, k, 
                            o
                          );

    localparam N = 16;
    localparam Nrows = 4;

    input clk, resetn;
    input [127:0]           k;                                          // Key coming from romKey module
    input [(N-1):0][7:0]    p;                                          // Input coming from reg16_4to16 or reg162

    output reg [(N-1):0][7:0]  o;                                       // Output

    integer index;
    reg [1:0] counter;
    reg [1:0] row_cnt;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     
        begin
            counter = 0;
            row_cnt = 0;

            for(index=0; index < N; index=index+1)
                o[index] = 8'b0;
        end
        else
        begin

            
            for(index=0; index < N; index=index+1)
                o[index] = p[index] ^ k[8*index +: 8];                  // Since 'k' is 128-bit string, its format shall be adapted to perform the XOR operation
            

            /*
            for(index=0; index < N; index=index+1)
            begin
                o[(Nrows*counter)+row_cnt] = p[index] ^ k[8*index +: 8]; 
                
                if(counter == (Nrows-1))
                begin
                    counter = 0;
                    row_cnt = row_cnt + 1;
                end
                else
                    counter = counter + 1;
            end

            counter = 0;
            row_cnt = 0;
            */

            /*
            $display("OUTPUT addRK: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,",  
                                        o[0], o[1], o[2], o[3],
                                        o[4], o[5], o[6], o[7], 
                                        o[8], o[9], o[10], o[11], 
                                        o[12], o[13], o[14], o[15]
                    );
            $display("-------------------------------------------------------------------------"); 
            */
        end
    end

endmodule
