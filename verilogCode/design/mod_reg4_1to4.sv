

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

    //reg reg_wrEn;
    reg reg_full_i, delay_regFull;

    reg [(Nb-1):0][7:0] aux;
    reg [1:0] counter = 0;
    reg reg_rdEn;                                       // Seems like it is not needed. Using the 'rd_en' input signal is enough.

    output reg reg_full;
    output reg [(Nb-1):0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;
            reg_full = 1'b0;
            //reg_rdEn = 1'b0;

            for(index=0; index < Nb; index=index+1)
                aux[index] = 8'h00;
        end

        else 
        begin
            
            /*
            reg_rdEn = rd_en;                                      // If this line is not written, then it does not work as if it has the 'always @(rd_en) reg_rdEn = 1'b0' (when it works properly)

            if(rd_en && reg_rdEn)
                reg_rdEn = 1'b0;
            */

            /*
                The reason why the following condition does not work as the 'always @(i)' block is that wr_en (reg41_full) holds value 1'b1 during one cycle
                due to the always 'i' while the one inside the if is held for less than a cycle, therefore it always seems to be down. In order to make it work
                as the always statement, I should delay the signal for one cycle, just as I did for the reg161
            */

            /*
            if(wr_en && !reg_full_i)
            begin
                aux[counter] = i;
                if(counter == (Nb-1))
                begin
                    counter = 0;
                end
                else 
                    counter = counter+1;       
            end
            */
            

            if(!rd_en && reg_full)
            //else if(!rd_en && reg_full_i)
            begin
                for(index=0; index < Nb; index=index+1)
                    o[index] = aux[index];
                
                //reg_rdEn = 1'b1;
                reg_full = 1'b0;
                //reg_full_i = 1'b0;
            end
        end
    end

    /*
        Todas las senyales que se encuentran dentro de una condicion o a la derecha de una asignacion deben aparecer en la lista
        de sensibilidades. 
    */

    always @(i or posedge counter or posedge reg_full) //posedge wr_en                                               // Falta anyadir wr_en y reg_full en la lista de sensibilidades
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

    /*
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            delay_regFull = 1'b0;
            reg_full_i = 1'b0;                           // This register
        end

        else
        begin
            delay_regFull = reg_full_i;
            
            if(wr_en && !reg_full_i)
            begin
                if(counter == (Nb-1))
                    reg_full_i = 1'b1;
            end

            //if(!rd_en && reg_full_i)
                //reg_full_i = 1'b0;
        end
    end

    assign reg_full = (delay_regFull || reg_full_i);
    */
    

    /*
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;
        end

        else
        begin
            if(wr_en && !reg_full)
            begin
                if(counter == (Nb-1))
                begin
                    counter = 0;
                    reg_full = 1'b1;
                end
                else 
                    counter = counter+1;
            end
        end
    end
    */
    
    /*
    always @(rd_en)                                         
        reg_rdEn = 1'b0;
    */
    
    
    
     

endmodule