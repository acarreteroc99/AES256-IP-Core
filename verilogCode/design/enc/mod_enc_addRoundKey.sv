


module mod_enc_addRoundKey(clk, resetn, reg_full, rd_comp,
                            p, k, //startBit,
                            o, ok
                            );

    localparam N = 16;
    //localparam inBits = 64;

    input clk, resetn, reg_full, rd_comp;
    
    input [127:0]           k;                  // 4 columns to encode an entire matrix (therefore, 4*4*8 = 128)
    input [(N-1):0][7:0]    p;                
    //input startBit;

    //reg [(N-1):0][7:0]      p;
    //reg [(N/(inBits/8))-1:0] initLoadFull;
    

    output reg [(N-1):0][7:0]  o;
    output reg ok;
    
    integer i;

    
    initial begin
        //initLoadFull = 2'b0;
        ok = 1'b0;
    end
    

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            //initLoadFull = 2'b0;
            ok = 1'b0;
            for(i = 0; i < N; i = i+1)
            begin
                //p[i] = 8'h00;
                o[i] = 8'h00;
            end
        end


        if(!reg_full && rd_comp)
        begin
            ok = 1'b1;
            for(i=0; i < N; i=i+1)
            begin
                o[i] = p[i] ^ k[8*i +: 8];
            end     
        end
        else
            ok = 1'b0;
        
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