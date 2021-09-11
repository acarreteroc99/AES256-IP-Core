

/**********************************************************
*
*   No he conseguido que funcione con un solo always pork, cuando los junto, me es muy
    dificil controlar las se;ales reg_empty y rd_comp. Ahora funciona perfectamente. 
*
*/


module mod_enc_addRoundKey(clk, resetn, reg_empty, rd_comp, startBit,
                            p, k, 
                            o, ok, ok_inkey
                            );

    localparam N = 16;

    input clk, resetn, reg_empty, rd_comp, startBit;
    
    input [127:0]           k;                  // 4 columns to encode an entire matrix (therefore, 4*4*8 = 128)
    input [(N-1):0][7:0]    p;      

    reg                 reg163_empty, rd_romKey; 
    reg [127:0]         regKey;   
    reg [(N-1):0][7:0]  reg_p;

    output reg [(N-1):0][7:0]  o;
    output reg ok, ok_inkey;
    
    integer i;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     // 'o' reg is not initialize since it gives problems when running AES top module
        begin
            ok = 1'b0;
            ok_inkey = 1'b1;
            reg163_empty = 1'b1;
        end
    end

    always @(posedge clk)
    begin

        //$display("regCTRL[0] value: ", startBit); 
    
        if(startBit)
        begin
            reg163_empty = reg_empty;
            rd_romKey = rd_comp;
            reg_p = p;
            regKey = k;
        

            if(reg163_empty) //&& rd_romKey)
            begin

                rd_romKey = 1'b0;
                reg163_empty = 1'b0;

                for(i=0; i < N; i=i+1)
                    o[i] = reg_p[i] ^ regKey[8*i +: 8];

                                                                    // Because this turns 1 earlier than the result is outputed, the first XOR result does not outputed (reg163 gets the second directly)
                ok = 1'b1;                                      
                ok_inkey = 1'b1;
                
                /*
                if(i == (N-1))                                      // This should be outside the 'for' so when the output is completed, we put 'ok' to 1 and get the new key
                begin                                               
                    ok = 1'b1;                                      
                    ok_inkey = 1'b1;
                end
                */
            end

            else
            begin
                ok = 1'b0;
                ok_inkey = 1'b0;
            end
        end

        //$display("startBit value: ", startBit);

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