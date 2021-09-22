

/****** mod_reg16.sv *******/
// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg4_1to4(clk, resetn, rd_en, wr_en,
                    i,
                    o, reg_full
                    );

    localparam Nb = 4;
    integer index;

    input clk, resetn, rd_en, wr_en;                    // rd_en == reg161_full
    input [7:0] i;

    reg [(Nb-1):0][7:0] aux;
    reg [1:0] counter = 0;
    reg reg_rdEn;

    output reg reg_full;
    output reg [(Nb-1):0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;
            reg_full = 1'b0;
            //reg_rdEn = 1'b1;

            for(index=0; index < Nb; index=index+1)
            begin
                aux[index] = 8'h00;
                //o[index] = 8'h00;
            end
        end

        /*else if(wr_en && !reg_full)
            begin
                aux[counter] = i;
                
                //$display("Input: %h", i);
                
                if(counter == (Nb-1))
                begin
                    counter = 0;
                    reg_full = 1'b1;
                end
                else 
                    counter = counter+1;
                
            end
        */
        
        else 
        begin
            //reg_rdEn = rd_en;
            if(!reg_rdEn && reg_full)
            begin
                for(index=0; index < Nb; index=index+1)
                begin
                    o[index] = aux[index];
                    //$display("Output: %h", o[index]);
                end
                
                reg_full = 1'b0;
            end
        end
    end

    always @(rd_en)                                         // rd_en == reg161_full
        reg_rdEn = 1'b0;
    
    always @(i)
    begin
        if(wr_en && !reg_full)
        begin
            aux[counter] = i;
            if(counter == (Nb-1))
            begin
                counter = 0;
                reg_full = 1'b1;
            end
            else 
                counter = counter+1;
        end
    end
    

endmodule