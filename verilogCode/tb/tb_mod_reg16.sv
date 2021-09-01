


`include "../design/mod_reg16.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_reg16();

    localparam N = 16;
    localparam period = 20;

    reg clk, resetn, wr_en;
    reg [(N-1):0][7:0] i;
    
    wire [(N-1):0][7:0] o;
    wire reg_full;

    integer index;

    mod_reg16 DUT(
                 .clk(clk), .resetn(resetn), .wr_en(wr_en),
                 .i(i),
                 .o(o), .reg_full(reg_full)
                 );


    always #100 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_mod_reg16.vcd");
        $dumpvars(0, tb_mod_reg16);
    
    end
    

    task enableResetn;
    begin
        // @(posedge clk)
        resetn = 1'b0;
        // @(posedge clk)
        #period resetn = 1'b1;
    end
    endtask


    task enableWrite;
    begin
        $display("Enabling write signal");
        @(posedge clk)
        #period wr_en = 1'b1;
        @(posedge clk)
        #period wr_en = 1'b0;
    end
    endtask

    task setInput;
    input reg [7:0] seed;
    begin
        i[0] = seed;
        for(index=1; index < N; index=index+1)
            i[index] = i[index-1] + 8'h01;
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
        //$stop;
    end
    endtask

    task test_read;
    begin
        #period;
        for(index=0; index < N; index=index+1)
        begin
            #period;
            if(i[index] == o[index])
                $display("Correct value: %h \n", o[index]);
            else
                $display("Expected value: %h ;; Value read: %h ;; Pos: %d \n", i[index], o[index], index);
        end
    end
    endtask

    initial
    begin
        clk = 1'b0;
        enableResetn;
        //test_resetn;

        setInput(8'h00);
        enableWrite;
        #period;

        test_read;

        setInput(8'h0f);
        enableWrite;
        #period;

        test_read;

        setInput(8'h10);
        enableWrite;
        #period;

        test_read;

        $finish;
    end

endmodule