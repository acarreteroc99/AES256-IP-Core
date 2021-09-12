
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits


module mod_enc_shifter(clk, resetn, wr_en,
                        inp, reg41_full,
                        outp, done
                        );
  //localparam matSize = 16;
  localparam N = 4;

  // INLCUDE RESET SIGNAL FOR THE REGISTERS

  input clk, resetn, wr_en, reg41_full;
  input [(N-1):0][7:0] inp;

  reg reg_wrEn, reg_reg41Full;
  reg [(N-1):0][7:0] aux;

  output reg [(N-1):0][7:0] outp;
  output reg done;

  reg [1:0] row;

  integer index;


  always @(posedge clk) //or negedge resetn)
  begin

    if(!resetn)
    begin
      row = -1;                                     // Seedy solution. Shoudl be fixed
      done = 1'b1;
      //for(index=0; index < N; index=index+1)
        //outp[index] = 0;
    end

    else
    begin
        reg_wrEn = wr_en;
        reg_reg41Full = reg41_full;
        aux = inp;
        //$display("Input: %h", inp);
        //$display("Aux: %h", aux);
    
        if(!reg_wrEn && reg_reg41Full)                // if condition is !wr_en && done, everything seems to work properly
        begin
          case(row)
            0:
              begin
                outp[0] = aux[0];
                outp[1] = aux[1];
                outp[2] = aux[2];
                outp[3] = aux[3];
              end
    
            1:
              begin
                outp[0] = aux[1];
                outp[1] = aux[2];
                outp[2] = aux[3];
                outp[3] = aux[0];
              end
    
            2:
              begin
                outp[0] = aux[2];
                outp[1] = aux[3];
                outp[2] = aux[0];
                outp[3] = aux[1];
              end
    
            3:
              begin
                outp[0] = aux[3];
                outp[1] = aux[0];
                outp[2] = aux[1];
                outp[3] = aux[2];
              end
          endcase
          
          //$display("done equals 0");
          done = 1'b0;
    
          if(row == (N-1))
            row = 0;
          else
            row = row + 1;
               
        end

        else 
        begin
          //$display("DONE EQUALS 1");
          done = 1'b1;                              // Used to be a 1
        end
     end
  end
endmodule
