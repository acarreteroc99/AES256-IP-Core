
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// assign outputs: 16 output, 8 bits


module mod_dec_shifter( clk, resetn, 
                        inp_shf, ,      //  wr_en, outp_en,
                        outp_shf
                      );

  localparam N = 16;

  input clk, resetn;
  input [(N-1):0][7:0] inp_shf;
  //input wr_en, outp_en;

  reg [(N-1):0][7:0] aux;

  output [(N-1):0][7:0] outp_shf;

  integer index;

/*
  always @(posedge clk or negedge resetn)
  begin

    // Row 0
    outp_shf[0] <= inp_shf[0];
    outp_shf[1] <= inp_shf[1];
    outp_shf[2] <= inp_shf[2];
    outp_shf[3] <= inp_shf[3];

    // Row 1
    outp_shf[4] <= inp_shf[7];
    outp_shf[5] <= inp_shf[4];
    outp_shf[6] <= inp_shf[5];
    outp_shf[7] <= inp_shf[6];

    // Row 2
    outp_shf[8] <= inp_shf[10];
    outp_shf[9] <= inp_shf[11];
    outp_shf[10] <= inp_shf[8];
    outp_shf[11] <= inp_shf[9];

    // Row 3
    outp_shf[12] <= inp_shf[13];
    outp_shf[13] <= inp_shf[14];
    outp_shf[14] <= inp_shf[15];
    outp_shf[15] <= inp_shf[12];    
  
  end
  */

  // Row 0
    assign outp_shf[0] = inp_shf[0];
    assign outp_shf[1] = inp_shf[1];
    assign outp_shf[2] = inp_shf[2];
    assign outp_shf[3] = inp_shf[3];

    // Row 1
    assign outp_shf[4] = inp_shf[7];
    assign outp_shf[5] = inp_shf[4];
    assign outp_shf[6] = inp_shf[5];
    assign outp_shf[7] = inp_shf[6];

    // Row 2
    assign outp_shf[8] = inp_shf[10];
    assign outp_shf[9] = inp_shf[11];
    assign outp_shf[10] = inp_shf[8];
    assign outp_shf[11] = inp_shf[9];

    // Row 3
    assign outp_shf[12] = inp_shf[13];
    assign outp_shf[13] = inp_shf[14];
    assign outp_shf[14] = inp_shf[15];
    assign outp_shf[15] = inp_shf[12];    


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