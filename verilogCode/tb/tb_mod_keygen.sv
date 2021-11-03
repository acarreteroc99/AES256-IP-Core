`include "../design/keyGen/mod_keygen.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_keygen();

    localparam Nk = 8;
    localparam Nr = 14;
    localparam Nb = 4;
    localparam period = 20;

    reg clk, resetn;

    reg kg_validKey;
    reg [31:0] dataIn;
    
    reg [59:0][3:0][7:0] kg_dataOut;
    
    //wire [Nr+1:0][7:0] dataOut;

    integer i=0, j=0;
    integer index;

    mod_keygen DUT(
                    .clk(clk), .resetn(resetn),
                    .kg_dataIn(dataIn), .kg_validKey(kg_validKey),
                    .kg_dataOut(dataOut)
                    );


    always #10 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_mod_keygen.vcd");
        $dumpvars(0, tb_mod_keygen);
    end
    

    task enableResetn;
    begin
        @(posedge clk)
        #1 resetn = 1'b0;
        @(posedge clk)
        #1 resetn = 1'b1;
    end
    endtask

    task printResults;
    begin
    
        $display("------------- AES KEY GENERATION -------------");
        for(i=0; i<=Nr+1; i=i+1)
        begin
            //$display($time);
            $display("%h %h %h %h \n", kg_dataOut[i], kg_dataOut[i+1], kg_dataOut[i+2], kg_dataOut[i+3]);
        end 
        $display("-----------------------------------------------");
    end
    endtask
    

    initial 
    begin
        clk = 1'b0;
        enableResetn;
        #period kg_validKey = 1'b1;

        // ----- TESTING ENCRYPTION -----
        for(i=0; i<100000; i=i+1)
        begin
            @(posedge clk);
        end
        
        printResults;

        $finish;

    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            index = 0;
            // dataIn_AXI_valid = 1'b0;    
        end
        
        else
        begin
            if(index < 8)
            begin
                if(index == 0)
                    dataIn = 32'h00010203;

                else if(index == 1)
                    dataIn = 32'h04050607;
                
                else if (index == 2)
                    dataIn = 32'h08090a0b;
                
                else if (index == 3)
                    dataIn = 32'h0c0d0e0f;
                
                else if(index == 4)
                    dataIn = 32'h00010203;

                else if(index == 5)
                    dataIn = 32'h04050607;
                
                else if (index == 6)
                    dataIn = 32'h08090a0b;
                
                else if (index == 7)
                    dataIn = 32'h0c0d0e0f;

                index=index+1;
                
            end
            /*
            else if(i == 5)
            begin
                #1 dataIn_AXI_valid = 1'b1;
                addr = 1'b0; 
                inpAES = 32'h1;
            end
            else
            begin
                #1 dataIn_AXI_valid = 1'b0;
            end

            if(i < 8)
                i = i+1;
            */
        end    
    end

endmodule
