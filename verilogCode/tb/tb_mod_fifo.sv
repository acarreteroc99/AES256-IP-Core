`include "../design/mod_fifo.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_fifo();

    localparam fifo_sz = 10;

    reg clk, resetn;
    reg [1:0] inp;
    reg ctrl_dataIn, ctrl_dataOut;

    wire [1:0] outp;
    wire fifo_full;

    integer index;

    mod_fifo DUT(
                        .clk(clk), .resetn(resetn), 
                        .inp(inp), .ctrl_dataIn(ctrl_dataIn), .ctrl_dataOut(ctrl_dataOut),
                        .outp(outp), .fifo_full(fifo_full)
                    );


    always #10 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_mod_fifo.vcd");
        $dumpvars(0, tb_mod_fifo);
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
            ctrl_dataIn <= 0;
        end
        
        else
        begin
            if(index < 12)
            begin
                // ------- ENCRYPTION  -------
                if(index == 0)
                begin
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b00;
                end

                else if(index == 1)
                begin
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b10;
                end
                
                else if(index == 2)
                begin
                    ctrl_dataIn <= 1'b0;
                    ctrl_dataOut <= 1'b1;
                end

                else if(index == 3)
                begin
                    ctrl_dataOut <= 1'b0;
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b01;
                end

                else if(index == 4)
                begin
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b10;
                end

                else if(index == 5)
                begin
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b01;
                end

                else if(index == 6)
                begin
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b01;
                end

                else if(index == 7)
                begin
                    ctrl_dataOut <= 1'b1;
                end

                else if(index == 8)
                begin
                    ctrl_dataOut <= 1'b1;
                end

                else if(index == 9)
                begin
                    ctrl_dataOut <= 1'b0;
                    ctrl_dataIn <= 1'b1;
                    inp <= 2'b0;
                end

                else if(index == 10)
                begin
                    //ctrl_dataIn <= 1'b1;
                    //inp <= 2'b0;
                end

                else if(index == 11)
                begin
                    ctrl_dataIn <= 1'b0;
                    ctrl_dataOut <= 1'b0;
                end

                index=index+1;

            end
        end
    end

endmodule