
/****** comp_sum_2to1.sv *******/

// Inputs: 4 inputs, 16 bits each
// Outputs: 1 output, 16 bits

module comp_sum_4to1(clk, /*reset,*/ val1, val2, val3, val4, out, carry);
    input   clk;                                // clock signal
    //input   reset;                              // reset signal

    input   [15:0] val1; 
    input   [15:0] val2;                        
    input   [15:0] val3;
    input   [15:0] val4;

    output  [15:0] out;                        // signal sending the result
    output         carry;

    reg     [15:0] val1;
    reg     [15:0] val2;
    reg     [15:0] val3;
    reg     [15:0] val4;

    reg     [16:0] aux;
                            
    /*
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            assign out = 0;
    end
    */    

    always @(posedge clk)
    begin
        aux <= val1 + val2 + val3 + val4;
    end

    assign out = aux[15:0];
    assign carry = aux[16];
        
endmodule