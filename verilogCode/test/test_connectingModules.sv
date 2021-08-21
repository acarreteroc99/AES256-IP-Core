





`include "../design/mod_reg16.sv"
`include "../design/mod_reg4.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_reg16();

    localparam N = 16;
    localparam period = 20;

    reg clk, resetn, read;
    reg [N-1:0][7:0] i;
    
    wire [N-1:0][7:0] o;
    //wire [(N/4)-1:0][7:0] connection;
    wire [(N/4)-1:0][7:0] outp;

    integer index;

    mod_reg16 DUT(.clk(clk), .resetn(resetn), .read(read),
                    .i(i),
                    .o(o)
                    );

    mod_reg4 DUT4(.clk(clk), .resetn(resetn), .read(read),
                    .i(o[3:0]), 
                    .o(outp)
                    );

    always #100 clk = !clk;

    
    initial 
    begin

        $dumpfile("wv_testConnection.vcd");
        $dumpvars(0, tb_mod_reg16);
    
        i[0] = 8'h00;
        for(index=1; index < N; index=index+1)
            i[index] = i[index-1] + 8'h01;
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #period resetn = 1'b0;
        @(posedge clk)
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

    task test_print;
    begin
        #period;
        $display("Value: %h \n", o[3:0]);
        $display("Values o: %h \n", o[N-1:0]);
        $stop;
    end
    endtask
    

    task test_read;
    begin
        #period;
        #1000;
        for(index=0; index < N; index=index+1)
        begin
            #period;
            if(i[index] == outp[index])
                $display("Correct value: %h \n", outp[index]);
            else
                $display("Expected value: %h ;; Value read: %h ;; Pos: %d \n", i[index], outp[index], index);
        end
        $stop;
    end
    endtask

    initial
    begin
        clk = 1'b1;
        enableResetn;
        //test_resetn;
        enableRead;
        //test_print;
        read = 1'b1;
        test_read;
        $finish;
    end

endmodule