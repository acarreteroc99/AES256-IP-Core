
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey ( clk, resetn,            //startBit,
                    selectKey,              // wr_en,
                    data                    //, done
                    );

    input clk, resetn;                                              
    input [(addr_width-1):0] selectKey;                                                         // Round indicating which key shall be selected
    //input startBit, wr_en;
    
    //reg [(addr_width-1):0] reg_selectKey;                                        

    output reg [(data_width-1):0] data;                                                         // Key sent to addRK
    //output reg done;

    //parameter data_width = 128;                                 
    //parameter addr_width = 4;                                  
    //reg [(data_width-1):0] rom [0:2**addr_width-1];        
    //reg reg_startBit;      

    initial        
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/key.txt", rom);    // Keys are read from a file

    assign data = rom[selectKey];
    
endmodule
