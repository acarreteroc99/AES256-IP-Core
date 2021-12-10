

module mod_enc_mixColumns(  clk, resetn,                            
                            inp_mC, wr_en,
                            outp_mC                               
                         );

    localparam N = 16;
    localparam Nrows = 4;

    input  clk, resetn;
    input wire [(N-1):0][7:0] inp_mC;                                   // Data to be multiplied
    input wr_en;                                                        // Orders the module to capture the incoming data

    reg [3:0][7:0] row;
    reg [(N-1):0][7:0] temp;
    reg [(N-1):0][7:0] auxIn;

    output reg  [(N-1):0][7:0] outp_mC;                                 // Output

    integer index, rowNum;

    function [(N-1):0][7:0] mix_columns (input [(N-1):0][7:0] inp_mC);  // Mix Column operation specified in FIPS 197 NSA manual
        rowNum = 0;

        for(index=0; index < 4; index=index+1)
        begin
            row[0] = inp_mC[index*Nrows]; row[1] = inp_mC[index*Nrows + 1]; row[2] = inp_mC[index*Nrows + 2]; row[3] = inp_mC[index*Nrows + 3]; 
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

        else
            return ((num << 1) ^ 8'h1b);

    endfunction

    always @(posedge clk or negedge resetn)
    begin
        if (!resetn)
        begin
            auxIn <= 0;
        end 
        else
        begin
            if(wr_en)                                                    // We capture the input and send it to mixColumn operation
            begin
                auxIn <= mix_columns(inp_mC); 
            end 
        end
    end

    assign outp_mC = auxIn;                                             //Data is being outputed continuosly. 
                                                                        // Next module chooses when to capture it.

endmodule