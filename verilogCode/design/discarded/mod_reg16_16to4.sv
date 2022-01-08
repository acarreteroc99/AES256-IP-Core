

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_16to4  (clk, resetn,
                        i, wr_en, req_axi_out,
                        o, reg_empty
                        );

    localparam N = 16;
    localparam Nrows = 4;
    integer index;

    input clk, resetn;
    input wr_en, req_axi_out;
    input [(N-1):0][7:0] i;

    reg [(N-1):0][7:0] aux;                             // Stores the 16 values when they are inputed
    reg [1:0] n_rd;                                    // Maintains accountability of the elements that have been read

    output reg reg_empty;                               // 1: empty ;; 0: not completely empty
    output reg [31:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            reg_empty <= 1'b1;
            n_rd <= 0;
            
            aux <= 8'h00;
        end

        else if(reg_empty && wr_en)
        begin
            //for(index=0; index < N; index=index+1)
                //aux[index] <= i[index];
            
            aux <= i;
            
            reg_empty <= 1'b0;

        end

        else if(!reg_empty && req_axi_out)
        begin

            for(index=0; index < Nrows; index=index+1)
                o[8*index +: 8] <= aux[(n_rd*Nrows)+index];

            if(n_rd == (Nrows-1))
            begin
                n_rd <= 0;
                reg_empty <= 1'b1;
            end
            else
                n_rd <= n_rd + 1;
        end
    end

endmodule