


`include "../design/enc/AES256_enc.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_enc();

    localparam N = 16;
    //localparam N_ADDR = 2;
    localparam nflags = 8;
    localparam period = 20;

    reg clk, resetn;

    reg [(nflags-1):0] flags;                                      // 0 or 1 to turn on/off a flag
    reg [(N-1):0][7:0] plaintext;
    reg addr;
    //reg [(N_ADDR-1):0] addr;

    wire done;
    wire [(N-1):0][7:0] encData;

    integer index;

    AES256_enc DUT(
                    .clk(clk), .resetn(resetn),
                    .plaintext(plaintext), .addr(addr), .flags(flags),
                    .encData(encData), .done(done)
                    );


    always #10 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_AES256_enc.vcd");
        $dumpvars(0, tb_AES256_enc);
    
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #1 resetn = 1'b0;
        @(posedge clk)
        #1 resetn = 1'b1;
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

    task test_AES_encryption;
    begin
    
        $display("Plaintext: ", plaintext);
        $display("Encrypted data: ", encData);
        
        while(!done)
            @(posedge clk);

        if(encData == "91e88d65c47cb7dcc0d26c7da3830d7c")
            $display("CORRECT encryption!!! ");
        else
        begin
            $display("Something is not working buddy");
            $display("Should be: 91e88d65c47cb7dcc0d26c7da3830d7c");
            $display("Is: %h", encData);
        end
    end
    endtask
    

    initial 
    begin
        clk = 1'b0;
        enableResetn;

        // ----- TESTING CONTROL REGISTER -----
        /*
        addr = 1'b0;

        @(posedge clk)
        plaintext = 128'h0000000d;
        #period;
        
        @(posedge clk)
        plaintext = 128'h0000000f;
        #period;
        
        @(posedge clk)
        plaintext = 128'h33344448;
        #period;

        @(posedge clk)
        plaintext = 128'habcd1231;
        #period;
        */
        
        addr = 1'b0;
        plaintext = 128'h00000001;

        // ----- TESTING ENCRYPTION -----
        @(posedge clk)
        addr = 1'b1;

        //@(posedge clk)
        plaintext = 128'h0;                                                 // Encrypted: 5708bc9bb87ea81407002fbbf94e9f82
        //plaintext = 128'h00000101030307070f0f1f1f3f3f7f7f;
        
        test_AES_encryption;

        $finish;

    end

endmodule