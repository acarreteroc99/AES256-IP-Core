
`include "../../design/mod_enc_multiplicator.sv"

module tb_mod_enc_multiplicator();

    reg clk;

    reg [15:0][7:0] matA;       
    reg [15:0][7:0] matB;

    reg [15:0][7:0] outAux;
    reg [3:0]       carryAux;

    wire [3:0][15:0] out;
    wire [3:0]       carry;

    integer i, j, k;

    mod_enc_multiplicator DUT(
                                .clk    (clk),
                                .matA   (matA), 
                                .matB   (matB), 
                                .out    (out), 
                                .carry  (carry)
                            );

    // Clock generation
    always
        #100 clk = !clk;

    // Clock initialization
    initial
        begin
            clk = 1'b1;

            matA[0] = 8'd00; //8'hD4;
            matA[1] = 8'd01; //8'hE0;
            matA[2] = 8'd02; //8'hB8;
            matA[3] = 8'd03; //8'h1E;
        
            matA[4] = 8'd10; //8'h27;
            matA[5] = 8'd11; //8'hBF;
            matA[6] = 8'd12; //8'hB4;
            matA[7] = 8'd13; //8'h41;

            matA[8] = 8'd20; //8'h11;
            matA[9] = 8'd21; //8'h98;
            matA[10] = 8'd22; //8'h5D;
            matA[11] = 8'd23; //8'h52;

            matA[12] = 8'd30; //8'hAE;
            matA[13] = 8'd31; //8'hF1;
            matA[14] = 8'd32; //8'hE5;
            matA[15] = 8'd33; //8'h30;

            matB[0] = 8'd00; //8'hD4;
            matB[1] = 8'd00; //8'hE0;
            matB[2] = 8'd00; //8'hB8;
            matB[3] = 8'd00; //8'h1E;
        
            matB[4] = 8'd01; //8'h27;
            matB[5] = 8'd01; //8'hBF;
            matB[6] = 8'd01; //8'hB4;
            matB[7] = 8'd01; //8'h41;

            matB[8] = 8'd02; //8'h11;
            matB[9] = 8'd02; //8'h98;
            matB[10] = 8'd02; //8'h5D;
            matB[11] = 8'd02; //8'h52;

            matB[12] = 8'd03; //8'hAE;
            matB[13] = 8'd03; //8'hF1;
            matB[14] = 8'd03; //8'hE5;
            matB[15] = 8'd03; //8'h30;

            outAux[0] = 8'd00; //8'hD4;
            outAux[1] = 8'd00; //8'hE0;
            outAux[2] = 8'd00; //8'hB8;
            outAux[3] = 8'd00; //8'h1E;
        
            outAux[4] = 8'd14; //8'h27;
            outAux[5] = 8'd14; //8'hBF;
            outAux[6] = 8'd14; //8'hB4;
            outAux[7] = 8'd14; //8'h41;

            outAux[8] = 8'd74; //8'h11;
            outAux[9] = 8'd74; //8'h98;
            outAux[10] = 8'd74; //8'h5D;
            outAux[11] = 8'd74; //8'h52;

            outAux[12] = 8'd134; //8'hAE;
            outAux[13] = 8'd134; //8'hF1;
            outAux[14] = 8'd134; //8'hE5;
            outAux[15] = 8'd134; //8'h30;


            /*
            for (i = 0; i < 4; i=i+1)
                for (j = 0; j < 4; j=j+1)
                    outAux[i][j] = 0;
                    for (k = 0; k < 4; k=k+1)
                        outAux[i][j] = outAux[i][j] + (matA[i][k] * matB[k][j]);
            */

            for(i=0; i < 16; i=i+1)
            begin
                if(out[i] == outAux[i])
                    $display("Correct value for o[%i]: %h \n", i, out[i]);
                else
                    $display("Something not working properly. Value: %h ; Pos: %i \n", out[i], i);
            end

        end

endmodule