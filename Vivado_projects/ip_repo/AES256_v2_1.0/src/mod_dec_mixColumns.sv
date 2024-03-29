

module mod_dec_mixColumns(  clk, resetn,                            
                            inp_mC, wr_en,
                            outp_mC                               
                         );

    localparam N = 16;
    localparam Nrows = 4;

    input  clk, resetn;
    input wire [(N-1):0][7:0] inp_mC;
    input wr_en;

    reg [(N-1):0][7:0] lookup;
    reg [(N-1):0][7:0] temp;
    reg [(N-1):0][7:0] auxIn;

    output reg  [(N-1):0][7:0] outp_mC;

    integer index;
    integer i=4;
    integer j=4;

    function [(N-1):0][7:0] invMixColumns (input [(N-1):0][7:0] inp_mC);            // InvMixColumns specified in FIPS 197

        for (i = 0; i < 4; i++)
        begin
            for (j = 0; j < 4; j++)
            begin
                lookup[j*Nrows + 0] = inp_mC[i*4+j];
                lookup[j*Nrows + 1] = xtime(lookup[j*Nrows + 0]);
                lookup[j*Nrows + 2] = xtime(lookup[j*Nrows + 1]);
                lookup[j*Nrows + 3] = xtime(lookup[j*Nrows + 2]);
            end
            
            temp[i*Nrows + 0] = (lookup[0*4+3] ^ lookup[0*4+2] ^ lookup[0*4+1]) ^ (lookup[1*4+3] ^ lookup[1*4+1] ^ lookup[1*4+0]) ^ (lookup[2*4+3] ^ lookup[2*4+2] ^ lookup[2*4+0]) ^ (lookup[3*4+3] ^ lookup[3*4+0]);
            temp[i*Nrows + 1] = (lookup[0*4+3] ^ lookup[0*4+0]) ^ (lookup[1*4+3] ^ lookup[1*4+2] ^ lookup[1*4+1]) ^ (lookup[2*4+3] ^ lookup[2*4+1] ^ lookup[2*4+0]) ^ (lookup[3*4+3] ^ lookup[3*4+2] ^ lookup[3*4+0]);
            temp[i*Nrows + 2] = (lookup[0*4+3] ^ lookup[0*4+2] ^ lookup[0*4+0]) ^ (lookup[1*4+3] ^ lookup[1*4+0]) ^ (lookup[2*4+3] ^ lookup[2*4+2] ^ lookup[2*4+1]) ^ (lookup[3*4+3] ^ lookup[3*4+1] ^ lookup[3*4+0]);
            temp[i*Nrows + 3] = (lookup[0*4+3] ^ lookup[0*4+1] ^ lookup[0*4+0]) ^ (lookup[1*4+3] ^ lookup[1*4+2] ^ lookup[1*4+0]) ^ (lookup[2*4+3] ^ lookup[2*4+0]) ^ (lookup[3*4+3] ^ lookup[3*4+2] ^ lookup[3*4+1]);
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
            if(wr_en)                                                               // Data is captured when the previous module ends
            begin
                auxIn <= invMixColumns(inp_mC); 
            end 
        end
    end

    assign outp_mC = auxIn;

endmodule