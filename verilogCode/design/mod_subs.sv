


module mod_subs(clk, load,
                p,
                o
                );

        /* verilator lint_off UNUSED */
    input clk;
    input load;

    input [15;0]7:0] p;

    wire [15:0][7:0] io;

    output [15:0][7:0] o;

    // Send inputs through wires to swap them for the corresponding Rijndael S-box value


    // Receiving swaps and assigning them to the output wires

endmodule