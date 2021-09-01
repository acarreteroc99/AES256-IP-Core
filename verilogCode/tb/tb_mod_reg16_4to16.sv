


`include "../design/mod_reg16_4to16.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_reg16_4to16();

    localparam Nout = 16;
    localparam Nin = 4;
    localparam period = 20;

    reg clk, resetn, rd_en, wr_en;

    reg [(Nin-1):0][7:0] i;
    reg [(Nout-1):0][7:0] aux;
    
    wire reg_full;
    wire [(Nout-1):0][7:0] o;
 

    integer index;

    mod_reg16_4to16 DUT(.clk(clk), .resetn(resetn), .rd_en(rd_en), .wr_en(wr_en),
                    .i(i),
                    .o(o), .reg_full(reg_full)
                    );

    always #100 clk = !clk;

    
    initial 
    begin

        $dumpfile("wv_mod_reg16_4to16.vcd");
        $dumpvars(0, tb_mod_reg16_4to16);
    
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
        //$display("Enabling read signal");
        @(posedge clk)
        rd_en = 1'b1;
        @(negedge clk)
        rd_en= 1'b0;
    end
    endtask

    task enableWrite;
    begin
        //$display("Enabling read signal");
        @(posedge clk)
        wr_en = 1'b1;
        @(negedge clk)
        wr_en= 1'b0;
    end
    endtask

    task test_resetn;
    begin
        if(!resetn)
        begin
            #period;
            for(index=0; index < Nout; index=index+1)
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

    task test_setInput;
        input [31:0] inn;
        input integer row;
    begin
        //$display("Value of input is: ", inn, "\n");
        for(index=0; index < Nin; index=index+1)
        begin
            i[index] = inn[8*index +: 8];
            // $display("Value of input is: %h", i[index]);
            aux[index+(row*4)] = i[index];//inn[8*i +: 8];
        end

        //i = inn;
        //aux[row] = inn;

    end
    endtask


    task test_read;
    begin
        #period;
        for(index=0; index < Nout; index=index+1)
        begin
            //#period;
            if(aux[index] == o[index])
                $display("CORRECT! Output value: %h \n", o[index]);
            else
                $display("Expected value: %h ;; Value read: %h ;; Pos: %d \n", aux[index], o[index], index);
        end
    end
    endtask

    initial
    begin
        clk = 1'b0;
        //enableResetn;
        //test_resetn;
        
        test_setInput(32'h00f000f0, 0);
        enableWrite;
 
        #period;
        test_setInput(32'h11221122, 1);
        enableWrite;

        #period;
        test_setInput(32'h22222222, 2);
        enableWrite;

        #period;
        test_setInput(32'h30303030, 3);
        enableWrite;
        
        #period;
        enableRead;
        test_read;
        $finish;
    end

endmodule