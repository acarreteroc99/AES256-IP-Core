

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16(   clk, resetn, wr_en, round,      // rd_en, 
                    i, i2,
                    o                               //, reg_full, reg_reseted
                );

    localparam N = 16;
    integer index;

    input clk, resetn, wr_en;                       //, rd_en;
    input[3:0] round;
    input [(N-1):0][7:0] i;
    input [(N-1):0][7:0] i2;
    
    reg [(N-1):0][7:0] aux;
    // reg OK_mC, OK_addRK;
    // reg reg_full_i;

    // output reg reg_full;
    // output reg reg_reseted;

    output reg [(N-1):0][7:0] o;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            for(index=0; index < N; index=index+1)
                aux[index] = 0;
        end
        else 
        begin
            if(wr_en)
            begin
                if(round == 14)
                    aux = i2;
                else
                    aux = i;
            end
            
            $display("OUTPUT reg162: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,", 
                                        aux[0], aux[1], aux[2], aux[3],
                                        aux[4], aux[5], aux[6], aux[7], 
                                        aux[8], aux[9], aux[10], aux[11], 
                                        aux[12], aux[13], aux[14], aux[15]);
            $display("-------------------------------------------------------------------------"); 

            $display("===========================================================================");
            $display("                              NEW ROUND ");
            $display("===========================================================================");
        end
    end

    assign o = aux;

    /*
    always @(posedge clk) //or posedge resetn)
    begin
        if(!resetn)
        begin
            reg_reseted = 1'b1;
            //reg_full_i = 1'b0;
            
            //reg_full = 1'b0;                                  // We should reset it, but then it gives problems giving an empty input to addRK
            
            //for(index=0; index < N; index=index+1)
                //aux[index] = 8'h00;
            

            OK_mC = 1'b0;
            OK_addRK = 1'b0;

        end
        else 
        begin
            if(rd_en && !OK_addRK)
                OK_addRK = 1'b1;

            if(wr_en && !OK_mC)
                OK_mC = 1'b1;

            if(OK_mC && !reg_full_i)                             // WR_en is OK_mC
            begin
                reg_full_i = 1'b1;
                reg_full = 1'b1;

                OK_mC = 1'b0;
                reg_reseted = 1'b0;
                
                for(index=0; index < N; index=index+1)
                    aux[index] = i[index];
            end

            else if(reg_full_i && OK_addRK)
            begin
                reg_full_i = 1'b0;
                reg_full = 1'b0;
                OK_addRK = 1'b0;

                for(index=0; index < N; index=index+1)
                    o[index] = aux[index];
            end
        end
    end
    */

    /*
    always @(posedge i)
    begin
        reg_full = 1'b0;
    end

    always @(negedge i)
    begin
        reg_full = 1'b0;
    end
    */
    

endmodule