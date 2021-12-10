


// `include "../design/dec/AES256_dec_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_dec();

    localparam N = 16;
    localparam nflags = 8;
    localparam period = 20;

    reg clk, resetn;

    reg ctrl_dataIn_dec;
    reg [127:0] dec_dataIn;

    reg [127:0] dec_key;

    wire ctrl_dataOut_dec;
    wire [127:0] dec_dataOut;

    integer index;
    integer i = 0;

    AES256_dec DUT(
                    .clk(clk), .resetn(resetn),
                    .dec_dataIn(dec_dataIn), .dec_key(dec_key), .ctrl_dataIn_dec(ctrl_dataIn_dec), 
                    .dec_dataOut(dec_dataOut), .ctrl_dataOut_dec(ctrl_dataOut_dec) 
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

    task test_AES_encryption;
    begin
    
        $display("Plaintext: ", dec_dataIn);
        $display("Encrypted data: ", dec_dataOut);
        
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
        
        test_AES_encryption;

        $finish;

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