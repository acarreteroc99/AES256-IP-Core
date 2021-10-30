
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// assign outputs: 16 output, 8 bits


module mod_enc_shifter( clk, resetn, 
                        inp, wr_en, outp_en,
                        outp
                      );

  //localparam elementsXRow = 4;
  localparam N = 16;

  input clk, resetn;
  input wr_en;                                              // reg41_full;
  //input [(N-1):0][7:0] inp;
  input [7:0] inp;
  input outp_en;
  //input [1:0] row;

  reg [15:0][7:0] aux;
  reg [3:0] counter;

  output [(N-1):0][7:0] outp;
  
  //output reg done;                                        // Since the operation is very quick, putting a 'done' is not 'worthy'

  // reg [1:0] row;
  // reg delay_reg41Full, reg41_full_i;
  // reg aux_done;
  // reg reg_wrEn, reg_reg41Full;

  integer index;


  always @(posedge clk or negedge resetn) 
  begin
    
    if(!resetn)
    begin
      for(index=0; index < N; index=index+1)
        aux[index] = 0;
    end

    else
    begin

      if(wr_en)
/*      begin
        aux[counter] = inp;*/
      begin
      for(index=N; index > 0; index=index-1)
        aux[index-2] <= aux[index-1];
      end
      aux[N-1]<= inp;
 /*     else if(outp_en)
      begin
        //aux = inp;

        // Row 0
        outp[0] = aux[0];
        outp[1] = aux[1];
        outp[2] = aux[2];
        outp[3] = aux[3];

        // Row 1
        outp[4] = aux[5];
        outp[5] = aux[6];
        outp[6] = aux[7];
        outp[7] = aux[4];

        // Row 2
        outp[8] = aux[10];
        outp[9] = aux[11];
        outp[10] = aux[8];
        outp[11] = aux[9];

        // Row 3
        outp[12] = aux[15];
        outp[13] = aux[12];
        outp[14] = aux[13];
        outp[15] = aux[14];    

        
        $display("INPUT MATRIX shifter");
        for(index=0; index < 4; index=index+1)
        begin
          $display("%h, %h, %h, %h", aux[(index*4)+0], aux[(index*4)+1], aux[(index*4)+2], aux[(index*4)+3]);
          $display("------------------------");
        end

        $display("==========================");

        $display("OUTPUT MATRIX shifter");
        for(index=0; index < 4; index=index+1)
        begin
          $display("%h, %h, %h, %h", outp[(index*4)+0], outp[(index*4)+1], outp[(index*4)+2], outp[(index*4)+3]);
          $display("------------------------");
        end
        $display("-------------------------------------------------------------------------"); */
        

        /*
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
        */  
      //end
    end
  end   

  always @(posedge clk or negedge resetn)
  begin
    if(!resetn) 
      counter = 0;

    else 
    begin
      if(wr_en)
      begin
        if(counter == (N-1))
          counter = 0;
        else
          counter = counter+1;
      end
    end
  end


        // Row 0
        assign outp[0] = aux[0];
        assign outp[1] = aux[1];
        assign outp[2] = aux[2];
        assign outp[3] = aux[3];

        // Row 1
        assign outp[4] = aux[5];
        assign outp[5] = aux[6];
        assign outp[6] = aux[7];
        assign outp[7] = aux[4];

        // Row 2
        assign outp[8] = aux[10];
        assign outp[9] = aux[11];
        assign outp[10] = aux[8];
        assign outp[11] = aux[9];

        // Row 3
        assign outp[12] = aux[15];
        assign outp[13] = aux[12];
        assign outp[14] = aux[13];
        assign outp[15] = aux[14];    
endmodule

  /*
    We apply a 1-cycle delay to the reg41_full input signal so we don't get a not defined input, therefore dephasing everything. 
  */

  /*
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
  */

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
  
