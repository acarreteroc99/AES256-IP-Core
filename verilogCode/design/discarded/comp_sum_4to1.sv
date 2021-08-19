
/****** comp_sum_2to1.sv *******/

// Inputs: 4 inputs, 16 bits each
// Outputs: 1 output, 16 bits

module comp_sum_4to1(clk, i1, i2, i3, i4, o, carry);
    
    localparam N = 16;

    /* verilator lint_off UNUSED */
    input   clk;                                // clock signal

    input   [(N-1):0] i1; 
    input   [(N-1):0] i2;                        
    input   [(N-1):0] i3;
    input   [(N-1):0] i4;

    output  [(N-1):0] o;                        // signal sending the result
    output         carry;


    assign {carry, o} = i1 + i2 + i3 + i4;   

        
endmodule