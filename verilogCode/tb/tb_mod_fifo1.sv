
/*  ==================  LINK TO SOURCE CODE ==================
*
*   https://electrosofts.com/verilog/fifo.html
*
*/

`define BUF_WIDTH 3

`include "../design/mod_fifo1.sv"

module tb_mod_fifo1();
reg clk, rst, wr_en, rd_en ;
reg[7:0] buf_in;
reg[7:0] tempdata;
wire [7:0] buf_out;
wire [`BUF_WIDTH :0] fifo_counter;

integer counter;

mod_fifo1 ff( .clk(clk), .rst(rst), .buf_in(buf_in), .buf_out(buf_out), 
         .wr_en(wr_en), .rd_en(rd_en), .buf_empty(buf_empty), 
         .buf_full(buf_full), .fifo_counter(fifo_counter) );

initial
begin

    $dumpfile("wv_mod_fifo1.vcd");
    $dumpvars(0, tb_mod_fifo1);

    clk = 0;
    rst = 1;
        rd_en = 0;
        wr_en = 0;
        tempdata = 0;
        buf_in = 0;

    counter = 0;

        #15 rst = 0;
  
        push(1);
        fork
           push(2);
           pop(tempdata);
        join              //push and pop together   
        push(10);
        push(20);
        push(30);
        push(40);
        push(50);
        push(60);
        push(70);
        push(80);
        push(90);
        push(100);
        push(110);
        push(120);
        push(130);

        pop(tempdata);
        push(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
   push(140);
        pop(tempdata);
        push(tempdata);//
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        push(5);
        pop(tempdata);

        $finish;
end

always
   #5 clk = ~clk;

task push;
input[7:0] data;


   if( buf_full )
            $display("---Cannot push: Buffer Full ;; Number of element: ", counter);
            
        else
        begin
           $display("Pushed ",data );
           buf_in = data;
           counter = counter+1;
           wr_en = 1;
                @(posedge clk);
                #1 wr_en = 0;
        end

endtask

task pop;
output [7:0] data;

   if( buf_empty )
            $display("---Cannot Pop: Buffer Empty---");
   else
        begin

     rd_en = 1;
          @(posedge clk);

          #1 rd_en = 0;
          data = buf_out;
          counter = counter-1;
           $display("-------------------------------Poped ", data);

        end
endtask

endmodule