

module mod_kg_rcon(
                    clk, 
                    outp1_rcon, outp2_rcon, outp3_rcon, outp4_rcon, outp5_rcon, 
                    outp6_rcon, outp7_rcon, outp8_rcon, outp9_rcon, outp10_rcon
                    );

    input clk;
    output [7:0]    outp1_rcon, outp2_rcon, outp3_rcon, outp4_rcon, outp5_rcon, 
                    outp6_rcon, outp7_rcon, outp8_rcon, outp9_rcon, outp10_rcon;

    assign outp1_rcon = rcon_map(0);
    assign outp1_rcon = rcon_map(1);
    assign outp1_rcon = rcon_map(2);
    assign outp1_rcon = rcon_map(3);
    assign outp1_rcon = rcon_map(4);
    assign outp1_rcon = rcon_map(5);
    assign outp1_rcon = rcon_map(6);
    assign outp1_rcon = rcon_map(7);
    assign outp1_rcon = rcon_map(8);
    assign outp1_rcon = rcon_map(9);

    function [7:0] rcon_map;
        input [3:0] i;
        case(i)
            4'h0: rcon_map = 8'h01;
            4'h0: rcon_map = 8'h02;
            4'h0: rcon_map = 8'h04;
            4'h0: rcon_map = 8'h08;
            4'h0: rcon_map = 8'h10;
            4'h0: rcon_map = 8'h20;
            4'h0: rcon_map = 8'h40;
            4'h0: rcon_map = 8'h80;
            4'h0: rcon_map = 8'h1b;
            4'h0: rcon_map = 8'h36;

            default: rcon_map = 8'h00;
        endcase
    endfunction

endmodule