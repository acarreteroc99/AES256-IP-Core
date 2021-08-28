
`include "../design/enc/mod_enc_addRoundKey.sv"

`timescale 1ns/10ps     // time-unit = 1 ns, precision 10 ps

module tb_mod_enc_addRoundKey();

    localparam N = 16;

    reg clk, resetn, reg_full, rd_comp;
    reg [(N-1):0][7:0] p;
    reg [127:0]     k;

    wire [(N-1):0][7:0] o;
    wire ok;
    
    localparam period = 20;
    integer i;

    mod_enc_addRoundKey DUT(.clk(clk), .resetn(resetn), .reg_full(reg_full), .rd_comp(rd_comp),
                            .p(p), .k(k),
                            .o(o), .ok(ok)
                            );

    always #100 clk = !clk;
    
    initial begin

        $dumpfile("wv_mod_enc_addRoundKey.vcd");
            $dumpvars(0, tb_mod_enc_addRoundKey);

        /* 

        p[0] = 8'h00; //8'hD4;
        p[1] = 8'h01; //8'hE0;
        p[2] = 8'h02; //8'hB8;
        p[3] = 8'h03; //8'h1E;
    
        p[4] = 8'h10; //8'h27;
        p[5] = 8'h11; //8'hBF;
        p[6] = 8'h12; //8'hB4;
        p[7] = 8'h13; //8'h41;

        p[8] = 8'h20; //8'h11;
        p[9] = 8'h21; //8'h98;
        p[10] = 8'h22; //8'h5D;
        p[11] = 8'h23; //8'h52;

        p[12] = 8'h30; //8'hAE;
        p[13] = 8'h31; //8'hF1;
        p[14] = 8'h32; //8'hE5;
        p[15] = 8'h33; //8'h30;

        */

        //p[0] = 8'h00;
        for(i=0; i < N; i=i+1)
            p[i] = 8'h00;
            //p[i] = p[i-1] + 8'h01;

    end

    task test_addRK;
    begin
        for(i=0; i < 16; i=i+1)
        begin
            #period;
            if(o[i] == (p[i] ^ k[8*i +: 8]))
                $display("Correct value for: %h \n", o[i]);
            else
                $display("Something not working properly. Value: %h ; Pos: %d \n", o[i], i);
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
        rd_comp = 1'b1;
        reg_full = 1'b0;

        @(posedge clk)
        k = 128'h000102030405060708090a0b0c0d0e0f;
        #period;
        test_addRK;
        reg_full = 1'b1;

        //#period; #period;

        @(posedge clk)
        rd_comp = 1'b0;
        reg_full = 1'b0;

        @(posedge clk)
        rd_comp = 1'b1;
        k = 128'h00010203040506070809010203040506;
        #period;
        test_addRK;

        //#period; #period;
        
        @(posedge clk)
        rd_comp = 1'b1;
        reg_full = 1'b0;

        @(posedge clk)
        k = 128'h0f0e0d0c0b0a09080706050403020100;
        #period;
        test_addRK;

        $finish;
    end

endmodule