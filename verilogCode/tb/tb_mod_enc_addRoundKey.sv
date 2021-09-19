
//`include "../design/enc/mod_enc_addRoundKey.sv"

`timescale 1ns/10ps     // time-unit = 1 ns, precision 10 ps

module tb_mod_enc_addRoundKey();

    localparam N = 16;

    reg clk, resetn, reg_empty, rd_comp, startBit, reg162_full;
    reg [(N-1):0][7:0] p;
    reg [127:0]     k;
    reg [3:0] round;

    wire [(N-1):0][7:0] o;
    wire ok;
    
    localparam period = 20;                                     // If period is 150, it works properly
    integer i;

    mod_enc_addRoundKey DUT(.clk(clk), .resetn(resetn), .reg163_status(reg_empty), .rd_comp(rd_comp), .startBit(startBit), .reg162_status(reg162_full),
                            .p(p), .k(k), .round(round),
                            .o(o), .ok(ok)
                            );

    always #10 clk = !clk;
    
    initial begin

        $dumpfile("wv_mod_enc_addRoundKey.vcd");
            $dumpvars(0, tb_mod_enc_addRoundKey);

    end

    task test_addRK;
    begin
        for(i=0; i < N; i=i+1)
        begin
            #period;
            if(o[i] == (p[i] ^ k[8*i +: 8]))
                $display("Correct value for: %h \n", o[i]);
            else
                $display("Something not working properly. Value: %h ; Exp. Val: %h ; Pos: %d \n", o[i], (p[i] ^ k[8*i +: 8]), i);
        end

        if(ok)
            $display("READY to load values to reg16", ok);
        else
            $display("Can't load values to reg16", ok);

        //$stop;
        
    end
    endtask

    initial 
    begin
        clk = 1'b0;    
        #1 resetn = 1'b0;
        #period resetn = 1'b1;
        #1 reg_empty = 1'b0;
        
        // ------------------ Testing it does not work when startBit == 0 ------------------------

        #1 startBit = 1'b0;                                        // If first test says "Something not working", 'startBit' signal works properly.

        #1 reg_empty = 1'b1;
        k = 128'h000102030405060708090a0b0c0d0e0f;
        #1 rd_comp = 1'b1;

        for(i=0; i < N; i=i+1)
            p[i] = 8'h00;

        #period test_addRK;
        #1 reg_empty = 1'b0;
        
        // ------------------ Testing it does work when round == 0 ------------------------

        #1 startBit = 1'b1;
        #1 round = 0;

        @(posedge clk)
        #1 rd_comp = 1'b0;
        #1 reg_empty = 1'b1;

        @(posedge clk)
        k = 128'h00010203040506070809010203040506;
        #1 rd_comp = 1'b1;
        for(i=0; i < N; i=i+1)
            p[i] = 8'h01;

        #period test_addRK;
        #1 reg_empty = 1'b0;
        
        // ------------------ Testing it does work when reg163 is empty and reg162 is full ------------------------
        
        @(posedge clk)
        #1 rd_comp = 1'b0;
        #1 reg_empty = 1'b1;
        
        #1 round = round + 1;
        #1 reg162_full = 1'b1;

        @(posedge clk)
        k = 128'h0f0e0d0c0b0a09080706050403020100;
        #1 rd_comp = 1'b1;
        for(i=0; i < N; i=i+1)
            p[i] = 8'h02;

        #period test_addRK;
        #1 reg_empty = 1'b0;

        $finish;
    end

endmodule