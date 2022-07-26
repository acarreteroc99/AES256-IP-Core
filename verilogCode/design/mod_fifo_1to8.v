
`define FIFO_SZ 64

module mod_fifo_1to8(
                    clk, resetn, 
                    inp_fifo, wr_fifo, decrease_fifo, size,
                    outp_fifo, fifo_full
                    );

input clk, resetn;
input wr_fifo, decrease_fifo;
input size;
input [31:0] inp_fifo;

output reg fifo_full;
output reg [255:0] outp_fifo;

reg [`FIFO_SZ:0][31:0] fifo;
reg [5:0] counter;

integer index;

always @(posedge clk or negedge resetn)
begin
    if(!resetn)
    begin
        fifo_full <= 1'b0;
        counter <= 0;
        fifo <= 0;
    end

    else
    begin
        if(counter == `FIFO_SZ)
            fifo_full <= 1'b1;
        
        else
        begin
            fifo_full <= 1'b0;

            if(wr_fifo)
            begin
                fifo[counter] <= inp_fifo;
                counter <= counter + 1;
            end

            if(counter >= 8 && decrease_fifo)                // CAREFUL!!! MIGHT NEED TO BE AN ELSE IF INSTEAD OF AN IF
            begin
                outp_fifo <= {fifo[7], fifo[6], fifo[5], fifo[4],fifo[3], fifo[2], fifo[1], fifo[0]};
                counter <= counter-8;

                for(index = 8; index < `FIFO_SZ-1; index=index+1)
                begin
                    fifo[index-8] <= fifo[index];
                end
            end
        end
    end
end

endmodule
