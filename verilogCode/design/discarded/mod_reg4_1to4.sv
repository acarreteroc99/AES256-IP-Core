

/****** mod_reg16.sv *******/
// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg4_1to4(clk, resetn, wr_en,    // rd_en
                    i,
                    o, reg_full
                    );

    localparam elementsXRow = 4;
    integer index;

    input clk, resetn;
    input wr_en;                            // rd_en                    
    input [7:0] i;

    reg [(elementsXRow-1):0][7:0] aux;
    reg [1:0] counter;

    output reg reg_full;
    output reg [(elementsXRow-1):0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;
            reg_full = 1'b0;

            for(index=0; index < elementsXRow; index=index+1)
                aux[index] = 8'h00;
        end

        else 
        begin
            if(wr_en == 1)
            begin
                //for(index=0; index < elementsXRow; index=index+1)
                aux[counter] = i;
            end
        end
    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;
        end
        else
        begin
            if(wr_en)
            begin
                if(counter == (elementsXRow-1))
                begin
                    counter = 0;
                end
                else
                    counter = counter + 1;
            end 
        end
    end

    assign o = aux;

endmodule