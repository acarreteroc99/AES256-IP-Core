
//`include "../design/enc/mod_enc_mixColumns.sv"

`timescale 1ns/10ps     // time-unit = 1 ns, precision 10 ps

module tb_mod_enc_mixColumns();

    localparam N = 16;
    localparam period = 20;

    reg clk, rst, wr_en;
    reg [(N-1):0][7:0] i;

    wire [(N-1):0][7:0] o;

    genvar j;
    integer index;

    mod_enc_mixColumns DUT(
                        .clk(clk), .resetn(rst),
                        .state(i), .wr_en(wr_en),
                        .state_out(o)
                        );

    always #10 clk = !clk;

    // -------- Init input matrix ---------
    initial 
    begin
        $dumpfile("wv_mod_enc_mixColumns.vcd");
        $dumpvars(0, tb_mod_enc_mixColumns);

        //i = {8'h63, 8'h53, 8'he0, 8'h8c, 8'h09, 8'h60, 8'he1, 8'h04, 8'hcd, 8'h70, 8'hb7, 8'h51, 8'hba, 8'hca, 8'hd0, 8'he7};

    end

    // -------- Testing mixColumn module ---------
    task test_mixColumns;
    begin
        //@(posedge clk)
        //begin
        /*begin
            for(j = 0; j < N/4; j=j+1)
            begin
                $display("( %h ", o[(j*8)+7:(j*8)]); 
                $display(" %h ", o[(j*8)+7*2:(j*8)+8]); 
                $display(" %h ", o[(j*8)+7*3:(j*8)+8*2]); 
                $display(" %h ) \n", o[(j*8)+7*4:(j*8)+8*3]);
            end
            done = 1'b1;
        end*/

        $display("Value in output vector is: %h \n", o); 
        
        //#period reg162_full = 1'b1;

        /*
        $display("Value for pos 0,0 is %h \n", o[7:0]); 
        $display("Value for pos 0,1 is %h \n", o[15:8]); 
        $display("Value for pos 0,2 is %h \n", o[23:16]); 
        $display("Value for pos 0,3 is %h \n", o[31:24]);
        $display("Value for pos 1,0 is %h \n", o[39:32]);
        $display("Value for pos 1,1 is %h \n", o[47:40]);
        $display("Value for pos 1,2 is %h \n", o[55:48]);
        $display("Value for pos 1,3 is %h \n", o[63:56]);
        $display("Value for pos 2,0 is %h \n", o[71:64]);
        $display("Value for pos 2,1 is %h \n", o[79:72]);
        $display("Value for pos 2,2 is %h \n", o[87:80]);
        $display("Value for pos 2,3 is %h \n", o[95:88]);
        $display("Value for pos 3,0 is %h \n", o[103:96]);
        $display("Value for pos 3,1 is %h \n", o[111:104]);
        $display("Value for pos 3,2 is %h \n", o[119:112]);
        $display("Value for pos 3,3 is %h \n", o[127:120]);
        */
        //end
    end
    endtask

    initial 
    begin
        clk = 1'b0;
        rst = 1'b0;
        #period rst = 1'b1;

        wr_en = 1'b1;

        i[0] = 8'hab; i[1] = 8'hab; i[2] = 8'hd7;    i[3] = 8'hfe;
        i[4] = 8'h67; i[5] = 8'h01; i[6] = 8'h30;    i[7] = 8'h01;
        i[8] = 8'h6b; i[9] = 8'hf2; i[10] = 8'hf2;   i[11] = 8'h6f;
        i[12] = 8'h63; i[13] = 8'hc5; i[14] = 8'h77;   i[15] = 8'h7c;
        
        /*
        i[0] = 8'h63;
        i[1] = 8'h53;
        i[2] = 8'he0;
        i[3] = 8'h8c;
        i[4] = 8'h09;
        i[5] = 8'h60;
        i[6]  = 8'he1;
        i[7] = 8'h04;
        i[8] = 8'hcd;
        i[9] = 8'h70;
        i[10] = 8'hb7;
        i[11]  = 8'h51;
        i[12]  = 8'hba;
        i[13] = 8'hca;
        i[14] = 8'hd0;
        i[15]  = 8'he7;
        */
        
        //reg161_full = 1'b1;
        
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        //reg161_full = 1'b0;
        
        //reg162_full = 1'b0;
        
        $display("Regular case: reg161 full and reg162 empty \n");

        for(index = 0; index < 10; index = index+1)
            @(posedge clk)

        test_mixColumns;
        
        //@(posedge clk)
        //reg161_full = 1'b0;
        
        
        for(index = 0; index < 10; index = index+1)
            @(posedge clk)
            
         $display("NOT Regular case: reg161 full and reg162 full \n");
        
        /*
        for(index = 0; index < N; index = index+1)
            i[index] = 8'h01;
        */
         
        //@(posedge clk)
        //reg161_full = 1'b1;
        
        @(posedge clk)
        //reg162_full = 1'b1;
        
        test_mixColumns;
        
        $display("NOT Regular case: reg161 empty and reg162 empty \n");
        
        /* 
        for(index = 0; index < N; index = index+1)
            i[index] = 8'h02;
        */
         
        
        test_mixColumns;
        
        $finish;
        
    end

endmodule