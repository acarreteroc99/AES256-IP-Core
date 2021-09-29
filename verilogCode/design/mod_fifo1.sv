


module mod_fifo1(clk, resetn, 
                inp, rd_ROM, reg16_empty,
                outp, empty
                );

    input clk, resetn;
    input rd_ROM, reg16_empty;
    input [7:0] inp;

    reg reg_rdROM, reg16_emptyReg;
    reg [7:0] reg_inp;
    reg delay_fifoEmpty;

    output reg [7:0] outp;
    output reg empty;

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            //delay_fifoEmpty = 1'b1;
            empty = 1'b1;                               // Own register
            reg_rdROM = 1'b1;
        end

        else
        begin
            reg_rdROM = rd_ROM;
            reg16_emptyReg = reg16_empty;
            //empty = delay_fifoEmpty;

            if(empty && !reg16_emptyReg)               // Old: reg16_emptyReg
            //if(delay_fifoEmpty && !reg16_emptyReg)
            begin
                reg_inp = inp;
                //delay_fifoEmpty = 1'b0;
                empty = 1'b0;
            end

            else 
            begin
                if(!empty && reg_rdROM)
                //if(!delay_fifoEmpty && reg_rdROM)
                begin
                    outp = reg_inp;
                    //delay_fifoEmpty = 1'b1;
                    empty = 1'b1;
                end
            end
        end
    end


endmodule