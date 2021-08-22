

/****** mod_reg16.sv *******/
// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg4_1to4(clk, resetn, read, 
                    i,
                    o
                    );

    localparam N = 16;
    integer index;

    input clk, resetn, read;
    input [3:0][7:0] i;

    reg [(N-1):0][7:0] aux;
    reg [4:0] counter = 0;

    output reg [(N-1):0][7:0] o;

    always @(posedge clk)
    begin
        if(!resetn)
        begin
            counter = 0;
            for(index=0; index < N; index=index+1)
            begin
                aux[index] = 8'h00;
                o[index] = 8'h00;
            end
        end

        if(read)
        begin
            aux[counter] = i;
            if(counter == (N-1))
            begin
                counter = 0;
                for(index=0; index < N; index=index+1)
                    o[index] = aux[index];
            end
            else
                counter = counter+1;
        end

    end

endmodule