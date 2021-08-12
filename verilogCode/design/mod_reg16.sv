

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16(clk, resetn, read, write,
                i,
                o
                );

    localparam N = 16;
    integer index;

    input clk, resetn, read, write;
    input [N-1:0][7:0] i;

    reg [N-1:0][7:0] aux;

    //wire [N-1:0][7:0] oaux;
    output [N-1:0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            for(index=0; index < N; index=index+1)
                aux[index] <= 8'h00;
    end

    always @(posedge clk or posedge write)
    begin
        if(write)
            for(index=0; index < N; index=index+1)
                aux[index] <= i[index];
    end

    always @(posedge clk or posedge read)
    begin
        if(read)
            for(index=0; index < N; index=index+1)
                o[index] <= aux[index];
    end

    //assign out = oaux;

endmodule