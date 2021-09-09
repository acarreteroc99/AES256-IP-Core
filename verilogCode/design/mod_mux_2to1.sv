


module mod_mux_2to1(addr,
                    inp0, inp1, 
                    outp
                    );

    localparam nAddr = 4;
    localparam plaintxtL = 128;
    localparam N = 16;

    //input [(nAddr-1):0]     addr;
    input                   addr;
    input [(N-1):0][7:0]    inp0;
    input [(N-1):0][7:0]    inp1;

    output [(N-1):0][7:0]   outp;

    /*
    reg [(nAddr-1):0] auxAddr;

    initial 
    begin
        auxAddr = 2'b0;
    end
    */

    assign outp = addr ? inp0:inp1;

endmodule