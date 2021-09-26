

module mod_enc_mixColumns(  clk, enable, reset, reg161_status, reg162_reseted,
                            state, 
                            state_out, done, mC_reseted
                         );

    localparam N = 16;

    input  clk, enable, reset, reg161_status, reg162_reseted;
    input wire [(N-1):0][7:0] state;

    reg [(N-1):0][7:0] stateAux;
    reg reg161_full;
    reg reg162_full, reg_reg162reseted;

    reg [1:0] localcounter;

    output reg mC_reseted;
    output reg  [(N-1):0][7:0] state_out;
    output reg done;
    
    integer index;

    always @(posedge clk) 
    begin
        if (!reset)
        begin
            //for(index = 0; index < N; index = index+1)
                //state_out[index] <= 8'h00;

            //reg161_full = 1'b0;
            //reg162_full = 1'b0;                                          
            mC_reseted = 1'b1;
            localcounter = 0;

        end 
        else 
        begin
            //if(!reg161_full && reg161_status)
            if(reg161_status)
                reg161_full = 1'b1;

            if(!reg162_full && !enable)
                reg162_full = 1'b1;


            reg_reg162reseted = reg162_reseted;
            
            //$display("Reg161 value: ", reg161_full);
            //$display("Reg162 value: ", reg162_full);
            
            if(reg161_full)
            begin
                reg161_full = 1'b0;
                done <= 1'b0;
                for(index = 0; index < N; index = index+1)
                    stateAux[index] = state[index];
                    
            end

            if(!reg161_full)                                                            // Idk if 'else' is used instead of 'if(!reg161_full)', it does not work.
            begin
                if (!reg162_full || reg_reg162reseted)
                begin 
                    //done = 0;
                    reg162_full = 1'b1;
                    f_state_out = mix_columns(stateAux);
        
                    for(index = 0; index < N; index = index+1)
                    begin
                        state_out[index] <= state_out_comb[index];

                        //if(index == (N-1))
                            //done = 1'b1;
                        //else
                            //done <= 1'b0;
                    end

                    done = 1'b1;
    
                end 
                //else if(reg162_full)                                                         // Same. If 'else' is used instead of 'if(!reg161_full)', it does not work.
                    //done = 0;
            end
        end
    end
    
    /*
    always @(state)                                                                            // Here posedge 'posedge reg161_status' shoudl be set instead of 'state'
        reg161_full = 1'b1; 

    always @(negedge reg162_reseted)
        reg_reg162reseted = 1'b0;
    
    always @(negedge enable) 
        reg162_full = 1'b0; 
    */

    function [7:0] MultiplyByTwo;
        input [7:0] x;
        begin 
                /* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ MSB, xor the result with 0001 1011*/
                if(x[7] == 1) MultiplyByTwo = ((x << 1) ^ 8'h1b);
                else MultiplyByTwo = x << 1; 
        end 	
    endfunction

    function [7:0] MultiplyByThree;
        input [7:0] x;
        begin 
                /* multiplication by 3 ,= 01 ^ 10 = (NUM * 01) XOR (NUM * 10) = (NUM) XOR (NUM Muliplication by 2) */
                MultiplyByThree = MultiplyByTwo(x) ^ x;
        end 
    endfunction
 

    wire [(N-1):0][7:0] state_out_comb;
    genvar i;

    reg [(N-1):0][7:0] f_state_out; //formal calculated state output


    function bit [14:0] finite_multiplication;
        input [7:0] A ;
        input [7:0] B ;
        output[14:0] AB ;
        reg [14:0] temp [7:0] ;
        integer i;

        for(i=0; i<=7; i=i+1)
        begin
            if (A[i]==1)
            temp[i]=B*(2**i);
            else 
            temp[i]=8'd0;
        end

        AB=temp[0]^temp[1]^temp[2]^temp[3]^temp[4]^temp[5]^temp[6]^temp[7];

    endfunction


    function bit [7:0] Mod;
        input  [14:0] x;
        output [7:0] y;
        reg    [8:0] con;
        reg    [14:0] z;
        integer i;

        con = 9'd283;
        z = x;
        for (i=14; i>=8; i =i-1)
        begin
            if (z > 8'd255)
            begin
                if(z[i] == 1)
                    z[i -: 9] = z[i -: 9] ^ con[8:0];
                    //$display("z = %b",z[14:0]);
            end
            else 
            begin
                y = z;
            end
            y = z;
        end

    endfunction


    function [(N-1):0][7:0] mix_columns (input [127:0] state);
        integer i,j,ij,k;
        //reg [7:0] state_2d [0:3] [0:3];
        //reg [7:0] mix_out_2d [0:3] [0:3];
        //reg [14:0] tmp_mult,tmp_mod;
        //reg [127:0] state_out;

    	reg [7:0] polymat [0:3] [0:3];

        reg [(N-1):0][7:0] state_2d;
        reg [(N-1):0][7:0] mix_out_2d;
        reg [14:0] tmp_mult,tmp_mod;
        reg [(N-1):0][7:0] state_out;

    	//reg [(N-1):0][7:0] polymat [0:3] [0:3];


        // Static Matrix defintion
		
        polymat[0][0]=8'd2;
        polymat[0][1]=8'd3;
        polymat[0][2]=8'd1;
        polymat[0][3]=8'd1;
        polymat[1][0]=8'd1;
        polymat[1][1]=8'd2;
        polymat[1][2]=8'd3;
        polymat[1][3]=8'd1;
        polymat[2][0]=8'd1;
        polymat[2][1]=8'd1;
        polymat[2][2]=8'd2;
        polymat[2][3]=8'd3;
        polymat[3][0]=8'd3;
        polymat[3][1]=8'd1;
        polymat[3][2]=8'd1;
        polymat[3][3]=8'd2;
        
        tmp_mod = 15'h0;
        
        for ( i=0; i<=3; i=i+1)
            for ( j=0; j<=3; j=j+1)
                begin
                ij=(i*4+j);
                state_2d[j][i]=stateAux[ij];
            end	

        for (i=0;i<=3;i++)
            for(j=0;j<=3;j++)
            begin 
                    tmp_mod=15'd0;
                    /* scalar multiplication of two matrices */
                    for (k=0;k<=3;k++)
                    begin 
                            finite_multiplication(state_2d[k][j],polymat[i][k],tmp_mult);
                            tmp_mod = tmp_mod ^ tmp_mult;
                            Mod(tmp_mod,mix_out_2d[i][j]);
                    end
                        //	$display("ij:%d,%d ,state: %x ",i,j,mix_out_2d[i][j]);
            end

            //2D to 1D

        for ( i=0; i<=3; i=i+1) 
            for ( j=0; j<=3; j=j+1)
                begin
                    ij=(i*4+j);
                    state_out[ij]=mix_out_2d[j][i];
                    end	
        
        mix_columns = state_out;
    endfunction

generate
for(i=0;i<=3;i=i+1) begin

/* Check end of the document to for further explanation over this loop*/ 
    assign state_out_comb[i*4]  = MultiplyByTwo(stateAux[i*4])^(stateAux[(i*4)+1])^(stateAux[(i*4)+2])^MultiplyByThree(stateAux[(i*4)+3]);
    assign state_out_comb[(i*4)+1] = MultiplyByThree(stateAux[i*4])^MultiplyByTwo(stateAux[(i*4)+1])^(stateAux[(i*4)+2])^(stateAux[(i*4)+3]);
    assign state_out_comb[(i*4)+2] = (stateAux[i*4])^MultiplyByThree(stateAux[(i*4)+1])^MultiplyByTwo(stateAux[(i*4)+2])^(stateAux[(i*4)+3]);
    assign state_out_comb[(i*4)+3]  = (stateAux[i*4])^(stateAux[(i*4)+1])^MultiplyByThree(stateAux[(i*4)+2])^MultiplyByTwo(stateAux[(i*4)+3]);
end
endgenerate

//initial done <= 0;
//initial state_out <= 0;


/*`ifdef FORMAL

    always @(*)
        f_state_out = mix_columns(state);
    
    // assert both are equal
    always @(posedge clk)
        if(done)
            assert(state_out == f_state_out);

`endif*/

endmodule

// ================================ EXPLANATION LOOP CONTAINING 'assign's ==============================

 /* 
 * Mix columns is a matrices muliplication: polynomial matrix state matrix .
 * for example 
 *	2	3	1 1     63 09 cd ba
 *	1	2	3 1     53 60 70 ca
 *	1	1	2 3     e0 e1 b7 d0
 * 	3	1	1 2     8c 04 51 e7
 * But the state bits as input comes serially in a reg [127:0] : 63 53 e0 8c 09 60 e1 04 cd 70 b7 51 ba ca d0 e7  
 * so instead of multiplying row * column we multiply row * row  and putting the bits in the output state in a column per iteration
 * 
 */

 /*             LOGIC FOR CONVERSION FROM ORIGINAL CODE TO CURRENT CODE
 *  [i*32+:8]           -- 7:0 (0), 39:32 (4), 71:64 (8), 103:96  (12)      --  [i*4]
 *  [(i*32 + 8)+:8]     -- 15:8 (1),            ...     , 111:104 (13)      --  [(i*4)+1]  
 *  [(i*32 + 16)+:8]    -- 23:16 (2),           ...     , 119:112 (14)      --  [(i*4)+2]
 *  [(i*32 + 24)+:8]    -- 31:24 (3),           ...     , 127:120 (15)      --  [(i*4)+3]
 */

 // =====================================================================================================