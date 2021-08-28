

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_regCTRL(clk, resetn, en, 
                    inp,
                    outp
                    );

    localparam N = 8;                               // Number of flags of the CTRL register
    integer index;

    input clk, resetn, en;
    input [(N-1):0] inp;
    output [(N-1):0] outp;

    reg [(N-1):0] flags;

    always @*
    begin
        if(!resetn)
            flags = 5'b0;
        else if(en)
            flags = inp;
    end

    assign outp = flags;

endmodule