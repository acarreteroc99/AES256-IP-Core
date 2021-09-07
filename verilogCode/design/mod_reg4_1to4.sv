

/****** mod_reg16.sv *******/
// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg4_1to4(clk, resetn, rd_en, wr_en,
                    i,
                    o, reg_full
                    );

    localparam N = 4;
    integer index;

    input clk, resetn, rd_en, wr_en;
    input [7:0] i;

    reg [(N-1):0][7:0] aux;
    reg [1:0] counter = 0;

    output reg reg_full;
    output reg [(N-1):0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            counter = 0;
            reg_full = 1'b0;

            for(index=0; index < N; index=index+1)
            begin
                aux[index] = 8'h00;
                o[index] = 8'h00;
            end
        end

        else if(wr_en && !reg_full)
            begin
                aux[counter] = i;
                if(counter == (N-1))
                begin
                    counter = 0;
                    reg_full = 1'b1;
                end
                else
                    counter = counter+1;
            end

        else if(rd_en && reg_full)
            begin
                reg_full = 1'b0;

                for(index=0; index < N; index=index+1)
                    o[index] = aux[index];
            end
    end

endmodule