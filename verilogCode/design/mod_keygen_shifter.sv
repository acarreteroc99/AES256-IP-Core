
/****** mod_enc_shifter.sv *******/

// Inputs: 4 inputs, 8 bits each
// Outputs: 4 output, 8 bits

module mod_keygen_shifter( 
                        in, 
                        out
                      );

  /* verilator lint_off UNUSED */
  //input clk;

  input [3:0][7:0] in;
  output [3:0][7:0] out;

  genvar i;

  assign out[3] = in[0];

  for(i=0; i < 3; i=i+1)
    assign out[i] = in[i+1];
  
    
endmodule