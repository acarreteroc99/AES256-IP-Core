
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey ( clk, resetn, startBit,
                    selectKey, wr_en,
                    data, done
                    );

    input clk, resetn, startBit, wr_en;
    input [(addr_width-1):0] selectKey;

    output reg [(data_width-1):0] data;
    output reg done;

    parameter data_width = 128;                                 // More efficient since we output an entire matrix to encode
    parameter addr_width = 4;                                  // 14 rounds < 2^4 = 16
    reg [(data_width-1):0] rom [0:2**addr_width-1];        
    reg reg_startBit;      

    initial        
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key.txt", rom);

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            done = 0;
            //data = 0;
        end

        else 
        begin
            reg_startBit = startBit;

            if(wr_en && startBit)
            begin
                //$display("Value of opComp is %b", opComp);
                data <= rom[selectKey];
                done = 1'b1;
                //$display("Key value (romKey mod): %h", data);
            end
            else
                done = 1'b0;
        end
    end

endmodule
