
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey ( clk, resetn, startBit,
                    selectKey, wr_en,
                    data, done
                    );

    input clk, resetn, startBit, wr_en;
    input [(addr_width-1):0] selectKey;
    
    reg [(addr_width-1):0] reg_selectKey;                                          // Saving the round, so we can select the corresponding key

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
            done = 1'b0;
            reg_selectKey = 0;
            //data = 0;
        end

        else
        begin
            if(startBit)
            begin
                if(wr_en)
                begin
                    data <= rom[reg_selectKey];
                    done = 1'b1;
                end
                else
                    done = 1'b0;
            end
        end
    end
    
    always @(startBit)
        reg_startBit = startBit;
        
    always @(selectKey)
        reg_selectKey = selectKey;
    
    
endmodule
