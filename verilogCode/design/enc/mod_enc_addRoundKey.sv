

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
    
    integer i;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)                                                     // 'o' reg is not initialize since it gives problems when running AES top module
        begin
            reg_round = 0;
            ok_inkey = 1'b1;
            ok = 1'b0;
            // reg163_empty = 1'b1;
            // reg162_full = 1'b0;
        end
    end

    always @(posedge clk)
    begin  
        if(startBit)
        begin
        //$display("Round: ", reg_round);
            /*
            rd_romKey = rd_comp;
            reg_round = round;
            reg162_full = reg162_status;
            reg163_empty = reg163_status;
            
            if(rd_romKey)
            begin
                rd_romKey = 1'b0;
                regKey = k;
                ok = 1'b0;
                ok_inkey = 1'b0;
            end
            */
            
            if(rd_romKey)
                regKey = k;

            if(reg162_full || (reg_round == 0))
            begin
                reg162_full = 1'b0;
                //reg_round = 1;                                          // Only used in the first round, so once completed, we don't care about its value. 
                reg_p = p;
                ok = 1'b0;
            end
            
        
            else if(reg163_empty && !reg162_full && rd_romKey)
            begin
                for(i=0; i < N; i=i+1)
                    o[i] = reg_p[i] ^ regKey[8*i +: 8];
    
                                                                    // Because this turns 1 earlier than the result is outputed, the first XOR result does not outputed (reg163 gets the second directly)
                rd_romKey = 1'b0;
                reg163_empty = 1'b0;
                ok = 1'b1;                                      
                ok_inkey = 1'b1;
            end
        end
    end
    
    always @(posedge rd_comp)
    begin
        rd_romKey = 1'b1;
        ok = 1'b0;
        ok_inkey = 1'b0;
    end
    
    always @(round)
    begin
        reg_round = round;
        $display("Round in addRK is: ", reg_round);
    else
        
    always @(posedge reg162_status)
        reg162_full = 1'b1;
    
    always @(posedge reg163_status)
        reg163_empty = 1'b1;

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