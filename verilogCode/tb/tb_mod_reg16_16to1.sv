

//`include "../design/mod_reg16_16to1.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_reg16_16to1();

    localparam N = 16;
    localparam period = 20;
    integer index;

    reg clk, resetn;
    reg wr_en, req_fifo;
    reg [(N-1):0][7:0] i;

    wire reg_empty;                               // 1: empty ;; 0: not completely empty
    wire [7:0] o;

    mod_reg16_16to1 DUT(.clk(clk), .resetn(resetn), .wr_en(wr_en), .req_fifo(req_fifo), 
                        .i(i), 
                        .o(o), .reg_empty(reg_empty)
                        );

    always #10 clk = !clk;

    
    initial 
    begin

        $dumpfile("wv_mod_reg16_16to1.vcd");
        $dumpvars(0, tb_mod_reg16_16to1);
    
    end

    task test_fifoReq;
        input [7:0] inVal;
        input [3:0] index;
    begin
        if(o[index] == inVal)
            $display("Correct value for: %h \n", o[index]);
        else
            $display("Something not working properly. Value: %h ; Exp. Val: %h \n", o[index], inVal);

    end
    endtask

    initial 
    begin
        clk = 1'b0;
        resetn = 1'b0;                              // Reseting the device and all its registers
        #100 resetn = 1'b1;    
        
        // -----------------------  TEST 1 ----------------------------------------

        wr_en = 1'b1;                               // addRK module has calculated the output. Ready for transfer

        @(posedge clk)
        begin
        i[0] = 8'h00;
        for(index=1; index < N; index=index+1)      // Init input
            i[index] = i[index-1] + 8'h01;
        #period wr_en = 1'b0;                               // addRK not ready for the transfer
        end
        
        for(index=0; index < N; index=index+1)      // Testing register
        begin
            @(posedge clk)
            begin
                req_fifo = 1'b1;
                test_fifoReq(i[index], index);     
            end         
            @(posedge clk)
            req_fifo = 1'b0;         
        end
        
        // -----------------------  TEST 2 ----------------------------------------
                            

        @(posedge clk)
        begin
        wr_en = 1'b1;  
        i[0] = 8'h00;
        for(index=1; index < N; index=index+1)      // Init input
            i[index] = i[index-1] + 8'h02;
        wr_en = 1'b0;        
        end                       
        
        for(index=0; index < N; index=index+1)      
        begin
            @(posedge clk)
            begin
                req_fifo = 1'b1;
                test_fifoReq(i[index], index);     
            end         
            @(posedge clk)
            req_fifo = 1'b0;         
        end
        
        // -----------------------  TEST 3 ----------------------------------------

        wr_en = 1'b1;            

        @(posedge clk)
        begin
        i[0] = 8'h00;
        for(index=1; index < N; index=index+1)      // Init input
            i[index] = i[index-1] + 8'h04;
        wr_en = 1'b0;        
        end                       
        
        for(index=0; index < N; index=index+1)      
        begin
            @(posedge clk)
            begin
                req_fifo = 1'b1;
                test_fifoReq(i[index], index);     
            end         
            @(posedge clk)
            req_fifo = 1'b0;         
        end                      

        $finish;

    end

endmodule