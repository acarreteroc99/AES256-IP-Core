
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits


module mod_enc_shifter(clk, 
                        inp, row,
                        outp, done
                        );
  //localparam matSize = 16;
  localparam N = 4;

  // INLCUDE RESET SIGNAL FOR THE REGISTERS

  input clk;
  input [(N-1):0][7:0] inp;
  input [1:0] row;

  output reg[(N-1):0][7:0] outp;
  output reg done;

  always @* //(posedge clk)
  begin
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

  done = 1'b1;

  end

endmodule


/*

  /*
  case(row)
    "00":
      for(i=0; i < 4; i = i+1)
        assign outp[i] = inp[i];
    "01":
    begin
      for(i=4; i < 7; i = i+1)
        assign outp[i] = inp[i+1];
      assign outp[7] = inp[4];
    end
    "10":
      for(i=8; i < 10; i = i + 1)
      begin
        assign outp[i] = inp[i+2];
        assign outp[i+2] = inp[i];
      end
    "11":
    begin
      assign outp[12] = inp[15];
      for(i = 13; i < matSize; i=i+1)
        assign outp[i] = inp[i-1];
    end
  endcase
  */

