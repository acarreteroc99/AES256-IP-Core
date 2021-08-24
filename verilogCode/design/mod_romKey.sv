
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey ( clk,
                    addr, wr_en,
                    data, done
                    );

    input clk, wr_en;
    input [(addr_width-1):0] addr;

    output reg [(data_width-1):0] data;
    output reg done;

    parameter data_width = 128;                                 // More efficient since we output an entire matrix to encode
    parameter addr_width = 4;                                  // 14 rounds < 2^4 = 16
    reg [(data_width-1):0] rom [0:2**addr_width-1];              

    initial        
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key.txt", rom);


    always @* 
    begin

        if(wr_en)
        begin
            //$display("Value of opComp is %b", opComp);
            data <= rom[addr];
            done <= 1'b1;
        end
        done <= 1'b0;
    end

    endmodule
