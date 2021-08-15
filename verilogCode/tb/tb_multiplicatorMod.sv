
`include "../design/enc/mod_enc_multiplicator.sv"

module tb_mod_enc_multiplicator();

    localparam N = 16;
    localparam period = 20;

    reg clk;

    reg [(N-1):0][7:0] matA;       
    reg [(N-1):0][7:0] matB;

    reg [3:0][(N-1):0] outAux;
    reg [3:0]       carryAux;

    reg [3:0][(N-1):0] sumAux;

    wire [3:0][(N-1):0] out;
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
    always #100 clk = !clk;

    task init_param; 
    begin
        for(i=0; i<N/4; i=i+1)
            for(j=0; j<N/4; j=j+1)
            begin
                matA[(i*N/4) + j] <= (i*N/4) + j;
                matB[(i*N/4) + j] <= i;
            end
    end
    endtask

    task resulting_mat;
    begin
        for (i = 0; i < N/4; i=i+1)
        sumAux[i] = 0;
        begin
            $display("matA = %h ; matB = %h", matA[(i*N/4)+j], matB[(i*N/4)+j]);
            for (j = 0; j < N/4; j=j+1)
            begin
                outAux[(i*N/4)+j] = matA[(i*N/4)+j] * matB[(i*N/4)+j];
                $display("OutAux = %h", outAux[(i*N/4)+j]);
                sumAux[i] = sumAux[i] + outAux[(i*N/4)+j];
            end
        end
    end
    endtask

    task test_multiplicator;
    begin
        $display("\n ====== CHEKING RESULTS ====== \n");

        for(i=0; i < N/4; i=i+1)
        begin
            if(out[i] == sumAux[i])
                $display("Correct value for o[%d]: %h \n", i, out[i]);
            else
                $display("Something not working properly. Value: %h ; Pos: %d ; Correct val: %h \n", out[i], i, sumAux[i]);
        end
    
    end
    endtask

    initial 
    begin

        clk = 1'b0;
        init_param;
        #1000;
        resulting_mat;
        #1000;
        test_multiplicator;   
        $finish;
    end

endmodule