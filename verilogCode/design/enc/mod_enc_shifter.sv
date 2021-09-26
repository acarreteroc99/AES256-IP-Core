
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits


module mod_enc_shifter(clk, resetn, wr_en,
                        inp, reg41_full,
                        outp , done
                        );
  //localparam matSize = 16;
  localparam N = 4;

  // INLCUDE RESET SIGNAL FOR THE REGISTERS

  input clk, resetn, wr_en, reg41_full;
  input [(N-1):0][7:0] inp;

  reg reg_wrEn, reg_reg41Full;
  reg [(N-1):0][7:0] aux;
  reg aux_done;

  output reg [(N-1):0][7:0] outp;
  output reg done;                                        // Since the operation is very quick, putting a 'done' is not 'worthy'

  reg [1:0] row;

  reg delay_reg41Full, reg41_full_i;

  integer index;


  always @(posedge clk) 
  begin

    if(!resetn)
    begin
      row = 0;                                       
      //reg_reg41Full = 1'b0;
      
      for(index=0; index < N; index=index+1)
        aux[index] = 0;
      
    end

    else
    begin
     
        reg_wrEn = wr_en;
    
        if(!reg_wrEn && aux_done)                // ok_aux ;; if condition is !wr_en && done, everything seems to work properly
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
    
          if(row == (N-1))
            row = 0;
          else
            row = row + 1;

          aux_done = 1'b0;
               
        end

     end
  end

  /*
    We apply a 1-cycle delay to the reg41_full input signal so we don't get a not defined input, therefore dephasing everything. 
  */

  always @(posedge clk or negedge resetn)                 
  begin
      if(!resetn)
      begin
        for(index=0; index < N; index=index+1)
          aux[index] = 0;
      end

      else
      begin

        if(delay_reg41Full)
        begin
          aux = inp;
          aux_done = 1'b1;                              //ok_aux
        end
        else if (!reg_wrEn && aux_done)
        begin
            aux_done = 1'b0;
        end
        done = aux_done;

        delay_reg41Full = reg41_full;
      end
  end

/*
  The code below cannot be implemented since an 00,00,00,00appears as input
*/

/*
  always @(posedge clk or negedge resetn)                 
  begin

        if(delay_reg41Full)
        begin
          aux = inp;
          aux_done = 1'b1;                              //ok_aux
        end
        else if (!reg_wrEn && aux_done)
        begin
            aux_done = 1'b0;
        end
        done = aux_done;

  end
*/
  
  //always @(inp)
    //aux = inp;  
  
    
endmodule
