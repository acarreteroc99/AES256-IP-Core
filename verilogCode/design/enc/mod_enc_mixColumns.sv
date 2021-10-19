

module mod_enc_mixColumns(  clk, resetn,                            //enable, reg161_status, reg162_reseted,
                            state, wr_en,
                            state_out                               //, done, mC_reseted
                         );

    localparam N = 16;

    input  clk, resetn;
    input wire [(N-1):0][7:0] state;
    input wr_en;

    reg [3:0][7:0] row;
    reg [(N-1):0][7:0] temp;
    reg [(N-1):0][7:0] stateAux;

    output reg  [(N-1):0][7:0] state_out;

    integer index;

    function [(N-1):0][7:0] mix_columns (input [(N-1):0][7:0] state);

        for(index = 0; index < 4; index=index+1)
        begin
            row[0] = state[index*4]; row[1] = state[(index*4)+1]; row[2] = state[(index*4)+2]; row[3] = state[(index*4)+3]; 
            temp[index*4] = xtime(row[0]) ^ (xtime(row[1]) ^ row[1]) ^ row[2] ^ row[3];
            temp[(index*4)+1] = row[0] ^ xtime(row[1]) ^ (xtime(row[2]) ^ row[2]) ^ row[3];
            temp[(index*4)+2] = row[0] ^ row[1] ^ xtime(row[2]) ^ (xtime(row[3]) ^ row[3]);
            temp[(index*4)+3] = (xtime(row[0]) ^ row[0]) ^ row[1] ^ row[2] ^ xtime(row[3]);
        end

        return temp;

    endfunction

    function bit [7:0] xtime([7:0] num);
        if(num/128 == 0)
            return (num << 1);
            //xtime = (num << 1);
        else
            return ((num << 1) ^ 8'h1b);
            //xtime = ((num << 1) ^ 1'b1);
    endfunction

    always @(posedge clk or negedge resetn)
    begin
        if (!resetn)
        begin
            for(index = 0; index < N; index = index+1)
                stateAux[index] = 0;
        end 
        else
        begin
            if(wr_en)
            begin
                stateAux = mix_columns(state); 

                $display("OUTPUT mixColumns: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,", 
                                            stateAux[0], stateAux[1], stateAux[2], stateAux[3],
                                            stateAux[4], stateAux[5], stateAux[6], stateAux[7], 
                                            stateAux[8], stateAux[9], stateAux[10], stateAux[11], 
                                            stateAux[12], stateAux[13], stateAux[14], stateAux[15]
                        );
            end 
        end
    end

    assign state_out = stateAux;

endmodule

    /*
    always @(posedge clk) 
    begin
        if (!resetn)
        begin
            for(index = 0; index < N; index = index+1)
                stateAux[index] = 0;
        end 
        else 
        begin
            if(wr_en)
            begin
                for(index = 0; index < N; index = index+1)
                    stateAux[index] = state[index];
                                                                        
                f_state_out = mix_columns(stateAux);

                $display("OUTPUT mixColumns: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,", 
                                        state_out_comb[0], state_out_comb[1], state_out_comb[2], state_out_comb[3],
                                        state_out_comb[4], state_out_comb[5], state_out_comb[6], state_out_comb[7], 
                                        state_out_comb[8], state_out_comb[9], state_out_comb[10], state_out_comb[11], 
                                        state_out_comb[12], state_out_comb[13], state_out_comb[14], state_out_comb[15]);
    
                //for(index = 0; index < N; index = index+1)
                    //state_out[index] <= state_out_comb[index];
            end
        end
    end
    */