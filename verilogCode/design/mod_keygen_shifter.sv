
/****** mod_enc_shifter.sv *******/

// Inputs: 4 inputs, 8 bits each
// Outputs: 4 output, 8 bits

module mod_keygen_shifter(/*clk,*/ 
                        p00, p01, p02, p03,
                        o00, o01, o02, o03
                      );

  //input clk;

  input [7:0] p00;
  input [7:0] p01;
  input [7:0] p02;
  input [7:0] p03;

  output [7:0] o00;
  output [7:0] o01;
  output [7:0] o02;
  output [7:0] o03;

  
  assign o00 = p01;
  assign o01 = p02;
  assign o02 = p03;
  assign o03 = p00;
    
endmodule