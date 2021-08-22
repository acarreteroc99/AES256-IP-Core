

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_regCTRL(clk, resetn, read, 
                pos, value
                );

    localparam N = 5;                               // Number of flags of the CTRL register
    integer index;

    input clk, resetn, read;
    input value;                                    // Value to be inserted (0 or 1)
    input [(N-1):0] pos;                                // Position of the flag we are changing
    //input integer pos;

    reg [(N-1):0] flags;

    always @*
    begin
        if(!resetn)
            for(index=0; index < N; index=index+1)
                flags[index] = 0;
        else if(read)
        begin
                $display("Position of the array is: %d", pos);
                flags[pos] = value;
                $display("The value of the flags reg rn is: %b", flags);
        end
    end

endmodule