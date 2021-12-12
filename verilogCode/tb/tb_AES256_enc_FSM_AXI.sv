


// `include "../design/enc/AES256_enc_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_enc();

    localparam N = 16;
    localparam nflags = 8;
    localparam period = 20;

    reg clk, resetn;

    reg ctrl_dataIn_enc;
    reg [127:0] enc_key;
    reg [127:0] enc_dataIn;

    wire ctrl_dataOut_enc;
    reg [3:0] enc_keyAddr;
    wire [127:0] enc_dataOut;

    integer index;
    integer i = 0;

    AES256_enc DUT(
                    .clk(clk), .resetn(resetn),
                    .enc_dataIn(enc_dataIn), .ctrl_dataIn_enc(ctrl_dataIn_enc), .enc_key(enc_key), 
                    .enc_dataOut(enc_dataOut), .ctrl_dataOut_enc(ctrl_dataOut_enc), .enc_keyAddr(enc_keyAddr)
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

    task test_AES_encryption;
    begin
    
        $display("Plaintext: ", enc_dataIn);
        $display("Encrypted data: ", enc_dataOut);
        
        //while(!ctrl_dataOut_enc)
            //@(posedge clk);

        
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

    always @(enc_keyAddr)
    //always @(posedge clk or negedge resetn)
    begin
        case(enc_keyAddr)
            0: enc_key <= 128'h0f0e0d0c0b0a09080706050403020100;
            1: enc_key <= 128'h0f0e0d0c0b0a09080706050403020100;
            2: enc_key <= 128'hfe76abd6f178a6dafa72afd2fd74aad6;
            3: enc_key <= 128'hbb3862f6b4366ffabf3c66f2b83a63f6;
            4: enc_key <= 128'h4ae20fa0b494a47645ec02acbf9ead7e;
            5: enc_key <= 128'hde907ee865a81c1ed19e73e46ea21516;
            6: enc_key <= 128'h9f1964f3d5fb6b53616fcf252483cd89;
            7: enc_key <= 128'hdfd04709014039e164e825ffb576561b;
            8: enc_key <= 128'h0e907da49189195744727204251dbd21;
            9: enc_key <= 128'ha46ef2457bbeb54c7afe8cad1e16a952;
            10: enc_key <= 128'h903f344f9eaf49eb0f2650bc4b5422b8;
            11: enc_key <= 128'hdb4d7a727f238837049d3d7b7e63b1d6;
            12: enc_key <= 128'h0a5bec5a9a64d81504cb91fe0bedc142;
            13: enc_key <= 128'hb9a9b05662e4ca241dc74213195a7f68;
            14: enc_key <= 128'h2e4fb75424145b0ebe70831bbabb12e5;
        endcase
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