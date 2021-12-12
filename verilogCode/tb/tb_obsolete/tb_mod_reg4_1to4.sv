


`include "../design/mod_reg4_1to4.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_reg4_1to4();

    localparam N = 4;
    localparam period = 20;

    reg clk, resetn, rd_en, wr_en;
    
    reg [7:0] i;
    reg [(N-1):0][7:0] aux;
    
    wire [(N-1):0][7:0] o;
    wire reg_full;

    integer index;

    mod_reg4_1to4 DUT(.clk(clk), .resetn(resetn), .rd_en(rd_en), .wr_en(wr_en),
                    .i(i),
                    .o(o), .reg_full(reg_full)
                    );

    always #10 clk = !clk;

    
    initial 
    begin

        $dumpfile("wv_mod_reg4_1to4.vcd");
        $dumpvars(0, tb_mod_reg4_1to4);
    
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #period resetn = 1'b0;
        @(posedge clk)
        #period resetn = 1'b1;
    end
    endtask

    
    task enableWrite;
    begin
        //$display("Enabling read signal");
        @(posedge clk)
        wr_en = 1'b1;
        @(negedge clk)
        wr_en = 1'b0;
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
            $display("Register status: ", reg_full);
        end
        //$stop;
    end
    endtask

    task test_setInput;
        input [7:0] inn;
        input integer indexx;
        input wr_en1;
    begin
        @(posedge clk)
        i = inn;
        aux[indexx] = inn;
        wr_en = wr_en1;

    end
    endtask


    task test_read;
    input rd_enable;
    begin
        rd_en = rd_enable;
        #20 for(index=0; index < N; index=index+1)
        begin
            //#period;
            if(aux[index] == o[index])
                $display("Aux value: %h ;; Output value: %h \n", aux[index], o[index]);
            else
                $display("Expected value: %h ;; Value read: %h ;; Pos: %d \n", aux[index], o[index], index);
        end
    end
    endtask

    initial
    begin
        clk = 1'b0;
        enableResetn;

        test_setInput(8'h00, 0, 1);
        
        test_setInput(8'h01, 1, 1);
       
        test_setInput(8'h02, 2, 1);
        
        test_setInput(8'h03, 3, 0);
   
        test_setInput(8'h04, 3, 1);

        //test_read(0);    
        test_read(1);
        


        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        //test_read(1);

        $finish;
    end

endmodule