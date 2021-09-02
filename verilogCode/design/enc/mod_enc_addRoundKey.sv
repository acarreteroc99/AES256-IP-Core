

/**********************************************************
*
*   No he conseguido que funcione con un solo always pork, cuando los junto, me es muy
    dificil controlar las se;ales reg_empty y rd_comp. Ahora funciona perfectamente. 
*
*/


module mod_enc_addRoundKey(clk, resetn, reg_empty, rd_comp,
                            p, k, 
                            o, ok
                            );

    localparam N = 16;

    input clk, resetn, reg_empty, rd_comp;
    
    input [127:0]           k;                  // 4 columns to encode an entire matrix (therefore, 4*4*8 = 128)
    input [(N-1):0][7:0]    p;      

    reg                 reg163_empty, rd_romKey; 
    reg [127:0]         regKey;   
    reg [(N-1):0][7:0]  reg_p;

    output reg [(N-1):0][7:0]  o;
    output reg ok;
    
    integer i;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            ok = 1'b1;
                    reg163_empty = 1'b1;
            for(i = 0; i < N; i = i+1)
                o[i] = 8'h00;
        end
        
    end

    always @(posedge clk)
    begin

        reg163_empty = reg_empty;
        rd_romKey = rd_comp;
        reg_p = p;
        regKey = k;
    

        if(reg163_empty && rd_romKey)
        begin

            rd_romKey = 1'b0;
            reg163_empty = 1'b0;
            ok = 1'b0;

            for(i=0; i < N; i=i+1)
                o[i] = reg_p[i] ^ regKey[8*i +: 8];
        end

        else
            ok = 1'b1;
    end

    /*

    always @(posedge rd_comp)
    begin
        assign rd_romKey = 1'b1;
        assign ok = 1'b0;
    end
    
    always @(posedge reg_empty)
        assign reg163_empty = 1'b1;

    always @(posedge k)
        assign regKey = k;
    
    always @(posedge p)
        assign reg_p = p;
    
    */


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