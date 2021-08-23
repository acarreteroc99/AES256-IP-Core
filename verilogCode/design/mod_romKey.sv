
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey (clk, reg_full, fifo_full,
                    addr, 
                    data, done, wr_req
                    );

    input clk, reg_full, fifo_full;                            // 1: full, can't write ;; 0: has holes, can write
    input [(addr_width-1):0] addr;

    output reg [(data_width-1):0] data;
    output reg done, wr_req;

    parameter data_width = 8;
    parameter addr_width = 8;
    reg [data_width-1:0] rom [0:2**addr_width-1];              // 8 bit data, 4 elements per 45 columns == 180 elements < 2^8 = 256

    localparam period = 20;
    integer index;

    initial        
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key.txt", rom);
    
    //  Don't now why, assignation is not being completed. 
    always @* 
    begin
        if(fifo_full)
        begin
            wr_req <= 1'b1;
            done <= 1'b0;
        end

        if(!reg_full)
        begin
            //$display("Value of opComp is %b", opComp);
            data <= rom[addr];
            done <= 1'b1;
            wr_req <= 1'b0;
        end
    end

    endmodule
