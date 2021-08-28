



module mod_demuxInit(addr,
                    inp,
                    outp0, outp1
                    );

    localparam nAddr = 2;
    localparam nFlags = 8;
    localparam plaintxtL = 128;
    localparam N = 16;

    input [(nAddr-1):0]     addr;

    input [(plaintxtL-1):0] inp;

    output [(nFlags-1):0] outp0;
    output [(N-1):0][7:0] outp1;


    reg [(N-1):0][7:0] auxData;
    reg [(nFlags-1):0] auxFlags;
    integer i;

    always @(inp)
    begin
        
        case(addr)
            0:
            begin             
                auxFlags = inp[(nFlags-1):0];
            end

            1:
            begin
                for(i=0; i < N; i=i+1)
                    auxData[i] = inp[8*i +: 8];
            end
        endcase

    end

    assign outp0 = auxFlags;
    assign outp1 = auxData;

endmodule