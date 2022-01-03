
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_kg_subWord(  
                        clk, resetn,        
                        addr_subWord, 
                        outp_subWord               
                     );

    /*
    parameter data_width = 8;
    parameter addr_width = 8;

    input [(addr_width-1):0] addr_subWord;
    reg [data_width-1:0] rom [0:2**addr_width-1];
    output reg [(data_width-1):0] outp_subWord;
    */

    input clk, resetn;
    input [7:0] addr_subWord;
    output reg [7:0] outp_subWord;

    integer index;

    /*
    initial        
    begin
        //$readmemh("C:/Users/RMartinez/Projects/RiscV/ProyectoAdri�n/AES256-HW-Accelerator-main/rijndaelTables/rijndaelSboxTable_v1.txt", rom);
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/rijndaelSboxTable.txt", rom);
    end
    */

    //assign outp_subWord <= rom[addr_subWord];


    always @(addr_subWord)
    //always @(posedge clk or negedge resetn)
    begin
        //outp_subWord <= rom[addr_subWord];
        case (addr_subWord)
            8'h00: outp_subWord <= 8'h63;
            8'h01: outp_subWord <= 8'h7c;
            8'h02: outp_subWord <= 8'h77;
            8'h03: outp_subWord <= 8'h7b;
            8'h04: outp_subWord <= 8'hf2;
            8'h05: outp_subWord <= 8'h6b;
            8'h06: outp_subWord <= 8'h6f;
            8'h07: outp_subWord <= 8'hc5;
            8'h08: outp_subWord <= 8'h30;
            8'h09: outp_subWord <= 8'h01;
            8'h0a: outp_subWord <= 8'h67;
            8'h0b: outp_subWord <= 8'h2b;
            8'h0c: outp_subWord <= 8'hfe;
            8'h0d: outp_subWord <= 8'hd7;
            8'h0e: outp_subWord <= 8'hab;
            8'h0f: outp_subWord <= 8'h76;
            8'h10: outp_subWord <= 8'hca;
            8'h11: outp_subWord <= 8'h82;
            8'h12: outp_subWord <= 8'hc9;
            8'h13: outp_subWord <= 8'h7d;
            8'h14: outp_subWord <= 8'hfa;
            8'h15: outp_subWord <= 8'h59;
            8'h16: outp_subWord <= 8'h47;
            8'h17: outp_subWord <= 8'hf0;
            8'h18: outp_subWord <= 8'had;
            8'h19: outp_subWord <= 8'hd4;
            8'h1a: outp_subWord <= 8'ha2;
            8'h1b: outp_subWord <= 8'haf;
            8'h1c: outp_subWord <= 8'h9c;
            8'h1d: outp_subWord <= 8'ha4;
            8'h1e: outp_subWord <= 8'h72;
            8'h1f: outp_subWord <= 8'hc0;
            8'h20: outp_subWord <= 8'hb7;
            8'h21: outp_subWord <= 8'hfd;
            8'h22: outp_subWord <= 8'h93;
            8'h23: outp_subWord <= 8'h26;
            8'h24: outp_subWord <= 8'h36;
            8'h25: outp_subWord <= 8'h3f;
            8'h26: outp_subWord <= 8'hf7;
            8'h27: outp_subWord <= 8'hcc;
            8'h28: outp_subWord <= 8'h34;
            8'h29: outp_subWord <= 8'ha5;
            8'h2a: outp_subWord <= 8'he5;
            8'h2b: outp_subWord <= 8'hf1;
            8'h2c: outp_subWord <= 8'h71;
            8'h2d: outp_subWord <= 8'hd8;
            8'h2e: outp_subWord <= 8'h31;
            8'h2f: outp_subWord <= 8'h15;
            8'h30: outp_subWord <= 8'h04;
            8'h31: outp_subWord <= 8'hc7;
            8'h32: outp_subWord <= 8'h23;
            8'h33: outp_subWord <= 8'hc3;
            8'h34: outp_subWord <= 8'h18;
            8'h35: outp_subWord <= 8'h96;
            8'h36: outp_subWord <= 8'h05;
            8'h37: outp_subWord <= 8'h9a;
            8'h38: outp_subWord <= 8'h07;
            8'h39: outp_subWord <= 8'h12;
            8'h3a: outp_subWord <= 8'h80;
            8'h3b: outp_subWord <= 8'he2;
            8'h3c: outp_subWord <= 8'heb;
            8'h3d: outp_subWord <= 8'h27;
            8'h3e: outp_subWord <= 8'hb2;
            8'h3f: outp_subWord <= 8'h75;
            8'h40: outp_subWord <= 8'h09;
            8'h41: outp_subWord <= 8'h83;
            8'h42: outp_subWord <= 8'h2c;
            8'h43: outp_subWord <= 8'h1a;
            8'h44: outp_subWord <= 8'h1b;
            8'h45: outp_subWord <= 8'h6e;
            8'h46: outp_subWord <= 8'h5a;
            8'h47: outp_subWord <= 8'ha0;
            8'h48: outp_subWord <= 8'h52;
            8'h49: outp_subWord <= 8'h3b;
            8'h4a: outp_subWord <= 8'hd6;
            8'h4b: outp_subWord <= 8'hb3;
            8'h4c: outp_subWord <= 8'h29;
            8'h4d: outp_subWord <= 8'he3;
            8'h4e: outp_subWord <= 8'h2f;
            8'h4f: outp_subWord <= 8'h84;
            8'h50: outp_subWord <= 8'h53;
            8'h51: outp_subWord <= 8'hd1;
            8'h52: outp_subWord <= 8'h00;
            8'h53: outp_subWord <= 8'hed;
            8'h54: outp_subWord <= 8'h20;
            8'h55: outp_subWord <= 8'hfc;
            8'h56: outp_subWord <= 8'hb1;
            8'h57: outp_subWord <= 8'h5b;
            8'h58: outp_subWord <= 8'h6a;
            8'h59: outp_subWord <= 8'hcb;
            8'h5a: outp_subWord <= 8'hbe;
            8'h5b: outp_subWord <= 8'h39;
            8'h5c: outp_subWord <= 8'h4a;
            8'h5d: outp_subWord <= 8'h4c;
            8'h5e: outp_subWord <= 8'h58;
            8'h5f: outp_subWord <= 8'hcf;
            8'h60: outp_subWord <= 8'hd0;
            8'h61: outp_subWord <= 8'hef;
            8'h62: outp_subWord <= 8'haa;
            8'h63: outp_subWord <= 8'hfb;
            8'h64: outp_subWord <= 8'h43;
            8'h65: outp_subWord <= 8'h4d;
            8'h66: outp_subWord <= 8'h33;
            8'h67: outp_subWord <= 8'h85;
            8'h68: outp_subWord <= 8'h45;
            8'h69: outp_subWord <= 8'hf9;
            8'h6a: outp_subWord <= 8'h02;
            8'h6b: outp_subWord <= 8'h7f;
            8'h6c: outp_subWord <= 8'h50;
            8'h6d: outp_subWord <= 8'h3c;
            8'h6e: outp_subWord <= 8'h9f;
            8'h6f: outp_subWord <= 8'ha8;
            8'h70: outp_subWord <= 8'h51;
            8'h71: outp_subWord <= 8'ha3;
            8'h72: outp_subWord <= 8'h40;
            8'h73: outp_subWord <= 8'h8f;
            8'h74: outp_subWord <= 8'h92;
            8'h75: outp_subWord <= 8'h9d;
            8'h76: outp_subWord <= 8'h38;
            8'h77: outp_subWord <= 8'hf5;
            8'h78: outp_subWord <= 8'hbc;
            8'h79: outp_subWord <= 8'hb6;
            8'h7a: outp_subWord <= 8'hda;
            8'h7b: outp_subWord <= 8'h21;
            8'h7c: outp_subWord <= 8'h10;
            8'h7d: outp_subWord <= 8'hff;
            8'h7e: outp_subWord <= 8'hf3;
            8'h7f: outp_subWord <= 8'hd2;
            8'h80: outp_subWord <= 8'hcd;
            8'h81: outp_subWord <= 8'h0c;
            8'h82: outp_subWord <= 8'h13;
            8'h83: outp_subWord <= 8'hec;
            8'h84: outp_subWord <= 8'h5f;
            8'h85: outp_subWord <= 8'h97;
            8'h86: outp_subWord <= 8'h44;
            8'h87: outp_subWord <= 8'h17;
            8'h88: outp_subWord <= 8'hc4;
            8'h89: outp_subWord <= 8'ha7;
            8'h8a: outp_subWord <= 8'h7e;
            8'h8b: outp_subWord <= 8'h3d;
            8'h8c: outp_subWord <= 8'h64;
            8'h8d: outp_subWord <= 8'h5d;
            8'h8e: outp_subWord <= 8'h19;
            8'h8f: outp_subWord <= 8'h73;
            8'h90: outp_subWord <= 8'h60;
            8'h91: outp_subWord <= 8'h81;
            8'h92: outp_subWord <= 8'h4f;
            8'h93: outp_subWord <= 8'hdc;
            8'h94: outp_subWord <= 8'h22;
            8'h95: outp_subWord <= 8'h2a;
            8'h96: outp_subWord <= 8'h90;
            8'h97: outp_subWord <= 8'h88;
            8'h98: outp_subWord <= 8'h46;
            8'h99: outp_subWord <= 8'hee;
            8'h9a: outp_subWord <= 8'hb8;
            8'h9b: outp_subWord <= 8'h14;
            8'h9c: outp_subWord <= 8'hde;
            8'h9d: outp_subWord <= 8'h5e;
            8'h9e: outp_subWord <= 8'h0b;
            8'h9f: outp_subWord <= 8'hdb;
            8'ha0: outp_subWord <= 8'he0;
            8'ha1: outp_subWord <= 8'h32;
            8'ha2: outp_subWord <= 8'h3a;
            8'ha3: outp_subWord <= 8'h0a;
            8'ha4: outp_subWord <= 8'h49;
            8'ha5: outp_subWord <= 8'h06;
            8'ha6: outp_subWord <= 8'h24;
            8'ha7: outp_subWord <= 8'h5c;
            8'ha8: outp_subWord <= 8'hc2;
            8'ha9: outp_subWord <= 8'hd3;
            8'haa: outp_subWord <= 8'hac;
            8'hab: outp_subWord <= 8'h62;
            8'hac: outp_subWord <= 8'h91;
            8'had: outp_subWord <= 8'h95;
            8'hae: outp_subWord <= 8'he4;
            8'haf: outp_subWord <= 8'h79;
            8'hb0: outp_subWord <= 8'he7;
            8'hb1: outp_subWord <= 8'hc8;
            8'hb2: outp_subWord <= 8'h37;
            8'hb3: outp_subWord <= 8'h6d;
            8'hb4: outp_subWord <= 8'h8d;
            8'hb5: outp_subWord <= 8'hd5;
            8'hb6: outp_subWord <= 8'h4e;
            8'hb7: outp_subWord <= 8'ha9;
            8'hb8: outp_subWord <= 8'h6c;
            8'hb9: outp_subWord <= 8'h56;
            8'hba: outp_subWord <= 8'hf4;
            8'hbb: outp_subWord <= 8'hea;
            8'hbc: outp_subWord <= 8'h65;
            8'hbd: outp_subWord <= 8'h7a;
            8'hbe: outp_subWord <= 8'hae;
            8'hbf: outp_subWord <= 8'h08;
            8'hc0: outp_subWord <= 8'hba;
            8'hc1: outp_subWord <= 8'h78;
            8'hc2: outp_subWord <= 8'h25;
            8'hc3: outp_subWord <= 8'h2e;
            8'hc4: outp_subWord <= 8'h1c;
            8'hc5: outp_subWord <= 8'ha6;
            8'hc6: outp_subWord <= 8'hb4;
            8'hc7: outp_subWord <= 8'hc6;
            8'hc8: outp_subWord <= 8'he8;
            8'hc9: outp_subWord <= 8'hdd;
            8'hca: outp_subWord <= 8'h74;
            8'hcb: outp_subWord <= 8'h1f;
            8'hcc: outp_subWord <= 8'h4b;
            8'hcd: outp_subWord <= 8'hbd;
            8'hce: outp_subWord <= 8'h8b;
            8'hcf: outp_subWord <= 8'h8a;
            8'hd0: outp_subWord <= 8'h70;
            8'hd1: outp_subWord <= 8'h3e;
            8'hd2: outp_subWord <= 8'hb5;
            8'hd3: outp_subWord <= 8'h66;
            8'hd4: outp_subWord <= 8'h48;
            8'hd5: outp_subWord <= 8'h03;
            8'hd6: outp_subWord <= 8'hf6;
            8'hd7: outp_subWord <= 8'h0e;
            8'hd8: outp_subWord <= 8'h61;
            8'hd9: outp_subWord <= 8'h35;
            8'hda: outp_subWord <= 8'h57;
            8'hdb: outp_subWord <= 8'hb9;
            8'hdc: outp_subWord <= 8'h86;
            8'hdd: outp_subWord <= 8'hc1;
            8'hde: outp_subWord <= 8'h1d;
            8'hdf: outp_subWord <= 8'h9e;
            8'he0: outp_subWord <= 8'he1;
            8'he1: outp_subWord <= 8'hf8;
            8'he2: outp_subWord <= 8'h98;
            8'he3: outp_subWord <= 8'h11;
            8'he4: outp_subWord <= 8'h69;
            8'he5: outp_subWord <= 8'hd9;
            8'he6: outp_subWord <= 8'h8e;
            8'he7: outp_subWord <= 8'h94;
            8'he8: outp_subWord <= 8'h9b;
            8'he9: outp_subWord <= 8'h1e;
            8'hea: outp_subWord <= 8'h87;
            8'heb: outp_subWord <= 8'he9;
            8'hec: outp_subWord <= 8'hce;
            8'hed: outp_subWord <= 8'h55;
            8'hee: outp_subWord <= 8'h28;
            8'hef: outp_subWord <= 8'hdf;
            8'hf0: outp_subWord <= 8'h8c;
            8'hf1: outp_subWord <= 8'ha1;
            8'hf2: outp_subWord <= 8'h89;
            8'hf3: outp_subWord <= 8'h0d;
            8'hf4: outp_subWord <= 8'hbf;
            8'hf5: outp_subWord <= 8'he6;
            8'hf6: outp_subWord <= 8'h42;
            8'hf7: outp_subWord <= 8'h68;
            8'hf8: outp_subWord <= 8'h41;
            8'hf9: outp_subWord <= 8'h99;
            8'hfa: outp_subWord <= 8'h2d;
            8'hfb: outp_subWord <= 8'h0f;
            8'hfc: outp_subWord <= 8'hb0;
            8'hfd: outp_subWord <= 8'h54;
            8'hfe: outp_subWord <= 8'hbb;
            8'hff: outp_subWord <= 8'h16;
        endcase
    end
    
 endmodule

