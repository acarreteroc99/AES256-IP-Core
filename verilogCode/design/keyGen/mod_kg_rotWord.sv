
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// assign outputs: 16 output, 8 bits


module mod_kg_rotWord( 
                        clk, resetn, 
                        inp_rotWord, wr_rotWord,
                        outp_rotWord //, outp_en_rotWord
                      );

  input clk, resetn;
  input wr_rotWord; //, outp_en_rotWord;
  input [3:0][7:0] inp_rotWord;
  output reg [3:0][7:0] outp_rotWord;

  //reg [3:0][7:0] aux;

  always @(posedge clk or negedge resetn) 
  begin

    if(!resetn)
    begin
      outp_rotWord <= 0;
    end

    else
    begin
      if(wr_rotWord)
      begin
        outp_rotWord[0] <= inp_rotWord[1];
        outp_rotWord[1] <= inp_rotWord[2];
        outp_rotWord[2] <= inp_rotWord[3];
        outp_rotWord[3] <= inp_rotWord[0];
        
        /*
        aux[0] <= inp_rotWord[1];
        aux[1] <= inp_rotWord[2];
        aux[2] <= inp_rotWord[3];
        aux[3] <= inp_rotWord[0];
        */
      end
      /*
      else if (outp_en_rotWord) 
      begin
        outp_rotWord[0] <= aux[0];
        outp_rotWord[1] <= aux[1];
        outp_rotWord[2] <= aux[2];
        outp_rotWord[3] <= aux[3];
      end
      */
    end

  end

  /*
  assign outp_rotWord[0] = inp_rotWord[1];
  assign outp_rotWord[1] = inp_rotWord[2];
  assign outp_rotWord[2] = inp_rotWord[3];
  assign outp_rotWord[3] = inp_rotWord[0];
  */

endmodule

/*

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
        $display("-------------------------------------------------------------------------"); 
*/