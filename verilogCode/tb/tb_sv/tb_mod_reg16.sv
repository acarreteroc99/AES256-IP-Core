


`include "../../design/mod_reg16.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_mod_reg16();

    localparam N = 16;
    localparam period = 20;

    reg clk, resetn, read, write;
    reg [N-1:0][7:0] aux;
    reg [N-1:0][7:0] i;
    
    wire [N-1:0][7:0] o;

    integer index;

    mod_reg16 DUT(.clk(clk), .resetn(resetn), .read(read), .write(write),
                    .i(i),
                    .o(o)
                    );

    always
    begin
        clk = 1'b1;
        #20;

        clk = 1'b0;
        #20;
    end

    initial 
    begin
        i[0] = 8'h00;
        for(index=1; index < N; index=index+1)
            i[index] = i[index-1] + 8'h01;
    end

    always
    begin
        resetn = 0;
        #period;
        for(index=0; index < N; index=index+1)
        begin
            #period;
            if(aux[index] == 8'h00)
                $display("Correct value in position %i \n", aux[index]);
            else
                $display("Something not working properly. Value: %h ; Pos: %i \n", aux[index], index);
        end 
        $stop;
    end

    always
    begin
        write = 1;
        #period;
        for(index=0; index < N; index=index+1)
        begin
            #period;
            if(aux[index] == i[index])
                $display("Correct value: %h \n", aux[index]);
            else
                $display("Expected value: %h ;; Value written: %h ;; Pos: %h \n", i[index], aux[index], index);
        end 
        write = 0;
        $stop;
    end

    always
    begin
        read = 1;
        #period;
        for(index=0; index < N; index=index+1)
        begin
            #period;
            if(aux[index] == o[index])
                $display("Correct value: %h \n", aux[index]);
            else
                $display("Expected value: %h ;; Value read: %h ;; Pos: %h \n", o[index], aux[index], index);
        end
        read = 0;
        $stop;
    end

endmodule