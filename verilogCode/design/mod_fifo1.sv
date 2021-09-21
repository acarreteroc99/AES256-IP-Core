


module mod_fifo1(clk, resetn, 
                inp, rd_ROM, reg16_empty,
                outp, empty
                );

    input clk, resetn;
    input rd_ROM, reg16_empty;
    input [7:0] inp;

    reg reg_rdROM, reg16_emptyReg;
    reg [7:0] reg_inp;

    output reg [7:0] outp;
    output reg empty;

    always @(posedge clk)
    begin
        if(!resetn)
        begin
            empty = 1'b1;                               // Own register
            reg_rdROM = 1'b1;
        end

        else
        begin
            //$display("HELOOOOOOOOOO");
            reg_rdROM = rd_ROM;
            reg16_emptyReg = reg16_empty;

            if(empty && !reg16_emptyReg)
            begin
                reg_inp = inp;
                empty = 1'b0;
            end

            else 
            begin
                if(!empty && reg_rdROM)
                begin
                    outp = reg_inp;
                    empty = 1'b1;
                end
            end
        end
    end


endmodule