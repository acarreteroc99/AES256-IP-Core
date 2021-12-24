

`define FIFO_SZ 5

module mod_fifo(    clk, resetn, 
                    inp, ctrl_dataIn, ctrl_dataOut,
                    outp, fifo_full
            );

    input clk, resetn;
    input ctrl_dataIn, ctrl_dataOut;
    input [1:0] inp;
    output reg [1:0] outp;
    output reg fifo_full;

    reg [3:0] mod_cnt;
    reg [`FIFO_SZ-1:0][1:0] mod_fifo; 

    integer index;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            mod_cnt <= 0;
            //mod_fifo <= 3;
            fifo_full <= 0;

            //for(index=0; index < `FIFO_SZ; index=index+1)
                //mod_fifo <= 3;
        end

        else
        begin
            if(ctrl_dataIn)
            begin
                if(mod_cnt == `FIFO_SZ)
                begin

                    for(index = 0; index < `FIFO_SZ-1; index=index+1)
                    begin
                        mod_fifo[index] <= mod_fifo[index+1];
                    end

                    mod_fifo[`FIFO_SZ-1] <= inp;
                    fifo_full <= 1'b1;
                end

                else
                begin
                    mod_fifo[mod_cnt] <= inp;
                    mod_cnt <= mod_cnt + 1;
                end

                $display("-------- FIFO STATUS --------");
                $display("%d | %d | %d | %d | %d ", mod_fifo[0], mod_fifo[1], mod_fifo[2], mod_fifo[3], mod_fifo[4]);
            end 

            if(ctrl_dataOut)
            begin
                outp <= mod_fifo[0];
                mod_cnt <= mod_cnt - 1;
                fifo_full <= 1'b0;

                $display("Outp: %d; Cnt: %d; Full: %d", outp, mod_cnt, fifo_full);
            end
        end
    end


endmodule