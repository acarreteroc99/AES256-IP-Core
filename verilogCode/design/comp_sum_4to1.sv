
/****** comp_sum_2to1.sv *******/

// Inputs: 4 inputs, 16 bits each
// Outputs: 1 output, 16 bits

module comp_sum_4to1(clk, val1, val2, val3, val4, out, carry);
    
    /* verilator lint_off UNUSED */
    input   clk;                                // clock signal

    input   [15:0] val1; 
    input   [15:0] val2;                        
    input   [15:0] val3;
    input   [15:0] val4;

    output  [15:0] out;                        // signal sending the result
    output         carry;


    assign {carry, out} = val1 + val2 + val3 + val4;   

        
endmodule