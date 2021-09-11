


module mod_fifo1(clk, resetn, 
                inp, rd_ROM, reg16_empty,
                outp, empty
                );

    input clk, resetn;
    input rd_ROM, reg16_empty;
    input [7:0] inp;

    reg reg_rdROM;
    reg [7:0] reg_inp;

    output reg [7:0] outp;
    output reg empty;

    always @(posedge clk)
    begin
        if(!resetn)
        begin
            //outp = 8'h00;
            reg_inp = 8'h00;
            empty = 1'b1;
        end

        else
        begin
            reg_rdROM = rd_ROM;

            if(empty && !reg16_empty)
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