




/****** comp_mul_2to1.sv *******/

// Inputs: 2 inputs, 8 bits each
// Outputs: 2 output, 16 bits and 1

module comp_mul_2to1(clk, matA, matB, out, carry);

    localparam N = 16;

    /* verilator lint_off UNUSED */
    input   clk;                                // clock signal

    input   [7:0] matA; 
    input   [7:0] matB;                   
    
    output  [(N-1):0] out;                         // signal sending the result
    output         carry;

    // Falta poner senyal de reset para los registros

    assign {carry, out} = matA * matB;

endmodule