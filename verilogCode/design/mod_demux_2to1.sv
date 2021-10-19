


module mod_demux_2to1(  clk, addr,
                        inp,
                        outp_0, outp_1
                     );


    localparam N = 16;
    localparam nRounds = 14;

    input clk;
    input [3:0]             addr;
    input [(N-1):0][7:0]    inp;

    output reg [(N-1):0][7:0]   outp_0;
    output reg [(N-1):0][7:0]   outp_1;


    always @(addr, inp)
    begin
        if(addr < nRounds)
            outp_0 = inp;
        else
            outp_1 = inp;    
    end

endmodule