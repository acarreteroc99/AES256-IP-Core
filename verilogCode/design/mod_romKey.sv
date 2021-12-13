
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_romKey(  
                    clk, resetn,
                    inp_romKey, addr_romKey, wrEn_romKey,
                    outp_romKey
                    );

    localparam data_width = 128;
    localparam addr_width = 4;
    localparam N = 16;

    input clk, resetn;
    input [(addr_width-1):0] addr_romKey;                                                       // Round indicating which key shall be selected
    input [(data_width-1):0] inp_romKey;
    input wrEn_romKey;

    output reg [(data_width-1):0] outp_romKey;                                                  // Key sent to addRK

    //reg [(data_width-1):0] rom [0:2**addr_width-1];                                             // Stores the keys read from the file
    reg [14:0][127:0] rom;
    reg [3:0] key_cnt;


    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            key_cnt <= 0;
            rom <= 0;
        end

        else
        begin
            if(wrEn_romKey)
            begin
                if(key_cnt < 15)
                begin
                    rom[key_cnt-1] <= inp_romKey;
                    key_cnt <= key_cnt + 1;
                end
            
            // The else is not needed since introducing new keys (key_cnt == 0) means reseting the ROM, where key_cnt is already set to 0.
            /*
            else
                key_cnt <= 0;
            */
            end
        end
    end

    always @(addr_romKey)
    begin
        outp_romKey <= rom[addr_romKey];
        $display("Key num %d is %h", addr_romKey, rom[addr_romKey]);
    end

endmodule
