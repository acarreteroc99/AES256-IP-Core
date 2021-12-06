

/****** mod_reg16.sv *******/
// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_1to16 (clk, resetn, 
                        i, wr_en,
                        o, 
                        );

    localparam N = 16;
    integer index;

    input clk, resetn;
    input wr_en;                            // rd_en                    
    input [7:0] i;

    reg [(N-1):0][7:0] aux;
    reg [3:0] counter;

    output reg [(N-1):0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter <= 0;

            for(index=0; index < N; index=index+1)
                aux[index] <= 8'h00;
        end

        else 
        begin
            if(wr_en)
            begin
                aux[counter] <= i;
            end
        end
    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            counter <= 0;

        else
        begin
            if(wr_en)
            begin
                if(counter == (N-1))                                    // !!!!! THIS SHOULD BE N-1 !!!!!
                begin
                    counter <= 0;
                    o <= aux;
                end
                else
                    counter <= counter + 1;
            end 
        end
    end

    //assign o = aux;

endmodule