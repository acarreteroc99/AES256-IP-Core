
/****** enc_multiplicator.sv *******/

// Inputs: 16+4 inputs, 8 bits each
// Outputs: 1 output, 16 bits

`include "comp_mul_2to1.sv"
`include "comp_sum_4to1.sv"

module test_multiplicator(clk, 
                            val1m0, val1m1, val1m2, val1m3, 
                            val2m0, val2m1, val2m2, val2m3,
                            outm0, outm1, outm2, outm3,
                            outs0,
                            carrym0, carrym1, carrym2, carrym3,
                            carrys0, 
                            out0);
    
    input clk;
    
    input [7:0] val1m0;     input [7:0] val2m0;
    input [7:0] val1m1;     input [7:0] val2m1;
    input [7:0] val1m2;     input [7:0] val2m2;
    input [7:0] val1m3;     input [7:0] val2m3;
    
    output [15:0] outm0;
    output [15:0] outm1;
    output [15:0] outm2;
    output [15:0] outm3;

    output [15:0] outs0;

    output [15:0] out0;

    output          carrym0;    
    output          carrym1;       
    output          carrym2;    
    output          carrym3;

    output          carrys0;

    comp_mul_2to1 m0(clk, val1m0, val2m0, outm0, carrym0);
    comp_mul_2to1 m1(clk, val1m1, val2m1, outm1, carrym1);
    comp_mul_2to1 m2(clk, val1m2, val2m2, outm2, carrym2);
    comp_mul_2to1 m3(clk, val1m3, val2m3, outm3, carrym3);

    comp_sum_4to1 s0(clk, outm0, outm1, outm2, outm3, outs0, carrys0); 
    
    assign out0 = outs0;

endmodule