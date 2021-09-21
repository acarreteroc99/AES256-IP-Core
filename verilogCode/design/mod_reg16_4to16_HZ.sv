

/****** mod_reg16.sv *******/
// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_4to16(clk, resetn, rd_en, wr_en,
                        i,
                        o, reg_full
                        );

    localparam Nout = 16;
    localparam Nin = 4;
    integer index;

    input clk, resetn, rd_en, wr_en;            //rd_en -> OK_mC ;; wr_en -> reg41_full
    input [(Nin-1):0][7:0] i;

    reg [(Nout-1):0][7:0] aux;
    reg [1:0] counter;
    reg reg_rdEn;
    reg reg_wrEn;

    output reg reg_full;
    output reg [(Nout-1):0][7:0] o;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;                                   // Seedy solution. Should be changed. 
            reg_full = 1'b0;                                // This register is not full
            //reg_rdEn = 1'b1;                                // OK_mC

            /*
            for(index=0; index < Nout; index=index+1)
            begin
                aux[index] = 8'h00;
            end
            */
        end

        else
        begin
            
            if(reg_wrEn && !reg_full)
            begin
                reg_wrEn = 1'b0;

                for(index = 0; index < Nin; index = index+1)
                    aux[(counter*Nin)+index] = i[index];

                $display("Counter value: ", counter);

                if(counter == (Nin-1))
                begin
                // IT IS NOT GOING INSIDE HERE --> Bc it takes 4 XXXX values first, therefore wr_en doesn't turn 1 another time to let go inside the if
                $display("----------- HELLOOOOOOOO ------");
                    counter = 0;
                    reg_full = 1'b1;
                end
                else
                begin
                    counter = counter+1;
                end
                
                //$display("Counter value: ", counter);
            end
            

            //reg_rdEn = rd_en;
            
            //$display("--------- Is reg full?: ", reg_full);
            //$display("--------- Is rd completed?: ", reg_rdEn);

            if(reg_rdEn && reg_full)
            begin
                reg_rdEn = 1'b0;
            
                for(index=0; index < Nout; index=index+1)
                    o[index] = aux[index];
                
                reg_full = 1'b0;
            end
        end
    end
    
    always @(i)
        reg_wrEn = 1'b1;

    always @(rd_en)
        reg_rdEn = 1'b1;

    /*
    always @(wr_en)
    begin
        if(wr_en && !reg_full)
        begin
            for(index = 0; index < Nin; index = index+1)
                aux[(counter*Nin)+index] = i[index];

            if(counter == (Nin-1))
            begin
                counter = 0;
                reg_full = 1'b1;
            end
            else
                counter = counter+1;
        end
        $display("--------- Counter value: ", counter);
        //$display("--------- Is reg full?: ", reg_full);
    end
    */

endmodule