module mod_demuxInit(   
                        addr,
                        inp_demux,
                        outp_demux_flags, outp_demux_data
                    );

    
    localparam nFlags = 32;                                 // Used to be 8
    localparam plaintxtL = 32;                              // Used to be 128
    localparam N = 4;                                       // Used to be 16

    input addr;                                                     // Master indicates whether info goes to regCTRL or it has to be encrypted

    input [(plaintxtL-1):0] inp_demux;                              // Input

    output [(nFlags-1):0] outp_demux_flags;                             // Output to regCTRL
    output [(N-1):0][7:0] outp_demux_data;                              // Output to encrypter


    reg [(N-1):0][7:0] auxData;
    reg [(nFlags-1):0] auxFlags;
    integer i;

    always @(inp_demux)
    begin
        
        case(addr)
            0:
            begin             
                auxFlags = inp_demux[(nFlags-1):0];               
            end

            1:
            begin
                for(i=0; i < N; i=i+1)
                    auxData[i] = inp_demux[8*i +: 8];             
            end
        endcase

    end

assign outp_demux_flags = auxFlags;                                 // regCTRL is overwritten
assign outp_demux_data = auxData;                                   // Data to be encrypted is sent to addRK

endmodule