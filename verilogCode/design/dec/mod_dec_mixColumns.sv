

module mod_dec_mixColumns(  clk, resetn,                            //enable, reg161_status, reg162_reseted,
                            inp_mC, wr_en,
                            outp_mC                               //, done, mC_reseted
                         );

    localparam N = 16;
    localparam Nrows = 4;

    input  clk, resetn;
    input wire [(N-1):0][7:0] inp_mC;
    input wr_en;

    reg [3:0][7:0] row;
    reg [3:0][3:0][7:0] lookup;
    reg [(N-1):0][7:0] temp;
    reg [(N-1):0][7:0] auxIn;

    output reg  [(N-1):0][7:0] outp_mC;

    integer index, rowNum, i, j;

    function [(N-1):0][7:0] invMixColumns (input [(N-1):0][7:0] inp_mC);

        for (i = 0; i < 4; i++)
        begin
            for (j = 0; j < 4; j++)
            begin
                lookup[j][0] <= inp_mC[i*4+j];
                lookup[j][1] <= xtime(lookup[j][0]);
                lookup[j][2] <= xtime(lookup[j][1]);
                lookup[j][3] <= xtime(lookup[j][2]);
            end

            temp[i][0] <= (lookup[0][3] ^ lookup[0][2] ^ lookup[0][1]) ^ (lookup[1][3] ^ lookup[1][1] ^ lookup[1][0]) ^ (lookup[2][3] ^ lookup[2][2] ^ lookup[2][0]) ^ (lookup[3][3] ^ lookup[3][0]);
            temp[i][1] <= (lookup[0][3] ^ lookup[0][0]) ^ (lookup[1][3] ^ lookup[1][2] ^ lookup[1][1]) ^ (lookup[2][3] ^ lookup[2][1] ^ lookup[2][0]) ^ (lookup[3][3] ^ lookup[3][2] ^ lookup[3][0]);
            temp[i][2] <= (lookup[0][3] ^ lookup[0][2] ^ lookup[0][0]) ^ (lookup[1][3] ^ lookup[1][0]) ^ (lookup[2][3] ^ lookup[2][2] ^ lookup[2][1]) ^ (lookup[3][3] ^ lookup[3][1] ^ lookup[3][0]);
            temp[i][3] <= (lookup[0][3] ^ lookup[0][1] ^ lookup[0][0]) ^ (lookup[1][3] ^ lookup[1][2] ^ lookup[1][0]) ^ (lookup[2][3] ^ lookup[2][0]) ^ (lookup[3][3] ^ lookup[3][2] ^ lookup[3][1]);
        end

        return temp;

    endfunction

    function bit [7:0] xtime([7:0] num);
        if(num/128 == 0)
            return (num << 1);
        else
            return ((num << 1) ^ 8'h1b);
    endfunction

    always @(posedge clk or negedge resetn)
    begin
        if (!resetn)
        begin
            for(index = 0; index < N; index = index+1)
                auxIn[index] <= 0;
        end 
        else
        begin
            if(wr_en)
            begin
                auxIn <= invMixColumns(inp_mC); 

                /*
                $display("OUTPUT mixColumns: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,", 
                                            auxIn[0], auxIn[1], auxIn[2], auxIn[3],
                                            auxIn[4], auxIn[5], auxIn[6], auxIn[7], 
                                            auxIn[8], auxIn[9], auxIn[10], auxIn[11], 
                                            auxIn[12], auxIn[13], auxIn[14], auxIn[15]
                        );
                */
            end 
        end
    end

    assign outp_mC = auxIn;

endmodule