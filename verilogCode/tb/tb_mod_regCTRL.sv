


`include "../design/mod_regCTRL.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_regCTRL();

    localparam N = 5;
    localparam period = 20;

    reg clk, resetn, read;
    reg value;
    
    reg [(N-1):0] pos;

    integer index;

    mod_regCTRL DUT(.clk(clk), .resetn(resetn), .read(read),
                    .pos(pos), .value(value)
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

    task enableRead;
    begin
        $display("Enabling read signal");
        @(posedge clk)
        #period read = 1'b1;
        @(posedge clk)
        #period read = 1'b0;
    end
    endtask

    /*
    task test_resetn;
    begin
        if(!resetn)
        begin
            #period;
            for(index=0; index < N; index=index+1)
            begin
                #period;
                if(o[index] == 8'h00)
                    $display("Correct value in position %d \n", o[index]);
                else
                    $display("Something not working properly. Value: %h ; Pos: %d \n", o[index], index);
            end 
        end
        $stop;
    end
    endtask
    */

    /*
    task test_read;
    begin
        #period;
        
        $display("Current value of flags is: %b \n", flags);

        //$stop;
    end
    endtask
    */

    initial
    begin
        clk = 1'b1;
        enableResetn;
        //test_resetn;
        //enableRead;
        read = 1'b1;
        @(posedge clk)
        value = 1'b1;
        pos = 0;
      
        @(posedge clk)
        value = 1'b1;
        pos = 3;
        @(posedge clk)
        value = 1'b0;
        pos = 0;
        #period;

        //  CHECK RESULT IN flags REG IN PLOTTED WAVEFORM
        
        $finish;
    end

endmodule