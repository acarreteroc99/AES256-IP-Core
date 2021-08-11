
`include "../../design/mod_enc_addRoundKey.sv"

module tb_mod_enc_addRoundKey();

    /*
    reg clk;
    reg [15:0][7:0] in;
    reg [15:0][7:0] k;

    wire [15:0][7:0] o;
    */

    //src: https://www.chipverify.com/verilog/verilog-arrays

    reg [7:0] in    [15:0];
    reg [7:0] k     [15:0];

    wire [7:0] o  [15:0];

    integer i;

    mod_enc_addRoundKey DUT(.clk(clk), 
                            .p(in), .k(k),
                            .out(o)
                            );
    
    initial begin

        $dumpfile("wv_mod_enc_addRoundKey.vcd");
            $dumpvars(0, tb_mod_enc_addRoundKey);

        in[0] = 8'h00; //8'hD4;
        in[1] = 8'h01; //8'hE0;
        in[2] = 8'h02; //8'hB8;
        in[3] = 8'h03; //8'h1E;
    
        in[4] = 8'h10; //8'h27;
        in[5] = 8'h11; //8'hBF;
        in[6] = 8'h12; //8'hB4;
        in[7] = 8'h13; //8'h41;

        in[8] = 8'h20; //8'h11;
        in[9] = 8'h21; //8'h98;
        in[10] = 8'h22; //8'h5D;
        in[11] = 8'h23; //8'h52;

        in[12] = 8'h30; //8'hAE;
        in[13] = 8'h31; //8'hF1;
        in[14] = 8'h32; //8'hE5;
        in[15] = 8'h33; //8'h30;

        k[0] = 8'h00; //8'hD4;
        k[1] = 8'h00; //8'hE0;
        k[2] = 8'h00; //8'hB8;
        k[3] = 8'h00; //8'h1E;
    
        k[4] = 8'h01; //8'h27;
        k[5] = 8'h01; //8'hBF;
        k[6] = 8'h01; //8'hB4;
        k[7] = 8'h01; //8'h41;

        k[8] = 8'h02; //8'h11;
        k[9] = 8'h02; //8'h98;
        k[10] = 8'h02; //8'h5D;
        k[11] = 8'h02; //8'h52;

        k[12] = 8'h03; //8'hAE;
        k[13] = 8'h03; //8'hF1;
        k[14] = 8'h03; //8'hE5;
        k[15] = 8'h03; //8'h30;

        for(i=0; i < 16; i=i+1)
        begin
            if(o[i] == (in[i]^k[i]))
                $display("Correct value for o[%i]: %h \n", i, o[i]);
            else
                $display("Something not working properly. Value: %h ; Pos: %i \n", o[i], i);
        end
    end

endmodule