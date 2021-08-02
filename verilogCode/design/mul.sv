
/****** mul.sv *******/

module mul(clk, reset, load, num1, num2, out, a, acc, b);
    input   clk;                                // clock signal
    input   reset;                              // reset signal
    input   load;                               // load signal
    input   [7:0] num1; 
    input   [7:0] num2;                   // signal receiving values to be multiplied
    
    output  [15:0] out;                        // signal sending the result

    reg     [15:0] a; 
    reg     [15:0] acc;
    reg     [7:0] b;                           // used in the multiplication
                            

    assign acc = 0;

    assign a = num1;
    assign b = num2;


    while(b != 0)
        begin
            if(b[0] == 1)
                begin
                    acc = acc + a;
                end
            else
                begin
                    a <= a << 1;
                    b <= 1 >> b;
                end
        end

endmodule