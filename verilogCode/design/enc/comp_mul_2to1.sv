




/****** comp_mul_2to1.sv *******/

// Inputs: 2 inputs, 8 bits each
// Outputs: 2 output, 16 bits and 1

module comp_mul_2to1(clk, /*resetn,*/ matA, matB, out, carry);

    /* verilator lint_off UNUSED */
    input   clk;                                // clock signal
    //input   resetn;                            // reset signal

    input   [7:0] matA; 
    input   [7:0] matB;                   
    
    output  [15:0] out;                         // signal sending the result
    output         carry;

    // Falta poner senyal de reset para los registros

    assign {carry, out} = matA * matB;

endmodule