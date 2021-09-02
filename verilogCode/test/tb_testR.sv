
`include "testR.sv"

module tb_testR;
reg clk = 0;
always #5 clk = ~clk;

wire a, b;
testR uut (clk, a, b);

initial 
    begin

        $dumpfile("wv_tb_testR.vcd");
        $dumpvars(0, tb_testR);

    end

initial begin
    $monitor("clk=%b a=%b b=%b", clk, a, b);
    repeat (100) @(posedge clk);
    $finish;
end
endmodule