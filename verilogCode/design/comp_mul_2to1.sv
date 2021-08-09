
/****** comp_mul_2to1.sv *******/

// Inputs: 2 inputs, 8 bits each
// Outputs: 2 output, 16 bits and 1

module comp_mul_2to1(clk, resetn, val1, val2, out, carry);
    input   clk;                                // clock signal
    input   resetn;                            // reset signal

    input   [7:0] val1; 
    input   [7:0] val2;                   
    
    output  [15:0] out;                         // signal sending the result
    output         carry;

    reg     [15:0] a; 
    reg     [15:0] acc;
    reg     [7:0]  b;                           // used in the multiplication
    reg            carry;

                     
    assign a[7:0] = val1;
    assign b[7:0] = val2;
    

    // Falta poner senyal de reset para los registros

    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            acc = 0;
            a = 0;
            b = 0;
        end
        else
        begin
            while(b != 0)
            begin
                if(b[0] == 1)
                begin
                    {carry, acc} <= acc + a;
                end
                a <= a << 1;
                b <= 1 >> b;
            end
        end
    end

    assign out = acc;

endmodule