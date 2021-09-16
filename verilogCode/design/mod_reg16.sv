

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16(clk, resetn, wr_en,
                i,
                o, reg_full
                );

    localparam N = 16;
    integer index;

    input clk, resetn, wr_en;
    input [N-1:0][7:0] i;
    
    reg [N-1:0][7:0] aux;

    output reg reg_full;
    output reg [N-1:0][7:0] o;


    always @(posedge clk) //or posedge resetn)
    begin
        if(!resetn)
        begin
            reg_full = 1'b0;
            for(index=0; index < N; index=index+1)
            begin
                aux[index] = 8'h00;
                o[index] = 8'h00;
            end
        end
        else 
        begin
            if(wr_en && !reg_full)
            begin
                reg_full = 1'b1;
                for(index=0; index < N; index=index+1)
                    aux[index] = i[index];
            end
            else if(reg_full)
            begin
                reg_full = 1'b0;
                for(index=0; index < N; index=index+1)
                    o[index] = aux[index];
            end
        end
    end
    

endmodule