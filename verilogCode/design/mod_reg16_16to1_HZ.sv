

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16_16to1( clk, resetn,
                        i, wr_en, req_rom,
                        o, reg_empty
                      );

    localparam N = 16;
    integer index;

    input clk, resetn;
    input wr_en, req_rom;                                      // AddRK warns if it is ready to give input ; ROM requests information.
    input [(N-1):0][7:0] i;                                     // Matrix as input coming from addRK.

    reg [(N-1):0][7:0] aux;                                     // Stores the 16 values when they are inputed.
    reg [3:0] n_read;                                           // Maintains accountability of the elements that have been read.

    output reg reg_empty;                                       // 1: empty ;; 0: not completely empty.
    output reg [7:0] o;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            n_read = 0;
            reg_empty = 1'b1;

            for(index=0; index < N; index=index+1)
                aux[index] = 0;
        end

        else
        begin
            if(wr_en == 1)                                      // If information is ready in addRK, store it in aux register. 
            begin
                for(index=0; index < N; index=index+1)
                    aux[index] = i[index];
            end
        end
    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            n_read = 0;
        end
        else
        begin
            if(req_rom)                                        // ROM asks for information to the register
            begin
                if(n_read == (N-1))                             // All data (16 bytes) have been read
                    n_read = 0;
                else
                    n_read = n_read + 1;
            end
        end
    end

    assign o = aux[n_read];
    
endmodule
