
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_dec_rom256(  
                        clk, resetn,        
                        addr_romSbox, 
                        outp_romSbox               
                     );

    
    parameter data_width = 8;
    parameter addr_width = 8;

    input clk, resetn;
    input [(addr_width-1):0] addr_romSbox;

    //reg [data_width-1:0] rom [0:2**addr_width-1];

    output reg [(data_width-1):0] outp_romSbox;

    /*
    initial        
    begin
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/rijndaelSboxTable_INV.txt", rom);
        //$readmemh("C:/Users/RMartinez/Projects/RiscV/ProyectoAdri�n/AES256-HW-Accelerator-main/rijndaelTables/rijndaelSboxTable_v1.txt", rom);
    end

    always @(posedge clk or negedge resetn)
    begin
        outp_romSbox <= rom[addr_romSbox];
    end
    */

    always @(posedge clk)
    begin
        
        case(addr_romSbox)
            8'h00: outp_romSbox <= 8'h52;
            8'h01: outp_romSbox <= 8'h09;
            8'h02: outp_romSbox <= 8'h6a;
            8'h03: outp_romSbox <= 8'hd5;
            8'h04: outp_romSbox <= 8'h30;
            8'h05: outp_romSbox <= 8'h36;
            8'h06: outp_romSbox <= 8'ha5;
            8'h07: outp_romSbox <= 8'h38;
            8'h08: outp_romSbox <= 8'hbf;
            8'h09: outp_romSbox <= 8'h40;
            8'h0a: outp_romSbox <= 8'ha3;
            8'h0b: outp_romSbox <= 8'h9e;
            8'h0c: outp_romSbox <= 8'h81;
            8'h0d: outp_romSbox <= 8'hf3;
            8'h0e: outp_romSbox <= 8'hd7;
            8'h0f: outp_romSbox <= 8'hfb;
            8'h10: outp_romSbox <= 8'h7c;
            8'h11: outp_romSbox <= 8'he3;
            8'h12: outp_romSbox <= 8'h39;
            8'h13: outp_romSbox <= 8'h82;
            8'h14: outp_romSbox <= 8'h9b;
            8'h15: outp_romSbox <= 8'h2f;
            8'h16: outp_romSbox <= 8'hff;
            8'h17: outp_romSbox <= 8'h87;
            8'h18: outp_romSbox <= 8'h34;
            8'h19: outp_romSbox <= 8'h8e;
            8'h1a: outp_romSbox <= 8'h43;
            8'h1b: outp_romSbox <= 8'h44;
            8'h1c: outp_romSbox <= 8'hc4;
            8'h1d: outp_romSbox <= 8'hde;
            8'h1e: outp_romSbox <= 8'he9;
            8'h1f: outp_romSbox <= 8'hcb;
            8'h20: outp_romSbox <= 8'h54;
            8'h21: outp_romSbox <= 8'h7b;
            8'h22: outp_romSbox <= 8'h94;
            8'h23: outp_romSbox <= 8'h32;
            8'h24: outp_romSbox <= 8'ha6;
            8'h25: outp_romSbox <= 8'hc2;
            8'h26: outp_romSbox <= 8'h23;
            8'h27: outp_romSbox <= 8'h3d;
            8'h28: outp_romSbox <= 8'hee;
            8'h29: outp_romSbox <= 8'h4c;
            8'h2a: outp_romSbox <= 8'h95;
            8'h2b: outp_romSbox <= 8'h0b;
            8'h2c: outp_romSbox <= 8'h42;
            8'h2d: outp_romSbox <= 8'hfa;
            8'h2e: outp_romSbox <= 8'hc3;
            8'h2f: outp_romSbox <= 8'h4e;
            8'h30: outp_romSbox <= 8'h08;
            8'h31: outp_romSbox <= 8'h2e;
            8'h32: outp_romSbox <= 8'ha1;
            8'h33: outp_romSbox <= 8'h66;
            8'h34: outp_romSbox <= 8'h28;
            8'h35: outp_romSbox <= 8'hd9;
            8'h36: outp_romSbox <= 8'h24;
            8'h37: outp_romSbox <= 8'hb2;
            8'h38: outp_romSbox <= 8'h76;
            8'h39: outp_romSbox <= 8'h5b;
            8'h3a: outp_romSbox <= 8'ha2;
            8'h3b: outp_romSbox <= 8'h49;
            8'h3c: outp_romSbox <= 8'h6d;
            8'h3d: outp_romSbox <= 8'h8b;
            8'h3e: outp_romSbox <= 8'hd1;
            8'h3f: outp_romSbox <= 8'h25;
            8'h40: outp_romSbox <= 8'h72;
            8'h41: outp_romSbox <= 8'hf8;
            8'h42: outp_romSbox <= 8'hf6;
            8'h43: outp_romSbox <= 8'h64;
            8'h44: outp_romSbox <= 8'h86;
            8'h45: outp_romSbox <= 8'h68;
            8'h46: outp_romSbox <= 8'h98;
            8'h47: outp_romSbox <= 8'h16;
            8'h48: outp_romSbox <= 8'hd4;
            8'h49: outp_romSbox <= 8'ha4;
            8'h4a: outp_romSbox <= 8'h5c;
            8'h4b: outp_romSbox <= 8'hcc;
            8'h4c: outp_romSbox <= 8'h5d;
            8'h4d: outp_romSbox <= 8'h65;
            8'h4e: outp_romSbox <= 8'hb6;
            8'h4f: outp_romSbox <= 8'h92;
            8'h50: outp_romSbox <= 8'h6c;
            8'h51: outp_romSbox <= 8'h70;
            8'h52: outp_romSbox <= 8'h48;
            8'h53: outp_romSbox <= 8'h50;
            8'h54: outp_romSbox <= 8'hfd;
            8'h55: outp_romSbox <= 8'hed;
            8'h56: outp_romSbox <= 8'hb9;
            8'h57: outp_romSbox <= 8'hda;
            8'h58: outp_romSbox <= 8'h5e;
            8'h59: outp_romSbox <= 8'h15;
            8'h5a: outp_romSbox <= 8'h46;
            8'h5b: outp_romSbox <= 8'h57;
            8'h5c: outp_romSbox <= 8'ha7;
            8'h5d: outp_romSbox <= 8'h8d;
            8'h5e: outp_romSbox <= 8'h9d;
            8'h5f: outp_romSbox <= 8'h84;
            8'h60: outp_romSbox <= 8'h90;
            8'h61: outp_romSbox <= 8'hd8;
            8'h62: outp_romSbox <= 8'hab;
            8'h63: outp_romSbox <= 8'h00;
            8'h64: outp_romSbox <= 8'h8c;
            8'h65: outp_romSbox <= 8'hbc;
            8'h66: outp_romSbox <= 8'hd3;
            8'h67: outp_romSbox <= 8'h0a;
            8'h68: outp_romSbox <= 8'hf7;
            8'h69: outp_romSbox <= 8'he4;
            8'h6a: outp_romSbox <= 8'h58;
            8'h6b: outp_romSbox <= 8'h05;
            8'h6c: outp_romSbox <= 8'hb8;
            8'h6d: outp_romSbox <= 8'hb3;
            8'h6e: outp_romSbox <= 8'h45;
            8'h6f: outp_romSbox <= 8'h06;
            8'h70: outp_romSbox <= 8'hd0;
            8'h71: outp_romSbox <= 8'h2c;
            8'h72: outp_romSbox <= 8'h1e;
            8'h73: outp_romSbox <= 8'hca;
            8'h74: outp_romSbox <= 8'h8f;
            8'h75: outp_romSbox <= 8'h3f;
            8'h76: outp_romSbox <= 8'h0f;
            8'h77: outp_romSbox <= 8'h02;
            8'h78: outp_romSbox <= 8'hc1;
            8'h79: outp_romSbox <= 8'haf;
            8'h7a: outp_romSbox <= 8'hbd;
            8'h7b: outp_romSbox <= 8'h03;
            8'h7c: outp_romSbox <= 8'h01;
            8'h7d: outp_romSbox <= 8'h13;
            8'h7e: outp_romSbox <= 8'h8a;
            8'h7f: outp_romSbox <= 8'h6b;
            8'h80: outp_romSbox <= 8'h3a;
            8'h81: outp_romSbox <= 8'h91;
            8'h82: outp_romSbox <= 8'h11;
            8'h83: outp_romSbox <= 8'h41;
            8'h84: outp_romSbox <= 8'h4f;
            8'h85: outp_romSbox <= 8'h67;
            8'h86: outp_romSbox <= 8'hdc;
            8'h87: outp_romSbox <= 8'hea;
            8'h88: outp_romSbox <= 8'h97;
            8'h89: outp_romSbox <= 8'hf2;
            8'h8a: outp_romSbox <= 8'hcf;
            8'h8b: outp_romSbox <= 8'hce;
            8'h8c: outp_romSbox <= 8'hf0;
            8'h8d: outp_romSbox <= 8'hb4;
            8'h8e: outp_romSbox <= 8'he6;
            8'h8f: outp_romSbox <= 8'h73;
            8'h90: outp_romSbox <= 8'h96;
            8'h91: outp_romSbox <= 8'hac;
            8'h92: outp_romSbox <= 8'h74;
            8'h93: outp_romSbox <= 8'h22;
            8'h94: outp_romSbox <= 8'he7;
            8'h95: outp_romSbox <= 8'had;
            8'h96: outp_romSbox <= 8'h35;
            8'h97: outp_romSbox <= 8'h85;
            8'h98: outp_romSbox <= 8'he2;
            8'h99: outp_romSbox <= 8'hf9;
            8'h9a: outp_romSbox <= 8'h37;
            8'h9b: outp_romSbox <= 8'he8;
            8'h9c: outp_romSbox <= 8'h1c;
            8'h9d: outp_romSbox <= 8'h75;
            8'h9e: outp_romSbox <= 8'hdf;
            8'h9f: outp_romSbox <= 8'h6e;
            8'ha0: outp_romSbox <= 8'h47;
            8'ha1: outp_romSbox <= 8'hf1;
            8'ha2: outp_romSbox <= 8'h1a;
            8'ha3: outp_romSbox <= 8'h71;
            8'ha4: outp_romSbox <= 8'h1d;
            8'ha5: outp_romSbox <= 8'h29;
            8'ha6: outp_romSbox <= 8'hc5;
            8'ha7: outp_romSbox <= 8'h89;
            8'ha8: outp_romSbox <= 8'h6f;
            8'ha9: outp_romSbox <= 8'hb7;
            8'haa: outp_romSbox <= 8'h62;
            8'hab: outp_romSbox <= 8'h0e;
            8'hac: outp_romSbox <= 8'haa;
            8'had: outp_romSbox <= 8'h18;
            8'hae: outp_romSbox <= 8'hbe;
            8'haf: outp_romSbox <= 8'h1b;
            8'hb0: outp_romSbox <= 8'hfc;
            8'hb1: outp_romSbox <= 8'h56;
            8'hb2: outp_romSbox <= 8'h3e;
            8'hb3: outp_romSbox <= 8'h4b;
            8'hb4: outp_romSbox <= 8'hc6;
            8'hb5: outp_romSbox <= 8'hd2;
            8'hb6: outp_romSbox <= 8'h79;
            8'hb7: outp_romSbox <= 8'h20;
            8'hb8: outp_romSbox <= 8'h9a;
            8'hb9: outp_romSbox <= 8'hdb;
            8'hba: outp_romSbox <= 8'hc0;
            8'hbb: outp_romSbox <= 8'hfe;
            8'hbc: outp_romSbox <= 8'h78;
            8'hbd: outp_romSbox <= 8'hcd;
            8'hbe: outp_romSbox <= 8'h5a;
            8'hbf: outp_romSbox <= 8'hf4;
            8'hc0: outp_romSbox <= 8'h1f;
            8'hc1: outp_romSbox <= 8'hdd;
            8'hc2: outp_romSbox <= 8'ha8;
            8'hc3: outp_romSbox <= 8'h33;
            8'hc4: outp_romSbox <= 8'h88;
            8'hc5: outp_romSbox <= 8'h07;
            8'hc6: outp_romSbox <= 8'hc7;
            8'hc7: outp_romSbox <= 8'h31;
            8'hc8: outp_romSbox <= 8'hb1;
            8'hc9: outp_romSbox <= 8'h12;
            8'hca: outp_romSbox <= 8'h10;
            8'hcb: outp_romSbox <= 8'h59;
            8'hcc: outp_romSbox <= 8'h27;
            8'hcd: outp_romSbox <= 8'h80;
            8'hce: outp_romSbox <= 8'hec;
            8'hcf: outp_romSbox <= 8'h5f;
            8'hd0: outp_romSbox <= 8'h60;
            8'hd1: outp_romSbox <= 8'h51;
            8'hd2: outp_romSbox <= 8'h7f;
            8'hd3: outp_romSbox <= 8'ha9;
            8'hd4: outp_romSbox <= 8'h19;
            8'hd5: outp_romSbox <= 8'hb5;
            8'hd6: outp_romSbox <= 8'h4a;
            8'hd7: outp_romSbox <= 8'h0d;
            8'hd8: outp_romSbox <= 8'h2d;
            8'hd9: outp_romSbox <= 8'he5;
            8'hda: outp_romSbox <= 8'h7a;
            8'hdb: outp_romSbox <= 8'h9f;
            8'hdc: outp_romSbox <= 8'h93;
            8'hdd: outp_romSbox <= 8'hc9;
            8'hde: outp_romSbox <= 8'h9c;
            8'hdf: outp_romSbox <= 8'hef;
            8'he0: outp_romSbox <= 8'ha0;
            8'he1: outp_romSbox <= 8'he0;
            8'he2: outp_romSbox <= 8'h3b;
            8'he3: outp_romSbox <= 8'h4d;
            8'he4: outp_romSbox <= 8'hae;
            8'he5: outp_romSbox <= 8'h2a;
            8'he6: outp_romSbox <= 8'hf5;
            8'he7: outp_romSbox <= 8'hb0;
            8'he8: outp_romSbox <= 8'hc8;
            8'he9: outp_romSbox <= 8'heb;
            8'hea: outp_romSbox <= 8'hbb;
            8'heb: outp_romSbox <= 8'h3c;
            8'hec: outp_romSbox <= 8'h83;
            8'hed: outp_romSbox <= 8'h53;
            8'hee: outp_romSbox <= 8'h99;
            8'hef: outp_romSbox <= 8'h61;
            8'hf0: outp_romSbox <= 8'h17;
            8'hf1: outp_romSbox <= 8'h2b;
            8'hf2: outp_romSbox <= 8'h04;
            8'hf3: outp_romSbox <= 8'h7e;
            8'hf4: outp_romSbox <= 8'hba;
            8'hf5: outp_romSbox <= 8'h77;
            8'hf6: outp_romSbox <= 8'hd6;
            8'hf7: outp_romSbox <= 8'h26;
            8'hf8: outp_romSbox <= 8'he1;
            8'hf9: outp_romSbox <= 8'h69;
            8'hfa: outp_romSbox <= 8'h14;
            8'hfb: outp_romSbox <= 8'h63;
            8'hfc: outp_romSbox <= 8'h55;
            8'hfd: outp_romSbox <= 8'h21;
            8'hfe: outp_romSbox <= 8'h0c;
            8'hff: outp_romSbox <= 8'h7d;
            
        endcase
    end
    
 endmodule

   /*
        case(addr_romSbox)
            8'h00: outp_romSbox <= 8'hc6;
            8'h01: outp_romSbox <= 8'hf8;
            8'h02: outp_romSbox <= 8'hee;
            8'h03: outp_romSbox <= 8'hf6;
            8'h04: outp_romSbox <= 8'hff;
            8'h05: outp_romSbox <= 8'hd6;
            8'h06: outp_romSbox <= 8'hde;
            8'h07: outp_romSbox <= 8'h91;
            8'h08: outp_romSbox <= 8'h60;
            8'h09: outp_romSbox <= 8'h02;
            8'h0a: outp_romSbox <= 8'hce;
            8'h0b: outp_romSbox <= 8'h56;
            8'h0c: outp_romSbox <= 8'he7;
            8'h0d: outp_romSbox <= 8'hb5;
            8'h0e: outp_romSbox <= 8'h4d;
            8'h0f: outp_romSbox <= 8'hec;
            8'h10: outp_romSbox <= 8'h8f;
            8'h11: outp_romSbox <= 8'h1f;
            8'h12: outp_romSbox <= 8'h89;
            8'h13: outp_romSbox <= 8'hfa;
            8'h14: outp_romSbox <= 8'hef;
            8'h15: outp_romSbox <= 8'hb2;
            8'h16: outp_romSbox <= 8'h8e;
            8'h17: outp_romSbox <= 8'hfb;
            8'h18: outp_romSbox <= 8'h41;
            8'h19: outp_romSbox <= 8'hb3;
            8'h1a: outp_romSbox <= 8'h5f;
            8'h1b: outp_romSbox <= 8'h45;
            8'h1c: outp_romSbox <= 8'h23;
            8'h1d: outp_romSbox <= 8'h53;
            8'h1e: outp_romSbox <= 8'he4;
            8'h1f: outp_romSbox <= 8'h9b;
            8'h20: outp_romSbox <= 8'h75;
            8'h21: outp_romSbox <= 8'he1;
            8'h22: outp_romSbox <= 8'h3d;
            8'h23: outp_romSbox <= 8'h4c;
            8'h24: outp_romSbox <= 8'h6c;
            8'h25: outp_romSbox <= 8'h7e;
            8'h26: outp_romSbox <= 8'hf5;
            8'h27: outp_romSbox <= 8'h83;
            8'h28: outp_romSbox <= 8'h68;
            8'h29: outp_romSbox <= 8'h51;
            8'h2a: outp_romSbox <= 8'hd1;
            8'h2b: outp_romSbox <= 8'hf9;
            8'h2c: outp_romSbox <= 8'he2;
            8'h2d: outp_romSbox <= 8'hab;
            8'h2e: outp_romSbox <= 8'h62;
            8'h2f: outp_romSbox <= 8'h2a;
            8'h30: outp_romSbox <= 8'h08;
            8'h31: outp_romSbox <= 8'h95;
            8'h32: outp_romSbox <= 8'h46;
            8'h33: outp_romSbox <= 8'h9d;
            8'h34: outp_romSbox <= 8'h30;
            8'h35: outp_romSbox <= 8'h37;
            8'h36: outp_romSbox <= 8'h0a;
            8'h37: outp_romSbox <= 8'h2f;
            8'h38: outp_romSbox <= 8'h0e;
            8'h39: outp_romSbox <= 8'h24;
            8'h3a: outp_romSbox <= 8'h1b;
            8'h3b: outp_romSbox <= 8'hdf;
            8'h3c: outp_romSbox <= 8'hcd;
            8'h3d: outp_romSbox <= 8'h4e;
            8'h3e: outp_romSbox <= 8'h7f;
            8'h3f: outp_romSbox <= 8'hea;
            8'h40: outp_romSbox <= 8'h12;
            8'h41: outp_romSbox <= 8'h1d;
            8'h42: outp_romSbox <= 8'h58;
            8'h43: outp_romSbox <= 8'h34;
            8'h44: outp_romSbox <= 8'h36;
            8'h45: outp_romSbox <= 8'hdc;
            8'h46: outp_romSbox <= 8'hb4;
            8'h47: outp_romSbox <= 8'h5b;
            8'h48: outp_romSbox <= 8'ha4;
            8'h49: outp_romSbox <= 8'h76;
            8'h4a: outp_romSbox <= 8'hb7;
            8'h4b: outp_romSbox <= 8'h7d;
            8'h4c: outp_romSbox <= 8'h52;
            8'h4d: outp_romSbox <= 8'hdd;
            8'h4e: outp_romSbox <= 8'h5e;
            8'h4f: outp_romSbox <= 8'h13;
            8'h50: outp_romSbox <= 8'ha6;
            8'h51: outp_romSbox <= 8'hb9;
            8'h52: outp_romSbox <= 8'h00;
            8'h53: outp_romSbox <= 8'hc1;
            8'h54: outp_romSbox <= 8'h40;
            8'h55: outp_romSbox <= 8'he3;
            8'h56: outp_romSbox <= 8'h79;
            8'h57: outp_romSbox <= 8'hb6;
            8'h58: outp_romSbox <= 8'hd4;
            8'h59: outp_romSbox <= 8'h8d;
            8'h5a: outp_romSbox <= 8'h67;
            8'h5b: outp_romSbox <= 8'h72;
            8'h5c: outp_romSbox <= 8'h94;
            8'h5d: outp_romSbox <= 8'h98;
            8'h5e: outp_romSbox <= 8'hb0;
            8'h5f: outp_romSbox <= 8'h85;
            8'h60: outp_romSbox <= 8'hbb;
            8'h61: outp_romSbox <= 8'hc5;
            8'h62: outp_romSbox <= 8'h4f;
            8'h63: outp_romSbox <= 8'hed;
            8'h64: outp_romSbox <= 8'h86;
            8'h65: outp_romSbox <= 8'h9a;
            8'h66: outp_romSbox <= 8'h66;
            8'h67: outp_romSbox <= 8'h11;
            8'h68: outp_romSbox <= 8'h8a;
            8'h69: outp_romSbox <= 8'he9;
            8'h6a: outp_romSbox <= 8'h04;
            8'h6b: outp_romSbox <= 8'hfe;
            8'h6c: outp_romSbox <= 8'ha0;
            8'h6d: outp_romSbox <= 8'h78;
            8'h6e: outp_romSbox <= 8'h25;
            8'h6f: outp_romSbox <= 8'h4b;
            8'h70: outp_romSbox <= 8'ha2;
            8'h71: outp_romSbox <= 8'h5d;
            8'h72: outp_romSbox <= 8'h80;
            8'h73: outp_romSbox <= 8'h05;
            8'h74: outp_romSbox <= 8'h3f;
            8'h75: outp_romSbox <= 8'h21;
            8'h76: outp_romSbox <= 8'h70;
            8'h77: outp_romSbox <= 8'hf1;
            8'h78: outp_romSbox <= 8'h63;
            8'h79: outp_romSbox <= 8'h77;
            8'h7a: outp_romSbox <= 8'haf;
            8'h7b: outp_romSbox <= 8'h42;
            8'h7c: outp_romSbox <= 8'h20;
            8'h7d: outp_romSbox <= 8'he5;
            8'h7e: outp_romSbox <= 8'hfd;
            8'h7f: outp_romSbox <= 8'hbf;
            8'h80: outp_romSbox <= 8'h81;
            8'h81: outp_romSbox <= 8'h18;
            8'h82: outp_romSbox <= 8'h26;
            8'h83: outp_romSbox <= 8'hc3;
            8'h84: outp_romSbox <= 8'hbe;
            8'h85: outp_romSbox <= 8'h35;
            8'h86: outp_romSbox <= 8'h88;
            8'h87: outp_romSbox <= 8'h2e;
            8'h88: outp_romSbox <= 8'h93;
            8'h89: outp_romSbox <= 8'h55;
            8'h8a: outp_romSbox <= 8'hfc;
            8'h8b: outp_romSbox <= 8'h7a;
            8'h8c: outp_romSbox <= 8'hc8;
            8'h8d: outp_romSbox <= 8'hba;
            8'h8e: outp_romSbox <= 8'h32;
            8'h8f: outp_romSbox <= 8'he6;
            8'h90: outp_romSbox <= 8'hc0;
            8'h91: outp_romSbox <= 8'h19;
            8'h92: outp_romSbox <= 8'h9e;
            8'h93: outp_romSbox <= 8'ha3;
            8'h94: outp_romSbox <= 8'h44;
            8'h95: outp_romSbox <= 8'h54;
            8'h96: outp_romSbox <= 8'h3b;
            8'h97: outp_romSbox <= 8'h0b;
            8'h98: outp_romSbox <= 8'h8c;
            8'h99: outp_romSbox <= 8'hc7;
            8'h9a: outp_romSbox <= 8'h6b;
            8'h9b: outp_romSbox <= 8'h28;
            8'h9c: outp_romSbox <= 8'ha7;
            8'h9d: outp_romSbox <= 8'hbc;
            8'h9e: outp_romSbox <= 8'h16;
            8'h9f: outp_romSbox <= 8'had;
            8'ha0: outp_romSbox <= 8'hdb;
            8'ha1: outp_romSbox <= 8'h64;
            8'ha2: outp_romSbox <= 8'h74;
            8'ha3: outp_romSbox <= 8'h14;
            8'ha4: outp_romSbox <= 8'h92;
            8'ha5: outp_romSbox <= 8'h0c;
            8'ha6: outp_romSbox <= 8'h48;
            8'ha7: outp_romSbox <= 8'hb8;
            8'ha8: outp_romSbox <= 8'h9f;
            8'ha9: outp_romSbox <= 8'hbd;
            8'haa: outp_romSbox <= 8'h43;
            8'hab: outp_romSbox <= 8'hc4;
            8'hac: outp_romSbox <= 8'h39;
            8'had: outp_romSbox <= 8'h31;
            8'hae: outp_romSbox <= 8'hd3;
            8'haf: outp_romSbox <= 8'hf2;
            8'hb0: outp_romSbox <= 8'hd5;
            8'hb1: outp_romSbox <= 8'h8b;
            8'hb2: outp_romSbox <= 8'h6e;
            8'hb3: outp_romSbox <= 8'hda;
            8'hb4: outp_romSbox <= 8'h01;
            8'hb5: outp_romSbox <= 8'hb1;
            8'hb6: outp_romSbox <= 8'h9c;
            8'hb7: outp_romSbox <= 8'h49;
            8'hb8: outp_romSbox <= 8'hd8;
            8'hb9: outp_romSbox <= 8'hac;
            8'hba: outp_romSbox <= 8'hf3;
            8'hbb: outp_romSbox <= 8'hcf;
            8'hbc: outp_romSbox <= 8'hca;
            8'hbd: outp_romSbox <= 8'hf4;
            8'hbe: outp_romSbox <= 8'h47;
            8'hbf: outp_romSbox <= 8'h10;
            8'hc0: outp_romSbox <= 8'h6f;
            8'hc1: outp_romSbox <= 8'hf0;
            8'hc2: outp_romSbox <= 8'h4a;
            8'hc3: outp_romSbox <= 8'h5c;
            8'hc4: outp_romSbox <= 8'h38;
            8'hc5: outp_romSbox <= 8'h57;
            8'hc6: outp_romSbox <= 8'h73;
            8'hc7: outp_romSbox <= 8'h97;
            8'hc8: outp_romSbox <= 8'hcb;
            8'hc9: outp_romSbox <= 8'ha1;
            8'hca: outp_romSbox <= 8'he8;
            8'hcb: outp_romSbox <= 8'h3e;
            8'hcc: outp_romSbox <= 8'h96;
            8'hcd: outp_romSbox <= 8'h61;
            8'hce: outp_romSbox <= 8'h0d;
            8'hcf: outp_romSbox <= 8'h0f;
            8'hd0: outp_romSbox <= 8'he0;
            8'hd1: outp_romSbox <= 8'h7c;
            8'hd2: outp_romSbox <= 8'h71;
            8'hd3: outp_romSbox <= 8'hcc;
            8'hd4: outp_romSbox <= 8'h90;
            8'hd5: outp_romSbox <= 8'h06;
            8'hd6: outp_romSbox <= 8'hf7;
            8'hd7: outp_romSbox <= 8'h1c;
            8'hd8: outp_romSbox <= 8'hc2;
            8'hd9: outp_romSbox <= 8'h6a;
            8'hda: outp_romSbox <= 8'hae;
            8'hdb: outp_romSbox <= 8'h69;
            8'hdc: outp_romSbox <= 8'h17;
            8'hdd: outp_romSbox <= 8'h99;
            8'hde: outp_romSbox <= 8'h3a;
            8'hdf: outp_romSbox <= 8'h27;
            8'he0: outp_romSbox <= 8'hd9;
            8'he1: outp_romSbox <= 8'heb;
            8'he2: outp_romSbox <= 8'h2b;
            8'he3: outp_romSbox <= 8'h22;
            8'he4: outp_romSbox <= 8'hd2;
            8'he5: outp_romSbox <= 8'ha9;
            8'he6: outp_romSbox <= 8'h07;
            8'he7: outp_romSbox <= 8'h33;
            8'he8: outp_romSbox <= 8'h2d;
            8'he9: outp_romSbox <= 8'h3c;
            8'hea: outp_romSbox <= 8'h15;
            8'heb: outp_romSbox <= 8'hc9;
            8'hec: outp_romSbox <= 8'h87;
            8'hed: outp_romSbox <= 8'haa;
            8'hee: outp_romSbox <= 8'h50;
            8'hef: outp_romSbox <= 8'ha5;
            8'hf0: outp_romSbox <= 8'h03;
            8'hf1: outp_romSbox <= 8'h59;
            8'hf2: outp_romSbox <= 8'h09;
            8'hf3: outp_romSbox <= 8'h1a;
            8'hf4: outp_romSbox <= 8'h65;
            8'hf5: outp_romSbox <= 8'hd7;
            8'hf6: outp_romSbox <= 8'h84;
            8'hf7: outp_romSbox <= 8'hd0;
            8'hf8: outp_romSbox <= 8'h82;
            8'hf9: outp_romSbox <= 8'h29;
            8'hfa: outp_romSbox <= 8'h5a;
            8'hfb: outp_romSbox <= 8'h1e;
            8'hfc: outp_romSbox <= 8'h7b;
            8'hfd: outp_romSbox <= 8'ha8;
            8'hfe: outp_romSbox <= 8'h6d;
            8'hff: outp_romSbox <= 8'h2c;
            */