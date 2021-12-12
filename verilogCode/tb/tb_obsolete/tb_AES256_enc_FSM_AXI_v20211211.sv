


// `include "../design/enc/AES256_enc_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_enc();

    localparam N = 16;
    localparam nflags = 8;
    localparam period = 20;

    reg clk, resetn;

    reg ctrl_dataIn_enc;
    reg [127:0] enc_dataIn;

    reg [127:0] enc_key;
    reg [3:0] enc_keyAddr;

    wire ctrl_dataOut_enc;
    wire [127:0] enc_dataOut;

    integer index;
    integer i = 0;

    AES256_enc DUT(
                    .clk(clk), .resetn(resetn),
                    .enc_dataIn(enc_dataIn), .ctrl_dataIn_enc(ctrl_dataIn_enc), //.enc_key(enc_key), 
                    .enc_dataOut(enc_dataOut), .ctrl_dataOut_enc(ctrl_dataOut_enc) //, .enc_keyAddr(enc_keyAddr) 
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


    /*
    task enableWrite;
    begin
        $display("Enabling write signal");
        @(posedge clk)
        #period wr_en = 1'b1;
        @(posedge clk)
        #period wr_en = 1'b0;
    end
    endtask
    */

    task test_AES_encryption;
    begin
    
        $display("Plaintext: ", enc_dataIn);
        $display("Encrypted data: ", enc_dataOut);
        
        while(!ctrl_dataOut_enc)
            @(posedge clk);

        
        //if(enc_dataOut == "723409577d55479216b526445de7cdbf")
        if(enc_dataOut == "633aadc43c56b3d6ea93bcfe994d587a")
            $display("CORRECT encryption!!! ");
        else
        begin
            $display("Something is not working buddy");
            //$display("Should be: 723409577d55479216b526445de7cdbf");
            $display("Should be: 633aadc43c56b3d6ea93bcfe994d587a");
            $display("Is: %h", enc_dataOut);
        end
        
    end
    endtask
    

    initial 
    begin
        clk = 1'b0;
        enableResetn;
        
        @(posedge clk)
        ctrl_dataIn_enc = 1'b1;

        @(posedge clk)
        enc_dataIn = 128'h04000000030000000200000001000000;
        
        test_AES_encryption;

        $finish;

    end

    /*
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            i = 0;
            ctrl_dataIn_enc = 1'b0;    
        end
        
        else
        begin
            if(i < 4)
            begin
                ctrl_dataIn_enc = 1'b1;
                addr = 1'b1;
                enc_dataIn = enc_dataIn + 32'h01000000;

            end
            else if(i == 5)
            begin
                #1 ctrl_dataIn_enc = 1'b1;
                addr = 1'b0; 
                enc_dataIn = 32'h1;
            end
            else
            begin
                #1 ctrl_dataIn_enc = 1'b0;
            end

            if(i < 6)
                i = i+1;
        end    
    end
    */

endmodule