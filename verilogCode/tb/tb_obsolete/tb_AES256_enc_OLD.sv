


`include "../design/enc/AES256_enc_NEW.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_enc();

    localparam N = 16;
    //localparam N_ADDR = 2;
    localparam nflags = 8;
    localparam period = 20;

    reg clk, resetn;

    reg req_axi_in;
    reg [(N-1):0][7:0] plaintext;
    reg addr;
    //reg [(N_ADDR-1):0] addr;

    wire done;
    wire [(N-1):0][7:0] encData;

    integer index;
    integer i = 0;

    AES256_enc DUT(
                    .clk(clk), .resetn(resetn),
                    .plaintext(plaintext), .addr(addr), .req_axi_in(req_axi_in),
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

        
        if(encData == "b7642606d76a9248a480b57b7012e0f8")
            $display("CORRECT encryption!!! ");
        else
        begin
            $display("Something is not working buddy");
            $display("Should be: b7642606d76a9248a480b57b7012e0f8");
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
        //plaintext = 128'h00000001;
        plaintext = 32'h0001;

        // ----- TESTING ENCRYPTION -----
        @(posedge clk)
        addr = 1'b1;

        plaintext = 32'h0;
        //plaintext = 128'h0;                                                 // Encrypted: 7c6c258ccc6a400efacc631452a75a25dd3eedef984211b98384dc5677bc728e
        //plaintext = 128'h00000101030307070f0f1f1f3f3f7f7f;                // Encrypted: ddc98a4eb71f715e7bc5acf735523427dd3eedef984211b98384dc5677bc728e
        
        test_AES_encryption;

        $finish;

    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            i = 0;
            req_axi_in = 1'b0;    
        end
        
        else
        begin
            if(i < 4)
            begin
                #1 req_axi_in = 1'b1;
                addr = 1'b1;
                plaintext = plaintext + 32'h00000001;
                //plaintext = plaintext + 32'h00000000;
                /*
                if(i == 0)
                    plaintext = 32'h48656c6c;

                else if(i == 1)
                    plaintext = 32'h6f576f72;
                
                else if (i == 2)
                    plaintext = 32'h6c644865;
                
                else if (i == 3)
                    plaintext = 32'h6c6c6f21;
                */
            end
            else if(i == 5)
            begin
                #1 req_axi_in = 1'b1;
                addr = 1'b0; 
                plaintext = 32'h1;
            end
            else
            begin
                #1 req_axi_in = 1'b0;
            end

            if(i < 6)
                i = i+1;
        end    

    end

endmodule
