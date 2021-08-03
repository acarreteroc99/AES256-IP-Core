
/****** comp_sft_8.sv *******/

// Inputs: 1 input, 8 bits
// Outputs: 1 output, 8 bits

//src: https://courses.cs.washington.edu/courses/cse467/05wi/pdfs/lectures/07-SequentialVerilog.pdf

module sft_8(clk, reset, shift, ld, Din, SI, Dout);

    input   clk;                // clock signal
    input   reset;                // clear register
    input   shift;              // shift
    input   ld;                 // load register from Din
    input   [7:0] Din;          // Data input for load
    input   SI;                 // Input bit to shift in
    
    output  [7:0] Dout;
    reg     [7:0] Dout;

    always @(posedge clk)
    begin
        if(reset)       Dout <= 0;
        else if (ld)    Dout <= Din;
        else if (shift) Dout <= { Dout[6:0], SI };
    end

endmodule