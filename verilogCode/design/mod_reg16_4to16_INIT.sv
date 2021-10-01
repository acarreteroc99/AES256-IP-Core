

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_4to16_INIT  (clk, resetn,
                        i, req_axi_in, rd_en,
                        o, reg_empty, reg_full
                        );

    localparam N = 16;
    localparam Nrows = 4;
    localparam elementsXRow = 4;
    integer index;

    input clk, resetn;
    input req_axi_in, rd_en;
    input [31:0] i;

    reg [(N-1):0][7:0] aux;                             // Stores the 16 values when they are inputed
    reg [1:0] n_wr;                                    // Maintains accountability of the elements that have been read

    output reg reg_empty;                               // 1: empty ;; 0: not completely empty
    output reg reg_full;
    output reg [(N-1):0][7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            reg_empty = 1'b1;
            n_wr = 0;
            
            for(index=0; index < N; index=index+1)
                aux[index] = 8'h00;
        end

        else if(/*reg_empty &&*/ req_axi_in)
        begin
            for(index=0; index < Nrows; index=index+1)
                aux[(n_wr*Nrows)+index] = i[8*index +: 8];

            if(n_wr == (Nrows-1))
                n_wr = 0;
            
            else
                n_wr = n_wr + 1;

            reg_empty = 1'b0;

        end

        else if(!reg_empty && rd_en)
        begin

            //for(index=0; index < N; index=index+1)
                //o[index] = aux[index];
            
            reg_empty = 1'b1;
        end
    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            reg_full = 1'b0;

        else 
        begin
            if(n_wr == (Nrows-1))
                reg_full = 1'b1;
            else
                reg_full = 1'b0;

        end
    end
    

    assign o = aux;

endmodule