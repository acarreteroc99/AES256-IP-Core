

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

    reg wr_enReg, req_fifoReg;
    //reg delay_regEmpty;

    output reg reg_empty;                               // 1: empty ;; 0: not completely empty
    output reg [7:0] o;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            //delay_regEmpty = 1'b1;
            reg_empty = 1'b1;                           // This register
            n_read = 0;

        end

        else 
        begin
            //reg_empty = delay_regEmpty;
            wr_enReg = wr_en;
            req_fifoReg = req_fifo;

            //if(delay_regEmpty && wr_enReg)                        
            if(reg_empty && wr_enReg) 
            begin
                for(index=0; index < N; index=index+1)
                    aux[index] = i[index];
                
                //delay_regEmpty = 1'b0;                            // Used to be '!reg_empty'
                reg_empty = 1'b0;
                wr_enReg = 1'b0;
            end

            //else if(!delay_regEmpty && req_fifoReg)                 // Used to be '!reg_empty'
            else if(!reg_empty && req_fifoReg) 
            begin
                req_fifoReg = 1'b0;
                
                o = aux[n_read];
                if(n_read == (N-1))
                begin
                    n_read = 0;
                    reg_empty = 1'b1;
                    //delay_regEmpty = 1'b1;
                end
                else
                    n_read = n_read + 1;
            end
        end
    end

endmodule