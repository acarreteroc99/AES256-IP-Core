
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits


module mod_enc_shifter(clk, reset, wr_en,
                        inp,
                        outp, done
                        );
  //localparam matSize = 16;
  localparam N = 4;

  // INLCUDE RESET SIGNAL FOR THE REGISTERS

  input clk, reset, wr_en;
  input [(N-1):0][7:0] inp;
  input [1:0] row;

  output reg[(N-1):0][7:0] outp;
  output reg done;

  reg [1:0] row;

  integer index;

  initial 
  begin
    row = 0;
    done = 0;  
  end

  always @* //(posedge clk)
  begin

    if(!resetn)
    begin
      row = 0;
      done = 0;
      for(index=0; index < N; index=index+1)
        outp[index] = 0;
    end

    if(wr_en)
    begin
      done = 1'b0;
      case(row)
        2'b00:
          begin
            outp[0] = inp[0];
            outp[1] = inp[1];
            outp[2] = inp[2];
            outp[3] = inp[3];
          end

        2'b01:
          begin
            outp[0] = inp[1];
            outp[1] = inp[2];
            outp[2] = inp[3];
            outp[3] = inp[0];
          end

        2'b10:
          begin
            outp[0] = inp[2];
            outp[1] = inp[3];
            outp[2] = inp[0];
            outp[3] = inp[1];
          end

        2'b11:
          begin
            outp[0] = inp[3];
            outp[1] = inp[0];
            outp[2] = inp[1];
            outp[3] = inp[2];
          end
      endcase
      
      if(row == (N-1))
        row = 0;
      else
        row = row + 1;
      
      done = 1'b1;
    end
  end
endmodule
