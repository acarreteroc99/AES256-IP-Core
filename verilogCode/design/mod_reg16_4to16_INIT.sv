

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_4to16_INIT(
                                clk, resetn,
                                inp_regInit, req_axi_in, 
                                outp_regInit
                            );

    localparam N = 16;
    localparam Nrows = 4;
    localparam elementsXRow = 4;
    integer index;

    input clk, resetn;
    input req_axi_in;  
    input [31:0] inp_regInit;

    reg [(N-1):0][7:0] aux;                             // Stores the 16 values when they are inputed
    reg [1:0] n_wr;                                    // Maintains accountability of the elements that have been read
    reg [1:0] n_wr_delay;


    output reg [(N-1):0][7:0] outp_regInit;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            n_wr = 0;
            n_wr_delay = 0;
            aux = 0;
            
            /*
            for(index=0; index < N; index=index+1)
                aux[index] = 8'h00;
            */
        end

        else if(req_axi_in)
        begin
            for(index=0; index < Nrows; index=index+1)
            begin
                aux[(n_wr_delay*Nrows)+index] = inp_regInit[8*index +: 8];
                //aux[(n_wr*Nrows)+index] = inp_regInit[8*index +: 8];
                // $display("Position %d, value %h", (n_wr*Nrows)+index, aux[(n_wr*Nrows)+index]);
            end

            n_wr_delay = n_wr;

            if(n_wr == (Nrows-1))
            begin
                n_wr = 0;
                outp_regInit = {8'h04, 8'h00, 8'h00, 8'h00, 8'h03, 8'h00, 8'h00, 8'h00, 8'h02, 8'h00, 8'h00, 8'h00, 8'h01, 8'h00, 8'h00, 8'h00};
                //outp_regInit = aux;
            end
            else
                n_wr = n_wr + 1;
            
            /*
            if(n_wr_delay == (Nrows-1))
                outp_regInit = aux;
            */

        end
    end

    // assign outp_regInit = aux;

endmodule