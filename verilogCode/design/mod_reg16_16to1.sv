

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_16to1(clk, resetn,
                i, wr_en, req_fifo,
                o, reg_empty
                );

    localparam N = 16;
    integer index;

    input clk, resetn;
    input wr_en, req_fifo;
    input [(N-1):0][7:0] i;

    reg [(N-1):0][7:0] aux;                             // Stores the 16 values when they are inputed
    reg [3:0] n_read;                                    // Maintains accountability of the elements that have been read

    output reg reg_empty;                               // 1: empty ;; 0: not completely empty
    output reg [7:0] o;

    initial begin
        reg_empty = 1'b1;
        n_read = 0;
    end

    always @(posedge clk or posedge resetn)
    begin
        if(!resetn)
        begin
            reg_empty = 1'b1;
            n_read = 0;
            o = 8'h00;
            for(index=0; index < N; index=index+1)
            begin
                aux[index] = 8'h00;
            end
        end

        else if(wr_en && reg_empty)
        begin
            for(index=0; index < N; index=index+1)
                aux[index] = i[index];
            reg_empty = 1'b0;
        end

        else if (req_fifo && !reg_empty)
        begin
            o = aux[n_read];

            if(n_read == (N-1))
            begin
                n_read = 0;
                reg_empty = 1'b1;
            end
            else
                n_read = n_read + 1;
        end
    end

endmodule