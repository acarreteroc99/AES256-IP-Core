
/*  ==================  LINK TO SOURCE CODE ==================
*
*   https://electrosofts.com/verilog/fifo.html
*
*/

`define BUF_WIDTH 3

`include "../design/mod_fifo1.sv"

module tb_mod_fifo1();

   localparam period = 20;

   reg clk, resetn, reg16_empty, rd_ROM;
   reg[7:0] inp;

   wire [7:0] outp;
   wire empty;


   mod_fifo1 ff(.clk(clk), .resetn(resetn),
               .inp(inp), .rd_ROM(rd_ROM), .reg16_empty(reg16_empty),  
               .outp(outp), .empty(empty)
               );

   always #10 clk = ~clk;

   task push;
      input[7:0] data;
      if( !empty )
               $display("---Cannot push: Buffer Full---");
               
      else
      begin
         $display("Data Pushed: ", data);
         inp = data;
      end

   endtask

   task pop;

      if( empty )
               $display("---Cannot Pop: Buffer Empty---");
      else
         begin
            $display("Data Poped: ", outp);

         end
   endtask

   initial
   begin

      $dumpfile("wv_mod_fifo1.vcd");
      $dumpvars(0, tb_mod_fifo1);

      clk = 1'b0;
      resetn = 1'b0;
      #period resetn = 1'b1;

      reg16_empty = 1'b0;
      rd_ROM = 1'b0;

      @(posedge clk)
      push(3);

      rd_ROM = 1'b1;
      
      @(posedge clk)
      @(posedge clk)
      pop();
      rd_ROM = 1'b0;

      @(posedge clk)
      rd_ROM = 1'b1;

      @(posedge clk)
      push(2);
      rd_ROM = 1'b0;

      @(posedge clk)
      push(5);
      rd_ROM = 1'b0;

      @(posedge clk)
      rd_ROM = 1'b1;

      @(posedge clk)
      pop();
      rd_ROM = 1'b0;

      $finish;
   end

endmodule