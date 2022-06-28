
/*
*   ========== BE CAREFUL WITH VIVADO DATA FORMAT ===========
*   Big Endian (!!!):
*       [3][2][1][0]
*   =========================================================
*/

`define N_WORDS 60                                          // N_WORDS = Nb*(Nr+1)

module AES256_keygen(
                    clk, resetn,
                    kg_dataIn, ctrl_dataIn_kg,
                    kg_dataOut, ctrl_dataOut_kg
                  );

    localparam Nk = 8;
    localparam Nr = 14;
    localparam Nb = 4;
    localparam Nrows = 4;

    input clk, resetn;
    input [255:0] kg_dataIn;
    input ctrl_dataIn_kg;

    output reg [127:0] kg_dataOut;
    output reg ctrl_dataOut_kg;

    localparam [3:0]
                    idle_st = 4'b0000,
                    getWord_st = 4'b0001,
                    rotWord_st = 4'b0010,
                    rotWord_delay2_st = 4'b0011,
                    rotWord_delay_st = 4'b0100,
                    subWord_st = 4'b0101,
                    rconXOR_st = 4'b0110,
                    
                    end_round_st = 4'b1110,
                    end_st = 4'b1111;

    reg [3:0] kg_st, kg_st_next;
    reg [7:0] round;
    reg [2:0] word_cnt;
    reg [127:0] key_aux;
    reg [2:0] cond_getWord;

    reg [1:0] subWord_cnt;

    reg [3:0][7:0] temp;           
    //reg [3:0][7:0] temp2;

    reg [239:0][7:0] wordlist;
    reg [6:0][7:0] Rcon;

    integer index, i, iAux, iOut;
    reg [1:0] key_num, key_num_delay;

    //------ rotWord ------

    reg [3:0][7:0] dataIn_rotWord;
    wire [3:0][7:0] dataOut_rotWord;
    reg wr_rotWord;

    //------ subWord ------

    //reg [7:0] dataIn_subWord;
    wire [7:0] dataOut_subWord;

    //------- end_st ------

    reg end_st_reg;

   always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            wordlist <= 0;  
	else
	   case(kg_st) 
		idle_st :
		begin
		 if(ctrl_dataIn_kg)
		   begin	
                	for(i=0; i<Nb*Nrows*2; i=i+1)
                		begin
                    			wordlist[key_num*(Nb*Nrows) + i] <= kg_dataIn[8*i +: 8];
                    //wordlist[key_num_delay*(Nb*Nrows) + i] <= kg_dataIn[8*i +: 8];                        // When only keygen is ran, uncomment this and comment line above
                		end
		  end	
		end
	  	end_round_st :
            	begin
                	for(i=0; i<Nb; i=i+1)
            		    begin
                    		wordlist[round*Nb + i] = wordlist[(round-Nk)*Nb + i] ^ temp[i];
                	    end
            	end
	   endcase
 end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            Rcon[0] <= 8'h01; Rcon[1] <= 8'h02; Rcon[2] <= 8'h04; Rcon[3] <= 8'h08; 
            Rcon[4] <= 8'h10; Rcon[5] <= 8'h20; Rcon[6] <= 8'h40;
            
   //         wordlist <= 0;
            //temp <= 0;
            key_num <= 0;
            key_num_delay <= 0;
            iOut <= 0;
        end
        
        else
        begin
         /*   if(kg_st == end_round_st)
            begin
                for(i=0; i<Nb; i=i+1)
                begin
                    wordlist[round*Nb + i] = wordlist[(round-Nk)*Nb + i] ^ temp[i];
                end
            end */

            if(key_num_delay < 2 && ctrl_dataIn_kg)
            begin
                
                key_num_delay <= key_num;

/*                for(i=0; i<Nb*Nrows; i=i+1)
                begin
                    wordlist[key_num*(Nb*Nrows) + i] <= kg_dataIn[8*i +: 8];
                    //wordlist[key_num_delay*(Nb*Nrows) + i] <= kg_dataIn[8*i +: 8];                        // When only keygen is ran, uncomment this and comment line above
                end */
                
                key_num <= key_num + 1;
            end

            ctrl_dataOut_kg <= end_st_reg;

            if (end_st_reg)
            begin
                    
                    /*
                    kg_dataOut <= { wordlist[iOut], wordlist[iOut+1], wordlist[iOut+2], wordlist[iOut+3],
                                    wordlist[iOut+4], wordlist[iOut+5], wordlist[iOut+6], wordlist[iOut+7],
                                    wordlist[iOut+8], wordlist[iOut+9], wordlist[iOut+10], wordlist[iOut+11],
                                    wordlist[iOut+12], wordlist[iOut+13], wordlist[iOut+14], wordlist[iOut+15]
                                };
                    */

                    // Format that suites Vivado's number presentation
                    
                    kg_dataOut <= { wordlist[iOut+15], wordlist[iOut+14], wordlist[iOut+13], wordlist[iOut+12],
                                    wordlist[iOut+11], wordlist[iOut+10], wordlist[iOut+9], wordlist[iOut+8],
                                    wordlist[iOut+7], wordlist[iOut+6], wordlist[iOut+5], wordlist[iOut+4],
                                    wordlist[iOut+3], wordlist[iOut+2], wordlist[iOut+1], wordlist[iOut+0]
                                };
                    
                    iOut <= iOut + 16;

                    if(iOut == 240)
                    begin
                        iOut <= 0;
                        //end_st_reg <= 1'b0;
                        //ctrl_dataOut_kg <= 1'b0;
                    end
            end
            
            else
            begin
                ctrl_dataOut_kg <= 1'b0;
                iOut <= 0;
            end
        end
    end

    /*=========================================
        Controlling current state (idle_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)                             
    begin
        if(!resetn)
        begin
            kg_st <= idle_st;
        end

        else
        begin
            kg_st <= kg_st_next;
        end
    end

    /*=========================================
        Controlling getWord state (getWord_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            temp <= 0;
        end

        else
        begin

            if(kg_st == getWord_st)
            begin
                for(i=0; i < Nb; i=i+1)
                begin
                    temp[i] <= wordlist[(round-1)*Nb + i];
                end
            end

            if(kg_st == rotWord_delay2_st)
            begin
                temp <= dataOut_rotWord;
            end

            if(kg_st == subWord_st)
            begin
                temp[subWord_cnt] <= dataOut_subWord;
                //subWord_cnt <= subWord_cnt + 1;
                //dataIn_subWord <= temp[subWord_cnt];
            end

            if(kg_st == rconXOR_st)
                temp[0] <= temp[0] ^ Rcon[(round/Nk)-1];
        end
    end

    /*=========================================
        Controlling rotWord state (rotWord_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            wr_rotWord <= 1'b0;
            dataIn_rotWord <= 0;                            // NEW
        end

        else
        begin

            if(kg_st == rotWord_st)
            begin
                wr_rotWord <= 1'b1;
                dataIn_rotWord <= temp;
            end
            else
                wr_rotWord <= 1'b0;

        end
    end
    
     /*=========================================
        Controlling rotWord_delay state (rotWord_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin

        end

        else
        begin
            /*
            if(kg_st == rotWord_delay2_st)
            begin
                temp <= dataOut_rotWord;
            end
            */

        end
    end

    /*=========================================
        Controlling subWord state (subWord_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            //temp2 <= 0;
            subWord_cnt <= 0;
        end

        else
        begin
            if(kg_st == subWord_st)
            begin
                //temp[subWord_cnt] <= dataOut_subWord;
                subWord_cnt <= subWord_cnt + 1;
                //dataIn_subWord <= temp[subWord_cnt];
            end
            else
                subWord_cnt <= 0;
        
        end
    end
    

    /*=========================================
        Controlling Rcon XOR state (rconXOR_st)
    ===========================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
    
        end

        else
        begin
            /*
            if(kg_st == rconXOR_st)
                temp[0] <= temp[0] ^ Rcon[(round/Nk)-1];
            */
        end
    end

    /*============================================
        Controlling round addition (end_round_st)
    ==============================================*/

    always @(posedge clk or negedge resetn)                             // Round addition
    begin
        if(!resetn)
        begin
            round <= Nk;
        end

        else
        begin
            if(kg_st == end_round_st)
                round <= round + 1;

            else if (kg_st == idle_st)
                round <= Nk;
        end
    end

    /*============================================
        Controlling end state (end_round_st)
    ==============================================*/

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            end_st_reg <= 1'b0;
        end

        else
        begin
            if(kg_st == end_st)
                end_st_reg <= 1'b1;
            else
                end_st_reg <= 1'b0;
            
        end
        
    end

    /*=========================================
            FSM (Finite State Machine)
    ===========================================*/

    always @(kg_st, ctrl_dataIn_kg, round, word_cnt, subWord_cnt, key_num_delay, cond_getWord, iOut)
    begin
        kg_st_next <= kg_st;

        case(kg_st)
            idle_st:
                begin
                    if(ctrl_dataIn_kg) // && key_num_delay == 2)
                        kg_st_next <= getWord_st;
                end
            getWord_st:
                begin
                    cond_getWord <= round % Nk;

                    if((cond_getWord == 0) || (cond_getWord == 4))
                    begin
                        if(cond_getWord == 0)
                            kg_st_next <= rotWord_st;
                        else
                            kg_st_next <= subWord_st; 
                    end

                    else
                        kg_st_next <= end_round_st;
                end
            rotWord_st:
                begin
                    kg_st_next <= rotWord_delay_st;
                end
            rotWord_delay_st:
                begin
                    kg_st_next <= rotWord_delay2_st;
                end
            rotWord_delay2_st:
                begin
                    kg_st_next <= subWord_st;
                end
            subWord_st:
                begin
                    //$display("subWord_cnt value is: %h", subWord_cnt);
                    if(subWord_cnt == 3)
                    begin
                        if(cond_getWord == 0)
                            kg_st_next <= rconXOR_st;
                        else
                            kg_st_next <= end_round_st;
                    end
                end
            rconXOR_st:
                begin
                    kg_st_next <= end_round_st;
                end
            end_round_st:
                begin
                    if(round == `N_WORDS)                                                                       // 60 is 3C in hex
                    begin                           
                        kg_st_next <= end_st;
                    end

                    else if(word_cnt < 4)
                    begin
                        /*Append new word in "temp" to "key_aux"*/
                        key_aux <= {key_aux, temp};
                        word_cnt = word_cnt + 1;

                        kg_st_next <= getWord_st;
                    end
                    
                    else
                    begin
                        word_cnt = 0;
                        key_aux = 0;

                        kg_st_next <= getWord_st;                              
                    end

                    /*
                    for(i=0; i<Nb; i=i+1)
                    begin
                        wordlist[round*Nb + i] = wordlist[(round-Nk)*Nb + i] ^ temp[i];
                    end
                    */
                end // case: end_round_st
	   end_st:
	     begin
		if(!ctrl_dataIn_kg && iOut==240)
		  kg_st_next <= idle_st;
	     end
	    
        endcase
    end 

    mod_kg_rotWord rotWord(
                            .clk(clk), .resetn(resetn),
                            .inp_rotWord(dataIn_rotWord), .wr_rotWord(wr_rotWord), 
                            .outp_rotWord(dataOut_rotWord)
                        );
    
    mod_kg_subWord subWord(
                            .clk(clk), .resetn(resetn),
                            .addr_subWord(temp[subWord_cnt]), 
                            .outp_subWord(dataOut_subWord)
                        );

    //assign kg_dataOut = key_aux;

endmodule
