

/**********************************************************
*
*   No he conseguido que funcione con un solo always pork, cuando los junto, me es muy
    dificil controlar las senyales reg_empty y rd_comp. Ahora funciona perfectamente. 
*
*/


module mod_enc_addRoundKey(clk, resetn, reg163_status, rd_comp, startBit, reg162_status,
                            p, k, round,
                            o, ok, ok_inkey
                            );

    localparam N = 16;

    input clk, resetn, reg163_status, reg162_status, rd_comp, startBit;
    input [3:0] round;
    
    input [127:0]           k;                  // 4 columns to encode an entire matrix (therefore, 4*4*8 = 128)
    input [(N-1):0][7:0]    p;      

    reg                 reg163_empty, reg162_full, rd_romKey; 
    reg [127:0]         regKey;   
    reg [(N-1):0][7:0]  reg_p;
    reg [3:0] reg_round;

    output reg [(N-1):0][7:0]  o;
    output reg ok, ok_inkey;
    
    integer index;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     // 'o' reg is not initialize since it gives problems when running AES top module
        begin
            for(index=0; index < N; index=index+1)
                o[index] = 8'b0;
        end
        else
        begin
            for(index=0; index < N; index=index+1)
                o[index] = p[index] ^ k[8*index +: 8];
        end
    end

    

endmodule


    /*
        if(!startBit)                                                                  // Bit coming from CTRL register
            initLoadFull = 0;

        if(initLoadFull < (N/(inBits/8)))
        begin
            if(initLoadFull == 2'b01)
                for(i=0; i < inBits/8; i=i+1) assign p[i] = inp[8*i +: 8];

            if(initLoadFull == 2'b10)
                for(i=0; i < inBits/8; i=i+1) assign p[i+8] = inp[8*i +: 8];

            initLoadFull = initLoadFull + 1;
        end
    */