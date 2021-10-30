
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey(  clk, resetn,            
                    addr_romKey,              
                    outp_romKey                    
                 );

    localparam data_width = 128;                                 
    localparam addr_width = 4;

    input clk, resetn;                                              
    input [(addr_width-1):0] addr_romKey;                                                         // Round indicating which key shall be selected                                     

    output reg [(data_width-1):0] outp_romKey;                                                         // Key sent to addRK
                                
    reg [(data_width-1):0] rom [0:2**addr_width-1];                                             // Stores the keys read from the file
   

    initial   
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key_v3_BO.txt", rom);    // Keys are read from a file
	    //$readmemh("../../rijndaelTables/key_v3_BO.txt", rom);    // Keys are read from a file     
        //$readmemh("C:/Users/RMartinez/Projects/RiscV/ProyectoAdri�n/AES256-HW-Accelerator-main/rijndaelTables/key_v2.txt", rom);    // Keys are read from a file    
       
    assign outp_romKey = rom[addr_romKey];

    always @(addr_romKey)
    begin
        $display("KEY: %h,", outp_romKey);
        $display("-------------------------------------------------------------------------"); 
    end

endmodule
