
/****** mod_enc_shifter.sv *******/

// Inputs: 4 inputs, 8 bits each
// Outputs: 4 output, 8 bits

module mod_keygen_shifter(clk, 
                        i, 
                        o
                      );

  localparam N = 4;

  /* verilator lint_off UNUSED */
  input clk;

  input [N-1:0][7:0] i;
  output [N-1:0][7:0] o;

  genvar index;

  assign o[N-1] = i[0];

  for(index=1; index < N-1; index=index+1)
    assign o[index] = i[index+1];
  
    
endmodule