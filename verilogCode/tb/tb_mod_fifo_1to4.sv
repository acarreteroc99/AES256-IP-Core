`include "../design/mod_fifo_1to4.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_fifo_1to4();

    localparam fifo_sz = 64;

    reg clk, resetn;
    reg [31:0] inp;
    reg wr_fifo, dec_fifo;
    reg size;

    wire [127:0] outp;
    wire fifo_full;

    integer index;

    mod_fifo_1to4 DUT(
                    .clk(clk), .resetn(resetn), 
                    .inp_fifo(inp), .wr_fifo(wr_fifo), .decrease_fifo(dec_fifo), .size(size),
                    .outp_fifo(outp), .fifo_full(fifo_full)
                );


    always #10 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_mod_fifo_1to4.vcd");
        $dumpvars(0, tb_mod_fifo_1to4);
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #1 resetn = 1'b0;
        @(posedge clk)
        #1 resetn = 1'b1;
    end
    endtask

    initial 
    begin
        clk = 1'b0;
        enableResetn;  
    end

    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            index <= 0;
            wr_fifo <= 0;
        end
        
        else
        begin
            if(index < 64)
            begin
                // ------- ENCRYPTION  -------
                if(index == 0)
                begin
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 1)
                begin
                    wr_fifo <= 1'b1;
                    inp <= index;
                end
                
                else if(index == 2)
                begin
                    wr_fifo <= 1'b0;
                    dec_fifo <= 1'b1;
                end

                else if(index == 3)
                begin
                    dec_fifo <= 1'b0;
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 4)
                begin
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 5)
                begin
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 6)
                begin
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 7)
                begin
                    dec_fifo <= 1'b1;
                    wr_fifo <= 1'b0;
                end


                else if(index == 8)
                begin
                    dec_fifo <= 1'b0;
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 9)
                begin
                    wr_fifo <= 1'b1;
                    inp <= index;
                end

                else if(index == 10)
                begin
                    wr_fifo <= 1'b0;
                    dec_fifo <= 1'b1;
                end

                else
                begin
                    dec_fifo <= 1'b0;
                    wr_fifo <= 1'b0;
                end

                index=index+1;

            end
        end
    end

endmodule