
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey ( clk, resetn, startBit,
                    addr, wr_en,
                    data, done
                    );

    input clk, resetn, startBit, wr_en;
    input [(addr_width-1):0] addr;

    output reg [(data_width-1):0] data;
    output reg done;

    parameter data_width = 128;                                 // More efficient since we output an entire matrix to encode
    parameter addr_width = 4;                                  // 14 rounds < 2^4 = 16
    reg [(data_width-1):0] rom [0:2**addr_width-1];        
    //reg reg_startBit;      

    initial        
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key.txt", rom);

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            begin
                done = 0;
                data = 0;
                //reg_startBit = 1'b0;
            end
    end

    /*
    always @(posedge startBit)
        reg_startBit = 1'b1;
    
    always @(negedge startBit)
        reg_startBit = 1'b0;
    */

    always @(posedge clk)
    begin
        if(wr_en && startBit)
        begin
            //$display("Value of opComp is %b", opComp);
            data <= rom[addr];
            assign done = 1'b1;
        end
    end

    always @(negedge clk)
        assign done = 1'b0;

    endmodule
