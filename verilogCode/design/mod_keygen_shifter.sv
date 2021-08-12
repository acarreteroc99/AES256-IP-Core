
/****** mod_enc_shifter.sv *******/

// Inputs: 4 inputs, 8 bits each
// Outputs: 4 output, 8 bits

module mod_keygen_shifter(clk, 
                        i, 
                        o
                      );

  /* verilator lint_off UNUSED */
  input clk;

  input [3:0][7:0] i;
  output [3:0][7:0] o;

  genvar index;

  assign o[3] = i[0];

  for(index=0; index < 3; index=index+1)
    assign o[index] = i[index+1];
  
    
endmodule