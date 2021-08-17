
`include "../design/enc/mod_mixColumns.sv"

`timescale 1ns/10ps     // time-unit = 1 ns, precision 10 ps

module mod_mixColumns(clk, en,
                        i,
                        o
                        );

    localparam N = 16;
    localparam period = 20;

    reg clk, en;
    reg [(N-1):0][7:0] i;

    wire [(N-1):0][7:0] o;

    integer j, k;

    mod_mixColumns(

                    );

    always #100 clk = !clk;

    // -------- Init input matrix ---------
    initial 
    begin
        $dumpfile("wv_mod_enc_addRoundKey.vcd");
            $dumpvars(0, tb_mod_enc_addRoundKey);

        //  INIT MATRIX WITH NESTED FOR'S
        i[0] = 8'h63;
        i[1] = 8'h53;
        i[2] = 8'he0;
        i[3] = 8'h8c;
        i[4] = 8'h09;
        i[5] = 8'h60;
        i[6] = 8'he1;
        i[7] = 8'h04;
        i[8] = 8'hcd;
        i[9] = 8'h70;
        i[10] = 8'hb7;
        i[11] = 8'h51;
        i[12] = 8'hba;
        i[13] = 8'hca;
        i[14] = 8'hd0;
        i[15] = 8'he7;

    end

    // -------- Testing mixColumn module ---------
    task test_mixColumns;
    begin
        for(j = 0; j < N/4; j=j+1)
        begin
            $display("( %h ", i[j*4]); 
            $display(" %h ", i[(j*4)+1]); 
            $display(" %h ", i[(j*4)+2]); 
            $display(" %h ) \n", i[(j*4)+3]);
        end
  
    end
    endtask

    initial 
    begin
        clk = 1'b0;
        en = 1'b1;
        #period;
        test_mixColumns();
    end

endmodule