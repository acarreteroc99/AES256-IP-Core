`include "../design/AES256_device_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_device();

    localparam Nk = 8;
    localparam Nr = 14;
    localparam Nb = 4;
    localparam period = 20;

    reg clk, resetn;

    reg ctrl_dataIn;
    reg ctrl_dataOut;

    reg [1:0] mod_en;

    reg [127:0] inp_device;
    reg [127:0] out_device;

    reg [127:0] enc_dataOut;
    reg [127:0] dec_dataOut;

    integer i=0, j=0;
    integer index;

    AES256_device DUT(
                        .clk(clk), .resetn(resetn), 
                        .inp_device(inp_device), .ctrl_dataIn(ctrl_dataIn), .mod_en(mod_en), 
                        .outp_device(out_device), .ctrl_dataOut(ctrl_dataOut)
                    );


    always #10 clk = !clk;

    
    initial 
    begin
        $dumpfile("wv_AES256_device.vcd");
        $dumpvars(0, tb_AES256_device);
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

        while(!ctrl_dataOut)
            @(posedge clk);

        $display("-------------------  AES256  -------------------------");
        $display("Result: %h", out_device);
    
        /*
        $display("------------- AES KEY GENERATION -------------");
        for(i=0; i<=Nr+1; i=i+1)
        begin
            $display("%h", i);
            $display("%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h \n", 
                        out_device[i], out_device[i+1], out_device[i+2], out_device[i+3],
                        out_device[i+4], out_device[i+5], out_device[i+6], out_device[i+7],
                        out_device[i+8], out_device[i+9], out_device[i+10], out_device[i+11],
                        out_device[i+12], out_device[i+13], out_device[i+14], out_device[i+15]
                    );
        end 
        $display("-----------------------------------------------");
        */
    end
    endtask
    

    initial 
    begin
        clk = 1'b0;
        enableResetn;

    end

    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            index <= 0;
            ctrl_dataIn <= 0;
        end
        
        else
        begin
            if(index < 10)
            begin
                // ------- ENCRYPTION  -------
                if(index == 0)
                begin
                    // TRASH CYCLES
                    ctrl_dataIn <= 1'b0;
                end

                else if(index == 1)
                begin
                    // TRASH CYCLES
                    ctrl_dataIn <= 1'b0;
                end
                
                else if(index == 2)
                begin
                    // TRASH CYCLES
                    ctrl_dataIn <= 1'b0;
                end

                if(index == 3)
                begin
                    ctrl_dataIn <= 1'b1;
                    mod_en <= 2'b10;
                    inp_device <= 128'h0f0e0d0c0b0a09080706050403020100;
                    //inp_device <= 128'hffeeddccbbaa99887766554433221100;
                end

                else if(index == 4)
                begin
                    ctrl_dataIn <= 1'b1;
                    mod_en <= 2'b10;
                    inp_device <= 128'h0f0e0d0c0b0a09080706050403020100;
                    //inp_device <= 128'hffeeddccbbaa99887766554433221100;
                end
                
                // ------- ENCRYPTION  -------

                
                else if(index == 5)
                begin
                    ctrl_dataIn <= 1'b1;
                    mod_en <= 2'b00;
                    inp_device <= 128'h04000000030000000200000001000000;
                    //inp_device <= 128'h44444444333333332222222211111111;
                end
                
                else if(index == 6)
                begin
                    ctrl_dataIn <= 1'b0;
                end
                
                
                // ------- DECRYPTION  -------
                
                /*
                else if(index == 5)
                begin
                    ctrl_dataIn <= 1'b1;
                    mod_en <= 2'b01;
                    //inp_device <= 128'h5036083ef90998093de80fbcb233436b;
                    inp_device <= 128'h7a584d99febc93ead6b3563cc4ad3a63;
                end

                else if(index == 6)
                begin
                    ctrl_dataIn <= 1'b0;
                end
                */
                

                /*
                else if(index == 7)
                begin
                    ctrl_dataIn <= 1'b1;
                    mod_en <= 2'b01;
                    inp_device <= 128'h7a584d99febc93ead6b3563cc4ad3a63;
                end

                else if(index == 8)
                begin
                    ctrl_dataIn <= 1'b0;
                end
                */
                
                index=index+1;

            end
        end
    end
      

endmodule
