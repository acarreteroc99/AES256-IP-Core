`include "../design/keyGen/AES256_keygen_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_keygen();

    localparam Nk = 8;
    localparam Nr = 14;
    localparam Nb = 4;
    localparam period = 20;

    reg clk, resetn;

    reg ctrl_dataIn_kg;
    reg [127:0] dataIn;
    reg [127:0] dataOut;

    reg ctrl_dataOut_kg;

    reg [3:0] keycnt;
    reg [127:0] prevKey;

    integer i=0, j=0;
    integer index;

    AES256_keygen DUT(
                    .clk(clk), .resetn(resetn),
                    .kg_dataIn(dataIn), .ctrl_dataIn_kg(ctrl_dataIn_kg),
                    .kg_dataOut(dataOut), .ctrl_dataOut_kg(ctrl_dataOut_kg)
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

    //task printResults;
    //begin

        // $display("-------------------------------------------------");
        // $display("Key num %d is: %h \n", keycnt, dataOut);
        
        /*
        if(keycnt < 15)
            keycnt <= keycnt + 1;
        else
            keycnt <= 0;
        */
    
        /*
        $display("------------- AES KEY GENERATION -------------");
        for(i=0; i<=Nr+1; i=i+1)
        begin
            $display("%h", i);
            $display("%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h \n", 
                        dataOut[i], dataOut[i+1], dataOut[i+2], dataOut[i+3],
                        dataOut[i+4], dataOut[i+5], dataOut[i+6], dataOut[i+7],
                        dataOut[i+8], dataOut[i+9], dataOut[i+10], dataOut[i+11],
                        dataOut[i+12], dataOut[i+13], dataOut[i+14], dataOut[i+15]
                    );
        end 
        $display("-----------------------------------------------");
        */
    //end
    //endtask

    task test_AES_keygen;
    begin
    
        $display("Seed pt 1: ", dataIn);

        @(posedge clk);
        $display("Seed pt 2: ", dataIn);
        
        while(!ctrl_dataOut_kg)
            @(posedge clk);

        $display("--------------------------  AES256 KEY  ----------------------------- \n");        
        
    end
    endtask
    
    always @(posedge clk or negedge resetn)
    begin
        if(ctrl_dataOut_kg)
        begin
            $display("%d %h", $time, dataOut);
        end
    end

    initial 
    begin
        clk = 1'b0;
        enableResetn;
        //#period ctrl_dataIn_kg = 1'b1;

        test_AES_keygen();

    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            index <= 0;
            ctrl_dataIn_kg <= 0;
            keycnt <= 0;
        end
        
        else
        begin
            if(index < 16)
            begin
                if(index == 0)
                begin
                    ctrl_dataIn_kg = 1'b1;
                    #1 dataIn <= 128'h0f0e0d0c0b0a09080706050403020100;
                end

                else if(index == 1)
                begin
                    ctrl_dataIn_kg = 1'b1;
                    #1 dataIn <= 128'h0f0e0d0c0b0a09080706050403020100;
                    prevKey <= 128'h0f0e0d0c0b0a09080706050403020100;
                end
                
                else
                begin
                    #period ctrl_dataIn_kg = 1'b1;
                    //#1 dataIn <= prevKey;
                    //prevKey <= dataOut;
                end

                index=index+1;

                /*
                else if(index == 1)
                    #1 dataIn = 32'h07060504;
                
                else if (index == 2)
                    #1 dataIn = 32'h0b0a0908;
                
                else if (index == 3)
                    #1 dataIn = 32'h0f0e0d0c;
                
                else if(index == 4)
                    #1 dataIn = 32'h03020100;

                else if(index == 5)
                    #1 dataIn = 32'h07060504;
                
                else if (index == 6)
                    #1 dataIn = 32'h0b0a0908;
                
                else if (index == 7)
                    #1 dataIn = 32'h0f0e0d0c;
                */
                
            end
        end    
    end

endmodule
