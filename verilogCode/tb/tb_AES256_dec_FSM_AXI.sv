


// `include "../design/enc/AES256_dec_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_dec();

    localparam N = 16;
    localparam nflags = 8;
    localparam period = 20;

    reg clk, resetn;

    reg ctrl_dataIn_dec;
    reg [127:0] dec_key;
    reg [127:0] dec_dataIn;

    wire ctrl_dataOut_dec;
    reg [3:0] dec_keyAddr;
    wire [127:0] dec_dataOut;

    integer index;
    integer i = 0;

    AES256_dec DUT(
                    .clk(clk), .resetn(resetn),
                    .dec_dataIn(dec_dataIn), .ctrl_dataIn_dec(ctrl_dataIn_dec), .dec_key(dec_key), 
                    .dec_dataOut(dec_dataOut), .ctrl_dataOut_dec(ctrl_dataOut_dec), .dec_keyAddr(dec_keyAddr)
                    );

    always #10 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_AES256_dec.vcd");
        $dumpvars(0, tb_AES256_dec);
    
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #1 resetn = 1'b0;
        @(posedge clk)
        #1 resetn = 1'b1;
    end
    endtask

    task test_AES_decryption;
    begin
    
        $display("Ciphered text: ", dec_dataIn);
        $display("Decrypted data: ", dec_dataOut);
        
        while(!ctrl_dataOut_dec)
            @(posedge clk);

        
        //if(dec_dataOut == "723409577d55479216b526445de7cdbf")
        if(dec_dataOut == "000102030405060708090a0b0c0d0e0f")
            $display("CORRECT decryption!!! ");
        else
        begin
            $display("Something is not working buddy");
            //$display("Should be: 723409577d55479216b526445de7cdbf");
            $display("Should be: 000102030405060708090a0b0c0d0e0f");
            $display("Is: %h", dec_dataOut);
        end
        
    end
    endtask
    

    initial 
    begin
        clk = 1'b0;
        enableResetn;
        
        @(posedge clk)
        ctrl_dataIn_dec = 1'b1;

        @(posedge clk)
        dec_dataIn = 128'h7a584d99febc93ead6b3563cc4ad3a63;
        
        test_AES_decryption;

        $finish;

    end

    
    always @(dec_keyAddr)
    //always @(posedge clk or negedge resetn)
    begin
        case(dec_keyAddr)
            0: dec_key <= 128'h0f0e0d0c0b0a09080706050403020100;
            1: dec_key <= 128'h0f0e0d0c0b0a09080706050403020100;
            2: dec_key <= 128'hfe76abd6f178a6dafa72afd2fd74aad6;
            3: dec_key <= 128'hbb3862f6b4366ffabf3c66f2b83a63f6;
            4: dec_key <= 128'h4ae20fa0b494a47645ec02acbf9ead7e;
            5: dec_key <= 128'hde907ee865a81c1ed19e73e46ea21516;
            6: dec_key <= 128'h9f1964f3d5fb6b53616fcf252483cd89;
            7: dec_key <= 128'hdfd04709014039e164e825ffb576561b;
            8: dec_key <= 128'h0e907da49189195744727204251dbd21;
            9: dec_key <= 128'ha46ef2457bbeb54c7afe8cad1e16a952;
            10: dec_key <= 128'h903f344f9eaf49eb0f2650bc4b5422b8;
            11: dec_key <= 128'hdb4d7a727f238837049d3d7b7e63b1d6;
            12: dec_key <= 128'h0a5bec5a9a64d81504cb91fe0bedc142;
            13: dec_key <= 128'hb9a9b05662e4ca241dc74213195a7f68;
            14: dec_key <= 128'h2e4fb75424145b0ebe70831bbabb12e5;
        endcase
    end 
    

    /*
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            i = 0;
            ctrl_dataIn_dec = 1'b0;    
        end
        
        else
        begin
            if(i < 4)
            begin
                ctrl_dataIn_dec = 1'b1;
                addr = 1'b1;
                dec_dataIn = dec_dataIn + 32'h01000000;

            end
            else if(i == 5)
            begin
                #1 ctrl_dataIn_dec = 1'b1;
                addr = 1'b0; 
                dec_dataIn = 32'h1;
            end
            else
            begin
                #1 ctrl_dataIn_dec = 1'b0;
            end

            if(i < 6)
                i = i+1;
        end    
    end
    */

endmodule