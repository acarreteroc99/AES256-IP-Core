

`include "../design/mod_romKey.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_romKey();

    localparam period = 20;

    reg clk, resetn;

    reg [127:0] inp_romKey;
    reg [3:0] addr_romKey;

    wire [127:0] outp_romKey;

    integer index, i;

    mod_romKey DUT (
                    .clk(clk), .resetn(resetn),
                    .inp_romKey(inp_romKey), .addr_romKey(addr_romKey),
                    .outp_romKey(outp_romKey)
                    );

    always #10 clk = !clk;

    initial 
    begin

        $dumpfile("wv_mod_romKey.vcd");
        $dumpvars(0, tb_mod_romKey);

    end

    task printResults;
    begin

        while(index < 15)
            @(posedge clk);

        i <= 0;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        while(i<15)
        begin
            addr_romKey <= i;

            @(posedge clk);
            //$display("Key %d is %h", i, outp_romKey);

            @(posedge clk);
            i <= i + 1;
        end

    end
    endtask

    initial 
    begin
        clk = 1'b0;
        #period resetn = 1'b0;
        #period resetn = 1'b1;

        while(index < 15)
            @(posedge clk);

        printResults;
        
        $finish;
    end

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            index <= 0;
        end
        
        else
        begin
            if(index < 15)
            begin
                // ------- ENCRYPTION  -------
                case(index)
                0:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000000;
                    end
                1:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000001;
                    end
                2:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000002;
                    end
                3:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000003;
                    end
                4:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000004;
                    end
                5:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000005;
                    end
                6:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000006;
                    end
                7:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000007;
                    end
                8:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000008;
                    end
                9:
                    begin
                        inp_romKey <= 128'h0000000000000000000000000000000009;
                    end
                10:
                    begin
                        inp_romKey <= 128'h000000000000000000000000000000000a;
                    end
                11:
                    begin
                        inp_romKey <= 128'h000000000000000000000000000000000b;
                    end

                12:
                    begin
                        inp_romKey <= 128'h000000000000000000000000000000000c;
                    end
                13:
                    begin
                        inp_romKey <= 128'h000000000000000000000000000000000d;
                    end
                14:
                    begin
                        inp_romKey <= 128'h000000000000000000000000000000000e;
                    end
                endcase

                index<=index+1;

            end
        end
    end

endmodule