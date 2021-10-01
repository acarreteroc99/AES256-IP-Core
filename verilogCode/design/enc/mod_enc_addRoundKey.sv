

/**********************************************************
*
*   No he conseguido que funcione con un solo always pork, cuando los junto, me es muy
    dificil controlar las senyales reg_empty y rd_comp. Ahora funciona perfectamente. 
*
*/


module mod_enc_addRoundKey(clk, resetn, //reg163_status, rd_comp, startBit, reg162_status,
                            p, k, //round,
                            o//, ok, ok_inkey
                            );

    localparam N = 16;

    input clk, resetn;
    //input reg163_status, reg162_status, rd_comp, startBit;
    //input [3:0] round;
    
    input [127:0]           k;                                          // Key coming from romKey module
    input [(N-1):0][7:0]    p;                                          // Input coming from reg16_4to16 or reg162

    //reg                 reg163_empty, reg162_full, rd_romKey; 
    //reg [127:0]         regKey;   
    //reg [(N-1):0][7:0]  reg_p;
    //reg [3:0] reg_round;

    output reg [(N-1):0][7:0]  o;                                      // Output
    //output reg ok, ok_inkey;
    
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
