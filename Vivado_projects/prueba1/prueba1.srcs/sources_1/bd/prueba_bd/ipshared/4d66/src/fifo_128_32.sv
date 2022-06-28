`define FIFO_SZ 64

module fifo_128_32(
                    clk, resetn, 
                    datain, wr_fifo, rd_fifo,
                    dataout, fifo_full
                    );

input clk, resetn;
input wr_fifo, rd_fifo;
input [127:0] datain;

output reg fifo_full;
output reg [31:0] dataout;

//reg [(`FIFO_SZ**0.5)-1:0] counter;
reg [`FIFO_SZ:0][31:0] fifo;
reg [5:0] rd_pointer, wr_pointer, counter;
wire [5:0] subs;
reg test;


assign subs = rd_pointer-4;

always @(subs, wr_pointer)
begin 
       if(wr_pointer >= subs) test <= 1'b1;    
end


always @(posedge clk or negedge resetn)
begin
    if(!resetn)
    begin
        fifo_full <= 1'b0;
        wr_pointer <= 0;
        fifo <= 0;
    end
    else
    begin
        if(counter>5'b11011) fifo_full <= 1'b1;    
        else fifo_full <= 1'b0;
	if(fifo_full==1'b0)
        begin	   
            if(wr_fifo)
            begin
                fifo[wr_pointer] <= datain[31:0];
                fifo[wr_pointer+1] <= datain[63:32];
                fifo[wr_pointer+2] <= datain[95:64];
                fifo[wr_pointer+3] <= datain[127:96];	 
	        if(wr_pointer==6'b111111) wr_pointer<=0;
	        else wr_pointer <= wr_pointer + 4;
            end
        end // else: !if(counter == `FIFO_SZ)
    end // else: !if(!resetn)
end // always @ (posedge clk or negedge resetn)


always @(posedge clk or negedge resetn)
begin
    if(!resetn)
    begin
	dataout <= 32'b0;
	rd_pointer <= 1'b0;
    end
    else
    begin
       if(rd_pointer != wr_pointer && rd_fifo)                // CAREFUL!!! MIGHT NEED TO BE AN ELSE IF INSTEAD OF AN IF
         begin
            dataout <= fifo[rd_pointer];
            rd_pointer <= rd_pointer+1;
         end
    end
end

always @(posedge clk or negedge resetn)
begin
	if(!resetn)
		begin
			counter<=5'b0;
    		end
	else
		begin
			if(fifo_full==1'b1)
				begin
					if(rd_fifo==1'b1) counter<=counter-1'b1;
				end
			else if(wr_fifo==1'b1)
				begin
					if(rd_fifo==1'b1) counter<=counter+3;
					else counter<=counter+4;
				end
		end
end 

	
endmodule
