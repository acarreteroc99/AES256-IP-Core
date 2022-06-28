
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// assign outputs: 16 output, 8 bits


module mod_dec_shifter( clk, resetn, 
                        inp_shf, outp_en,
                        outp_shf
                      );

  localparam N = 16;

  input clk, resetn;
  input [(N-1):0][7:0] inp_shf;
  input outp_en;

  reg [(N-1):0][7:0] aux;

  output reg [(N-1):0][7:0] outp_shf;

  integer index;

/*
always @(posedge clk or negedge resetn)
begin

  if(!resetn)
  begin
      for(index=0; index < N; index=index+1)
        aux[index] <= 0;
  end

  else
  begin
    aux <= inp_shf;

    if(outp_en)
    begin
      // Row 0
      outp_shf[0] <= aux[0];
      outp_shf[1] <= aux[1];
      outp_shf[2] <= aux[2];
      outp_shf[3] <= aux[3];

      // Row 1
      outp_shf[4] <= aux[7];
      outp_shf[5] <= aux[4];
      outp_shf[6] <= aux[5];
      outp_shf[7] <= aux[6];

      // Row 2
      outp_shf[8] <= aux[10];
      outp_shf[9] <= aux[11];
      outp_shf[10] <= aux[8];
      outp_shf[11] <= aux[9];

      // Row 3
      outp_shf[12] <= aux[13];
      outp_shf[13] <= aux[14];
      outp_shf[14] <= aux[15];
      outp_shf[15] <= aux[12];    
    end
  end
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