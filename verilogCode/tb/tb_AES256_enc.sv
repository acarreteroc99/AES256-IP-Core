


`include "../design/enc/AES256_enc.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_enc();

    localparam N = 16;
    localparam N_ADDR = 2;
    localparam nflags = 5;
    localparam period = 20;

    reg clk, resetn;

    reg [(nflags-1):0] flags;                                      // 0 or 1 to turn on/off a flag
    reg [(N_ADDR-1):0] addr;
    reg [(N-1):0][7:0] plaintext;

    wire [(N-1):0][7:0] encData;

    integer index;

    AES256_enc DUT(
                    .clk(clk), .resetn(resetn),
                    .plaintext(plaintext), .addr(addr), .flags(flags),
                    .encData(encData)
                    );


    always #100 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_AES256_enc.vcd");
        $dumpvars(0, tb_AES256_enc);
    
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #period resetn = 1'b0;
        @(posedge clk)
        #period resetn = 1'b1;
    end
    endtask


    /*task enableWrite;
    begin
        $display("Enabling write signal");
        @(posedge clk)
        #period wr_en = 1'b1;
        @(posedge clk)
        #period wr_en = 1'b0;
    end
    endtask*/

    /*task test_ctrlRegisterFlags;
    input index;
    input value;
    begin
        pos[index] = value;
        $display("Current flags: ", pos);
    end
    endtask*/

    /*task test_AES_encryption;
    begin
        pos[index] = value;
        $display("Current flags: ", pos);
    end
    endtask
    */

    initial 
    begin
        clk = 1'b0;
        enableResetn;

        // ----- TESTING CONTROL REGISTER -----
        addr = 1'b0;
        //test_ctrlRegisterFlags(0,1);
        #period;
        //test_ctrlRegisterFlags(3,1);
        #period;
        //test_ctrlRegisterFlags(0,0);
        #period;
        //test_ctrlRegisterFlags(2,1);
        #period;

        // ----- TESTING ENCRYPTION -----
        //test_AES_encryption;

    end

endmodule