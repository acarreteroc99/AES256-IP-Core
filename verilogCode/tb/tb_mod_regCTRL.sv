


`include "../design/mod_regCTRL.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_regCTRL();

    localparam N = 8;
    localparam period = 20;

    reg clk, resetn, en;
    reg [(N-1):0] p;

    integer index;

    mod_regCTRL DUT(.clk(clk), .resetn(resetn), .en(en),
                    .inp(p)
                    );

    always #100 clk = !clk;

    
    initial 
    begin

        $dumpfile("wv_mod_regCTRL.vcd");
        $dumpvars(0, tb_mod_regCTRL);
    
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #period resetn = 1'b0;
        @(negedge clk)
        #period resetn = 1'b1;
    end
    endtask

    task enableEnable;
    begin
        $display("Enabling enable signal");
        @(posedge clk)
        #period en = 1'b1;
        @(posedge clk)
        #period en = 1'b0;
    end
    endtask
    

    initial
    begin
        clk = 1'b1;
        enableResetn;
  
        en = 1'b1;
        @(posedge clk)
        p = 5'b01100;

      
        @(posedge clk)
        p = 5'b01000;


        @(posedge clk)
        p = 5'b10001;

        #period;

        
        $finish;
    end

endmodule