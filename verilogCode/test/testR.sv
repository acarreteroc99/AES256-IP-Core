

module testR(input clk, output reg a, b);
always @(posedge clk) begin
a <= 0;
a <= 1;
end

initial b = 0;
always @(posedge a) begin
b <= !b;
end
endmodule