
/****** mod_rom256.sv *******/

// Inputs: 3 (clk, en, addr)
// Outputs: 1 (data)

module mod_enc_rom256   (clk, reg_full, fifo_full,
                        addr, 
                        data, done, wr_req
                        );

    input clk, reg_full, fifo_full;                            // 1: full, can't write ;; 0: has holes, can write
    input [(addr_width-1):0] addr;

    output reg [(data_width-1):0] data;
    output reg done, wr_req;

    parameter data_width = 8;
    parameter addr_width = 8;
    reg [data_width-1:0] rom [0:2**addr_width-1];

    localparam period = 20;
    integer index;

    initial        
    begin
        $readmemh("/home/adrian/Desktop/AES256-HW-Accelerator/rijndaelTables/rijndaelSboxTable.txt", rom);
    end

    always @(posedge clk)
    begin
        if(fifo_full)
        begin
            wr_req = 1'b1;
            done = 1'b0;
        end

        if(!reg_full)
        begin
            data <= rom[addr];
            done = 1'b1;
            wr_req = 1'b0;
        end
    end

endmodule

    /*
    ===================  ROM OpenCores.org (AES) =================

    // S box
    module S (clk, in, data);
        input clk;
        input [7:0] in;
        output reg [7:0] data;

        always @ (posedge clk)
        case (in)
        8'h00: data <= 8'h63;
        8'h01: data <= 8'h7c;
        8'h02: data <= 8'h77;
        8'h03: data <= 8'h7b;
        8'h04: data <= 8'hf2;
        8'h05: data <= 8'h6b;
        8'h06: data <= 8'h6f;
        8'h07: data <= 8'hc5;
        8'h08: data <= 8'h30;
        8'h09: data <= 8'h01;
        8'h0a: data <= 8'h67;
        8'h0b: data <= 8'h2b;
        8'h0c: data <= 8'hfe;
        8'h0d: data <= 8'hd7;
        8'h0e: data <= 8'hab;
        8'h0f: data <= 8'h76;
        8'h10: data <= 8'hca;
        8'h11: data <= 8'h82;
        8'h12: data <= 8'hc9;
        8'h13: data <= 8'h7d;
        8'h14: data <= 8'hfa;
        8'h15: data <= 8'h59;
        8'h16: data <= 8'h47;
        8'h17: data <= 8'hf0;
        8'h18: data <= 8'had;
        8'h19: data <= 8'hd4;
        8'h1a: data <= 8'ha2;
        8'h1b: data <= 8'haf;
        8'h1c: data <= 8'h9c;
        8'h1d: data <= 8'ha4;
        8'h1e: data <= 8'h72;
        8'h1f: data <= 8'hc0;
        8'h20: data <= 8'hb7;
        8'h21: data <= 8'hfd;
        8'h22: data <= 8'h93;
        8'h23: data <= 8'h26;
        8'h24: data <= 8'h36;
        8'h25: data <= 8'h3f;
        8'h26: data <= 8'hf7;
        8'h27: data <= 8'hcc;
        8'h28: data <= 8'h34;
        8'h29: data <= 8'ha5;
        8'h2a: data <= 8'he5;
        8'h2b: data <= 8'hf1;
        8'h2c: data <= 8'h71;
        8'h2d: data <= 8'hd8;
        8'h2e: data <= 8'h31;
        8'h2f: data <= 8'h15;
        8'h30: data <= 8'h04;
        8'h31: data <= 8'hc7;
        8'h32: data <= 8'h23;
        8'h33: data <= 8'hc3;
        8'h34: data <= 8'h18;
        8'h35: data <= 8'h96;
        8'h36: data <= 8'h05;
        8'h37: data <= 8'h9a;
        8'h38: data <= 8'h07;
        8'h39: data <= 8'h12;
        8'h3a: data <= 8'h80;
        8'h3b: data <= 8'he2;
        8'h3c: data <= 8'heb;
        8'h3d: data <= 8'h27;
        8'h3e: data <= 8'hb2;
        8'h3f: data <= 8'h75;
        8'h40: data <= 8'h09;
        8'h41: data <= 8'h83;
        8'h42: data <= 8'h2c;
        8'h43: data <= 8'h1a;
        8'h44: data <= 8'h1b;
        8'h45: data <= 8'h6e;
        8'h46: data <= 8'h5a;
        8'h47: data <= 8'ha0;
        8'h48: data <= 8'h52;
        8'h49: data <= 8'h3b;
        8'h4a: data <= 8'hd6;
        8'h4b: data <= 8'hb3;
        8'h4c: data <= 8'h29;
        8'h4d: data <= 8'he3;
        8'h4e: data <= 8'h2f;
        8'h4f: data <= 8'h84;
        8'h50: data <= 8'h53;
        8'h51: data <= 8'hd1;
        8'h52: data <= 8'h00;
        8'h53: data <= 8'hed;
        8'h54: data <= 8'h20;
        8'h55: data <= 8'hfc;
        8'h56: data <= 8'hb1;
        8'h57: data <= 8'h5b;
        8'h58: data <= 8'h6a;
        8'h59: data <= 8'hcb;
        8'h5a: data <= 8'hbe;
        8'h5b: data <= 8'h39;
        8'h5c: data <= 8'h4a;
        8'h5d: data <= 8'h4c;
        8'h5e: data <= 8'h58;
        8'h5f: data <= 8'hcf;
        8'h60: data <= 8'hd0;
        8'h61: data <= 8'hef;
        8'h62: data <= 8'haa;
        8'h63: data <= 8'hfb;
        8'h64: data <= 8'h43;
        8'h65: data <= 8'h4d;
        8'h66: data <= 8'h33;
        8'h67: data <= 8'h85;
        8'h68: data <= 8'h45;
        8'h69: data <= 8'hf9;
        8'h6a: data <= 8'h02;
        8'h6b: data <= 8'h7f;
        8'h6c: data <= 8'h50;
        8'h6d: data <= 8'h3c;
        8'h6e: data <= 8'h9f;
        8'h6f: data <= 8'ha8;
        8'h70: data <= 8'h51;
        8'h71: data <= 8'ha3;
        8'h72: data <= 8'h40;
        8'h73: data <= 8'h8f;
        8'h74: data <= 8'h92;
        8'h75: data <= 8'h9d;
        8'h76: data <= 8'h38;
        8'h77: data <= 8'hf5;
        8'h78: data <= 8'hbc;
        8'h79: data <= 8'hb6;
        8'h7a: data <= 8'hda;
        8'h7b: data <= 8'h21;
        8'h7c: data <= 8'h10;
        8'h7d: data <= 8'hff;
        8'h7e: data <= 8'hf3;
        8'h7f: data <= 8'hd2;
        8'h80: data <= 8'hcd;
        8'h81: data <= 8'h0c;
        8'h82: data <= 8'h13;
        8'h83: data <= 8'hec;
        8'h84: data <= 8'h5f;
        8'h85: data <= 8'h97;
        8'h86: data <= 8'h44;
        8'h87: data <= 8'h17;
        8'h88: data <= 8'hc4;
        8'h89: data <= 8'ha7;
        8'h8a: data <= 8'h7e;
        8'h8b: data <= 8'h3d;
        8'h8c: data <= 8'h64;
        8'h8d: data <= 8'h5d;
        8'h8e: data <= 8'h19;
        8'h8f: data <= 8'h73;
        8'h90: data <= 8'h60;
        8'h91: data <= 8'h81;
        8'h92: data <= 8'h4f;
        8'h93: data <= 8'hdc;
        8'h94: data <= 8'h22;
        8'h95: data <= 8'h2a;
        8'h96: data <= 8'h90;
        8'h97: data <= 8'h88;
        8'h98: data <= 8'h46;
        8'h99: data <= 8'hee;
        8'h9a: data <= 8'hb8;
        8'h9b: data <= 8'h14;
        8'h9c: data <= 8'hde;
        8'h9d: data <= 8'h5e;
        8'h9e: data <= 8'h0b;
        8'h9f: data <= 8'hdb;
        8'ha0: data <= 8'he0;
        8'ha1: data <= 8'h32;
        8'ha2: data <= 8'h3a;
        8'ha3: data <= 8'h0a;
        8'ha4: data <= 8'h49;
        8'ha5: data <= 8'h06;
        8'ha6: data <= 8'h24;
        8'ha7: data <= 8'h5c;
        8'ha8: data <= 8'hc2;
        8'ha9: data <= 8'hd3;
        8'haa: data <= 8'hac;
        8'hab: data <= 8'h62;
        8'hac: data <= 8'h91;
        8'had: data <= 8'h95;
        8'hae: data <= 8'he4;
        8'haf: data <= 8'h79;
        8'hb0: data <= 8'he7;
        8'hb1: data <= 8'hc8;
        8'hb2: data <= 8'h37;
        8'hb3: data <= 8'h6d;
        8'hb4: data <= 8'h8d;
        8'hb5: data <= 8'hd5;
        8'hb6: data <= 8'h4e;
        8'hb7: data <= 8'ha9;
        8'hb8: data <= 8'h6c;
        8'hb9: data <= 8'h56;
        8'hba: data <= 8'hf4;
        8'hbb: data <= 8'hea;
        8'hbc: data <= 8'h65;
        8'hbd: data <= 8'h7a;
        8'hbe: data <= 8'hae;
        8'hbf: data <= 8'h08;
        8'hc0: data <= 8'hba;
        8'hc1: data <= 8'h78;
        8'hc2: data <= 8'h25;
        8'hc3: data <= 8'h2e;
        8'hc4: data <= 8'h1c;
        8'hc5: data <= 8'ha6;
        8'hc6: data <= 8'hb4;
        8'hc7: data <= 8'hc6;
        8'hc8: data <= 8'he8;
        8'hc9: data <= 8'hdd;
        8'hca: data <= 8'h74;
        8'hcb: data <= 8'h1f;
        8'hcc: data <= 8'h4b;
        8'hcd: data <= 8'hbd;
        8'hce: data <= 8'h8b;
        8'hcf: data <= 8'h8a;
        8'hd0: data <= 8'h70;
        8'hd1: data <= 8'h3e;
        8'hd2: data <= 8'hb5;
        8'hd3: data <= 8'h66;
        8'hd4: data <= 8'h48;
        8'hd5: data <= 8'h03;
        8'hd6: data <= 8'hf6;
        8'hd7: data <= 8'h0e;
        8'hd8: data <= 8'h61;
        8'hd9: data <= 8'h35;
        8'hda: data <= 8'h57;
        8'hdb: data <= 8'hb9;
        8'hdc: data <= 8'h86;
        8'hdd: data <= 8'hc1;
        8'hde: data <= 8'h1d;
        8'hdf: data <= 8'h9e;
        8'he0: data <= 8'he1;
        8'he1: data <= 8'hf8;
        8'he2: data <= 8'h98;
        8'he3: data <= 8'h11;
        8'he4: data <= 8'h69;
        8'he5: data <= 8'hd9;
        8'he6: data <= 8'h8e;
        8'he7: data <= 8'h94;
        8'he8: data <= 8'h9b;
        8'he9: data <= 8'h1e;
        8'hea: data <= 8'h87;
        8'heb: data <= 8'he9;
        8'hec: data <= 8'hce;
        8'hed: data <= 8'h55;
        8'hee: data <= 8'h28;
        8'hef: data <= 8'hdf;
        8'hf0: data <= 8'h8c;
        8'hf1: data <= 8'ha1;
        8'hf2: data <= 8'h89;
        8'hf3: data <= 8'h0d;
        8'hf4: data <= 8'hbf;
        8'hf5: data <= 8'he6;
        8'hf6: data <= 8'h42;
        8'hf7: data <= 8'h68;
        8'hf8: data <= 8'h41;
        8'hf9: data <= 8'h99;
        8'hfa: data <= 8'h2d;
        8'hfb: data <= 8'h0f;
        8'hfc: data <= 8'hb0;
        8'hfd: data <= 8'h54;
        8'hfe: data <= 8'hbb;
        8'hff: data <= 8'h16;
        endcase
    endmodule

    */

    /*
    ===================  INV ROM OpenCores.org (AES) =================
    module xS (clk, in, data);
        input clk;
        input [7:0] in;
        output reg [7:0] data;

        always @ (posedge clk)
        case (in)
        8'h00: data <= 8'hc6;
        8'h01: data <= 8'hf8;
        8'h02: data <= 8'hee;
        8'h03: data <= 8'hf6;
        8'h04: data <= 8'hff;
        8'h05: data <= 8'hd6;
        8'h06: data <= 8'hde;
        8'h07: data <= 8'h91;
        8'h08: data <= 8'h60;
        8'h09: data <= 8'h02;
        8'h0a: data <= 8'hce;
        8'h0b: data <= 8'h56;
        8'h0c: data <= 8'he7;
        8'h0d: data <= 8'hb5;
        8'h0e: data <= 8'h4d;
        8'h0f: data <= 8'hec;
        8'h10: data <= 8'h8f;
        8'h11: data <= 8'h1f;
        8'h12: data <= 8'h89;
        8'h13: data <= 8'hfa;
        8'h14: data <= 8'hef;
        8'h15: data <= 8'hb2;
        8'h16: data <= 8'h8e;
        8'h17: data <= 8'hfb;
        8'h18: data <= 8'h41;
        8'h19: data <= 8'hb3;
        8'h1a: data <= 8'h5f;
        8'h1b: data <= 8'h45;
        8'h1c: data <= 8'h23;
        8'h1d: data <= 8'h53;
        8'h1e: data <= 8'he4;
        8'h1f: data <= 8'h9b;
        8'h20: data <= 8'h75;
        8'h21: data <= 8'he1;
        8'h22: data <= 8'h3d;
        8'h23: data <= 8'h4c;
        8'h24: data <= 8'h6c;
        8'h25: data <= 8'h7e;
        8'h26: data <= 8'hf5;
        8'h27: data <= 8'h83;
        8'h28: data <= 8'h68;
        8'h29: data <= 8'h51;
        8'h2a: data <= 8'hd1;
        8'h2b: data <= 8'hf9;
        8'h2c: data <= 8'he2;
        8'h2d: data <= 8'hab;
        8'h2e: data <= 8'h62;
        8'h2f: data <= 8'h2a;
        8'h30: data <= 8'h08;
        8'h31: data <= 8'h95;
        8'h32: data <= 8'h46;
        8'h33: data <= 8'h9d;
        8'h34: data <= 8'h30;
        8'h35: data <= 8'h37;
        8'h36: data <= 8'h0a;
        8'h37: data <= 8'h2f;
        8'h38: data <= 8'h0e;
        8'h39: data <= 8'h24;
        8'h3a: data <= 8'h1b;
        8'h3b: data <= 8'hdf;
        8'h3c: data <= 8'hcd;
        8'h3d: data <= 8'h4e;
        8'h3e: data <= 8'h7f;
        8'h3f: data <= 8'hea;
        8'h40: data <= 8'h12;
        8'h41: data <= 8'h1d;
        8'h42: data <= 8'h58;
        8'h43: data <= 8'h34;
        8'h44: data <= 8'h36;
        8'h45: data <= 8'hdc;
        8'h46: data <= 8'hb4;
        8'h47: data <= 8'h5b;
        8'h48: data <= 8'ha4;
        8'h49: data <= 8'h76;
        8'h4a: data <= 8'hb7;
        8'h4b: data <= 8'h7d;
        8'h4c: data <= 8'h52;
        8'h4d: data <= 8'hdd;
        8'h4e: data <= 8'h5e;
        8'h4f: data <= 8'h13;
        8'h50: data <= 8'ha6;
        8'h51: data <= 8'hb9;
        8'h52: data <= 8'h00;
        8'h53: data <= 8'hc1;
        8'h54: data <= 8'h40;
        8'h55: data <= 8'he3;
        8'h56: data <= 8'h79;
        8'h57: data <= 8'hb6;
        8'h58: data <= 8'hd4;
        8'h59: data <= 8'h8d;
        8'h5a: data <= 8'h67;
        8'h5b: data <= 8'h72;
        8'h5c: data <= 8'h94;
        8'h5d: data <= 8'h98;
        8'h5e: data <= 8'hb0;
        8'h5f: data <= 8'h85;
        8'h60: data <= 8'hbb;
        8'h61: data <= 8'hc5;
        8'h62: data <= 8'h4f;
        8'h63: data <= 8'hed;
        8'h64: data <= 8'h86;
        8'h65: data <= 8'h9a;
        8'h66: data <= 8'h66;
        8'h67: data <= 8'h11;
        8'h68: data <= 8'h8a;
        8'h69: data <= 8'he9;
        8'h6a: data <= 8'h04;
        8'h6b: data <= 8'hfe;
        8'h6c: data <= 8'ha0;
        8'h6d: data <= 8'h78;
        8'h6e: data <= 8'h25;
        8'h6f: data <= 8'h4b;
        8'h70: data <= 8'ha2;
        8'h71: data <= 8'h5d;
        8'h72: data <= 8'h80;
        8'h73: data <= 8'h05;
        8'h74: data <= 8'h3f;
        8'h75: data <= 8'h21;
        8'h76: data <= 8'h70;
        8'h77: data <= 8'hf1;
        8'h78: data <= 8'h63;
        8'h79: data <= 8'h77;
        8'h7a: data <= 8'haf;
        8'h7b: data <= 8'h42;
        8'h7c: data <= 8'h20;
        8'h7d: data <= 8'he5;
        8'h7e: data <= 8'hfd;
        8'h7f: data <= 8'hbf;
        8'h80: data <= 8'h81;
        8'h81: data <= 8'h18;
        8'h82: data <= 8'h26;
        8'h83: data <= 8'hc3;
        8'h84: data <= 8'hbe;
        8'h85: data <= 8'h35;
        8'h86: data <= 8'h88;
        8'h87: data <= 8'h2e;
        8'h88: data <= 8'h93;
        8'h89: data <= 8'h55;
        8'h8a: data <= 8'hfc;
        8'h8b: data <= 8'h7a;
        8'h8c: data <= 8'hc8;
        8'h8d: data <= 8'hba;
        8'h8e: data <= 8'h32;
        8'h8f: data <= 8'he6;
        8'h90: data <= 8'hc0;
        8'h91: data <= 8'h19;
        8'h92: data <= 8'h9e;
        8'h93: data <= 8'ha3;
        8'h94: data <= 8'h44;
        8'h95: data <= 8'h54;
        8'h96: data <= 8'h3b;
        8'h97: data <= 8'h0b;
        8'h98: data <= 8'h8c;
        8'h99: data <= 8'hc7;
        8'h9a: data <= 8'h6b;
        8'h9b: data <= 8'h28;
        8'h9c: data <= 8'ha7;
        8'h9d: data <= 8'hbc;
        8'h9e: data <= 8'h16;
        8'h9f: data <= 8'had;
        8'ha0: data <= 8'hdb;
        8'ha1: data <= 8'h64;
        8'ha2: data <= 8'h74;
        8'ha3: data <= 8'h14;
        8'ha4: data <= 8'h92;
        8'ha5: data <= 8'h0c;
        8'ha6: data <= 8'h48;
        8'ha7: data <= 8'hb8;
        8'ha8: data <= 8'h9f;
        8'ha9: data <= 8'hbd;
        8'haa: data <= 8'h43;
        8'hab: data <= 8'hc4;
        8'hac: data <= 8'h39;
        8'had: data <= 8'h31;
        8'hae: data <= 8'hd3;
        8'haf: data <= 8'hf2;
        8'hb0: data <= 8'hd5;
        8'hb1: data <= 8'h8b;
        8'hb2: data <= 8'h6e;
        8'hb3: data <= 8'hda;
        8'hb4: data <= 8'h01;
        8'hb5: data <= 8'hb1;
        8'hb6: data <= 8'h9c;
        8'hb7: data <= 8'h49;
        8'hb8: data <= 8'hd8;
        8'hb9: data <= 8'hac;
        8'hba: data <= 8'hf3;
        8'hbb: data <= 8'hcf;
        8'hbc: data <= 8'hca;
        8'hbd: data <= 8'hf4;
        8'hbe: data <= 8'h47;
        8'hbf: data <= 8'h10;
        8'hc0: data <= 8'h6f;
        8'hc1: data <= 8'hf0;
        8'hc2: data <= 8'h4a;
        8'hc3: data <= 8'h5c;
        8'hc4: data <= 8'h38;
        8'hc5: data <= 8'h57;
        8'hc6: data <= 8'h73;
        8'hc7: data <= 8'h97;
        8'hc8: data <= 8'hcb;
        8'hc9: data <= 8'ha1;
        8'hca: data <= 8'he8;
        8'hcb: data <= 8'h3e;
        8'hcc: data <= 8'h96;
        8'hcd: data <= 8'h61;
        8'hce: data <= 8'h0d;
        8'hcf: data <= 8'h0f;
        8'hd0: data <= 8'he0;
        8'hd1: data <= 8'h7c;
        8'hd2: data <= 8'h71;
        8'hd3: data <= 8'hcc;
        8'hd4: data <= 8'h90;
        8'hd5: data <= 8'h06;
        8'hd6: data <= 8'hf7;
        8'hd7: data <= 8'h1c;
        8'hd8: data <= 8'hc2;
        8'hd9: data <= 8'h6a;
        8'hda: data <= 8'hae;
        8'hdb: data <= 8'h69;
        8'hdc: data <= 8'h17;
        8'hdd: data <= 8'h99;
        8'hde: data <= 8'h3a;
        8'hdf: data <= 8'h27;
        8'he0: data <= 8'hd9;
        8'he1: data <= 8'heb;
        8'he2: data <= 8'h2b;
        8'he3: data <= 8'h22;
        8'he4: data <= 8'hd2;
        8'he5: data <= 8'ha9;
        8'he6: data <= 8'h07;
        8'he7: data <= 8'h33;
        8'he8: data <= 8'h2d;
        8'he9: data <= 8'h3c;
        8'hea: data <= 8'h15;
        8'heb: data <= 8'hc9;
        8'hec: data <= 8'h87;
        8'hed: data <= 8'haa;
        8'hee: data <= 8'h50;
        8'hef: data <= 8'ha5;
        8'hf0: data <= 8'h03;
        8'hf1: data <= 8'h59;
        8'hf2: data <= 8'h09;
        8'hf3: data <= 8'h1a;
        8'hf4: data <= 8'h65;
        8'hf5: data <= 8'hd7;
        8'hf6: data <= 8'h84;
        8'hf7: data <= 8'hd0;
        8'hf8: data <= 8'h82;
        8'hf9: data <= 8'h29;
        8'hfa: data <= 8'h5a;
        8'hfb: data <= 8'h1e;
        8'hfc: data <= 8'h7b;
        8'hfd: data <= 8'ha8;
        8'hfe: data <= 8'h6d;
        8'hff: data <= 8'h2c;
        endcase
    endmodule
    */


    /* =====================================================
                        NOT WORKING NEITHER
    ========================================================
    always @(posedge clk) 
            begin
            if (en)
                case(addr)
                    4'b0000: data <= 4'b0010;
                    4'b0001: data <= 4'b0010;
                    4'b0010: data <= 4'b1110;
                    4'b0011: data <= 4'b0010;
                    4'b0100: data <= 4'b0100;
                    4'b0101: data <= 4'b1010;
                    4'b0110: data <= 4'b1100;
                    4'b0111: data <= 4'b0000;
                    4'b1000: data <= 4'b1010;
                    4'b1001: data <= 4'b0010;
                    4'b1010: data <= 4'b1110;
                    4'b1011: data <= 4'b0010;
                    4'b1100: data <= 4'b0100;
                    4'b1101: data <= 4'b1010;
                    4'b1110: data <= 4'b1100;
                    4'b1111: data <= 4'b0000;
                    default: data <= 4'bXXXX;
                    endcase
        end
            
    ==========================================================
    */
