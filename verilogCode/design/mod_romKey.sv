
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey(  clk, resetn,            
                    selectKey,              
                    data                    
                 );

    localparam data_width = 128;                                 
    localparam addr_width = 4;

    input clk, resetn;                                              
    input [(addr_width-1):0] selectKey;                                                         // Round indicating which key shall be selected                                     

    output reg [(data_width-1):0] data;                                                         // Key sent to addRK
                                
    reg [(data_width-1):0] rom [0:2**addr_width-1];                                             // Stores the keys read from the file
   

    initial        
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key.txt", rom);    // Keys are read from a file

    assign data = rom[selectKey];

    always @(posedge clk or negedge resetn)
    begin
        $display("KEY: %h,", data);
        $display("-------------------------------------------------------------------------"); 
    end
endmodule
