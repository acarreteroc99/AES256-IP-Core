

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16(clk, resetn, read,
                i,
                o
                );

    localparam N = 16;
    integer index;

    input clk, resetn, read;
    input [N-1:0][7:0] i;

    output reg [N-1:0][7:0] o;

    always @(posedge clk)
    begin
        if(!resetn)
            for(index=0; index < N; index=index+1)
                o[index] = 8'h00;
        else if(read)
            for(index=0; index < N; index=index+1)
                o[index] = i[index];

    end

endmodule