

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16(   clk, resetn, wr_en, round,      
                    inp_reg162_mC, inp_reg162_shf,
                    outp_reg162                             
                );

    localparam N = 16;
    integer index;

    input clk, resetn, wr_en;                       
    input[3:0] round;
    input [(N-1):0][7:0] inp_reg162_mC;
    input [(N-1):0][7:0] inp_reg162_shf;
    
    reg [(N-1):0][7:0] aux;

    output reg [(N-1):0][7:0] outp_reg162;

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
                    aux = inp_reg162_shf;
                else
                    aux = inp_reg162_mC;
            end
            
            /*
            $display("OUTPUT reg162: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,", 
                                        aux[0], aux[1], aux[2], aux[3],
                                        aux[4], aux[5], aux[6], aux[7], 
                                        aux[8], aux[9], aux[10], aux[11], 
                                        aux[12], aux[13], aux[14], aux[15]);
            $display("-------------------------------------------------------------------------"); 

            $display("===========================================================================");
            $display("                              NEW Routp_reg162UND                                    ");
            $display("===========================================================================");
            */
        end
    end

    assign outp_reg162 = aux;

endmodule