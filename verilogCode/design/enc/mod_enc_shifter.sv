
/****** mod_enc_shifter.sv *******/

// Inputs: 16 inputs, 8 bits each
// assign outputs: 16 output, 8 bits


module mod_enc_shifter( clk, resetn, 
                        inp_shf, wr_en, outp_en,
                        outp_shf
                      );

  localparam N = 16;

  input clk, resetn;
  input wr_en;
  input [7:0] inp_shf;
  input outp_en;

  reg [15:0][7:0] aux;
  reg [3:0] counter;

  output [(N-1):0][7:0] outp_shf;

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
      begin
      for(index=N; index > 0; index=index-1)
        aux[index-2] <= aux[index-1];
      end
      aux[N-1]<= inp_shf;
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
  assign outp_shf[0] = aux[0];
  assign outp_shf[1] = aux[1];
  assign outp_shf[2] = aux[2];
  assign outp_shf[3] = aux[3];

  // Row 1
  assign outp_shf[4] = aux[5];
  assign outp_shf[5] = aux[6];
  assign outp_shf[6] = aux[7];
  assign outp_shf[7] = aux[4];

  // Row 2
  assign outp_shf[8] = aux[10];
  assign outp_shf[9] = aux[11];
  assign outp_shf[10] = aux[8];
  assign outp_shf[11] = aux[9];

  // Row 3
  assign outp_shf[12] = aux[15];
  assign outp_shf[13] = aux[12];
  assign outp_shf[14] = aux[13];
  assign outp_shf[15] = aux[14];    
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