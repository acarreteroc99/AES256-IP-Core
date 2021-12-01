

module mod_enc_mixColumns(  clk, resetn,                            //enable, reg161_status, reg162_reseted,
                            inp_mC, wr_en,
                            outp_mC                               //, done, mC_reseted
                         );

    localparam N = 16;
    localparam Nrows = 4;

    input  clk, resetn;
    input wire [(N-1):0][7:0] inp_mC;
    input wr_en;

    reg [3:0][7:0] row;
    reg [(N-1):0][7:0] temp;
    reg [(N-1):0][7:0] auxIn;

    output reg  [(N-1):0][7:0] outp_mC;

    integer index, rowNum;

    function [(N-1):0][7:0] mix_columns (input [(N-1):0][7:0] inp_mC);
        rowNum = 0;
        for(index = 0; index < 4; index=index+1)
        begin
            //row[0] = inp_mC[index*4]; row[1] = inp_mC[(index*4)+1]; row[2] = inp_mC[(index*4)+2]; row[3] = inp_mC[(index*4)+3]; 
            row[0] = inp_mC[index]; row[1] = inp_mC[index+(Nrows*1)]; row[2] = inp_mC[index+(Nrows*2)]; row[3] = inp_mC[index+(Nrows*3)]; 
            temp[index*4] = xtime(row[0]) ^ (xtime(row[1]) ^ row[1]) ^ row[2] ^ row[3];
            temp[(index*4)+1] = row[0] ^ xtime(row[1]) ^ (xtime(row[2]) ^ row[2]) ^ row[3];
            temp[(index*4)+2] = row[0] ^ row[1] ^ xtime(row[2]) ^ (xtime(row[3]) ^ row[3]);
            temp[(index*4)+3] = (xtime(row[0]) ^ row[0]) ^ row[1] ^ row[2] ^ xtime(row[3]);
            rowNum = rowNum + 1;
        end

        return temp;

    endfunction

    function bit [7:0] xtime([7:0] num);
        if(num/128 == 0)
            return (num << 1);
            //xtime = (num << 1);
        else
            return ((num << 1) ^ 8'h1b);
            //xtime = ((num << 1) ^ 1'b1);
    endfunction

    always @(posedge clk or negedge resetn)
    begin
        if (!resetn)
        begin
            for(index = 0; index < N; index = index+1)
                auxIn[index] = 0;
        end 
        else
        begin
            if(wr_en)
            begin
                auxIn = mix_columns(inp_mC); 

                $display("OUTPUT mixColumns: %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h,", 
                                            auxIn[0], auxIn[1], auxIn[2], auxIn[3],
                                            auxIn[4], auxIn[5], auxIn[6], auxIn[7], 
                                            auxIn[8], auxIn[9], auxIn[10], auxIn[11], 
                                            auxIn[12], auxIn[13], auxIn[14], auxIn[15]
                        );
            end 
        end
    end

    assign outp_mC = auxIn;

endmodule