

module mod_keygen(
                    clk, resetn,
                    kg_dataIn, kg_validKey,
                    kg_dataOut
                  );

    localparam Nk = 8;
    localparam Nr = 14;
    localparam Nb = 4;

    input clk, resetn;
    input [31:0] kg_dataIn;
    input kg_validKey;

    reg [3:0][7:0] temp;                       // Can this be simplified?
    reg [7:0][3:0][7:0] aux;
    reg [59:0][3:0][7:0] wordlist;
    reg [6:0][7:0] Rcon;
    
    output reg [59:0][3:0][7:0] kg_dataOut;
    
    //output reg [Nr:0][7:0] kg_dataOut;

    integer index, i, j;

    function [7:0] subWord (input [7:0] addr);
        case(addr)
            8'h00: subWord <= 8'h63;
            8'h01: subWord <= 8'h7c;
            8'h02: subWord <= 8'h77;
            8'h03: subWord <= 8'h7b;
            8'h04: subWord <= 8'hf2;
            8'h05: subWord <= 8'h6b;
            8'h06: subWord <= 8'h6f;
            8'h07: subWord <= 8'hc5;
            8'h08: subWord <= 8'h30;
            8'h09: subWord <= 8'h01;
            8'h0a: subWord <= 8'h67;
            8'h0b: subWord <= 8'h2b;
            8'h0c: subWord <= 8'hfe;
            8'h0d: subWord <= 8'hd7;
            8'h0e: subWord <= 8'hab;
            8'h0f: subWord <= 8'h76;
            8'h10: subWord <= 8'hca;
            8'h11: subWord <= 8'h82;
            8'h12: subWord <= 8'hc9;
            8'h13: subWord <= 8'h7d;
            8'h14: subWord <= 8'hfa;
            8'h15: subWord <= 8'h59;
            8'h16: subWord <= 8'h47;
            8'h17: subWord <= 8'hf0;
            8'h18: subWord <= 8'had;
            8'h19: subWord <= 8'hd4;
            8'h1a: subWord <= 8'ha2;
            8'h1b: subWord <= 8'haf;
            8'h1c: subWord <= 8'h9c;
            8'h1d: subWord <= 8'ha4;
            8'h1e: subWord <= 8'h72;
            8'h1f: subWord <= 8'hc0;
            8'h20: subWord <= 8'hb7;
            8'h21: subWord <= 8'hfd;
            8'h22: subWord <= 8'h93;
            8'h23: subWord <= 8'h26;
            8'h24: subWord <= 8'h36;
            8'h25: subWord <= 8'h3f;
            8'h26: subWord <= 8'hf7;
            8'h27: subWord <= 8'hcc;
            8'h28: subWord <= 8'h34;
            8'h29: subWord <= 8'ha5;
            8'h2a: subWord <= 8'he5;
            8'h2b: subWord <= 8'hf1;
            8'h2c: subWord <= 8'h71;
            8'h2d: subWord <= 8'hd8;
            8'h2e: subWord <= 8'h31;
            8'h2f: subWord <= 8'h15;
            8'h30: subWord <= 8'h04;
            8'h31: subWord <= 8'hc7;
            8'h32: subWord <= 8'h23;
            8'h33: subWord <= 8'hc3;
            8'h34: subWord <= 8'h18;
            8'h35: subWord <= 8'h96;
            8'h36: subWord <= 8'h05;
            8'h37: subWord <= 8'h9a;
            8'h38: subWord <= 8'h07;
            8'h39: subWord <= 8'h12;
            8'h3a: subWord <= 8'h80;
            8'h3b: subWord <= 8'he2;
            8'h3c: subWord <= 8'heb;
            8'h3d: subWord <= 8'h27;
            8'h3e: subWord <= 8'hb2;
            8'h3f: subWord <= 8'h75;
            8'h40: subWord <= 8'h09;
            8'h41: subWord <= 8'h83;
            8'h42: subWord <= 8'h2c;
            8'h43: subWord <= 8'h1a;
            8'h44: subWord <= 8'h1b;
            8'h45: subWord <= 8'h6e;
            8'h46: subWord <= 8'h5a;
            8'h47: subWord <= 8'ha0;
            8'h48: subWord <= 8'h52;
            8'h49: subWord <= 8'h3b;
            8'h4a: subWord <= 8'hd6;
            8'h4b: subWord <= 8'hb3;
            8'h4c: subWord <= 8'h29;
            8'h4d: subWord <= 8'he3;
            8'h4e: subWord <= 8'h2f;
            8'h4f: subWord <= 8'h84;
            8'h50: subWord <= 8'h53;
            8'h51: subWord <= 8'hd1;
            8'h52: subWord <= 8'h00;
            8'h53: subWord <= 8'hed;
            8'h54: subWord <= 8'h20;
            8'h55: subWord <= 8'hfc;
            8'h56: subWord <= 8'hb1;
            8'h57: subWord <= 8'h5b;
            8'h58: subWord <= 8'h6a;
            8'h59: subWord <= 8'hcb;
            8'h5a: subWord <= 8'hbe;
            8'h5b: subWord <= 8'h39;
            8'h5c: subWord <= 8'h4a;
            8'h5d: subWord <= 8'h4c;
            8'h5e: subWord <= 8'h58;
            8'h5f: subWord <= 8'hcf;
            8'h60: subWord <= 8'hd0;
            8'h61: subWord <= 8'hef;
            8'h62: subWord <= 8'haa;
            8'h63: subWord <= 8'hfb;
            8'h64: subWord <= 8'h43;
            8'h65: subWord <= 8'h4d;
            8'h66: subWord <= 8'h33;
            8'h67: subWord <= 8'h85;
            8'h68: subWord <= 8'h45;
            8'h69: subWord <= 8'hf9;
            8'h6a: subWord <= 8'h02;
            8'h6b: subWord <= 8'h7f;
            8'h6c: subWord <= 8'h50;
            8'h6d: subWord <= 8'h3c;
            8'h6e: subWord <= 8'h9f;
            8'h6f: subWord <= 8'ha8;
            8'h70: subWord <= 8'h51;
            8'h71: subWord <= 8'ha3;
            8'h72: subWord <= 8'h40;
            8'h73: subWord <= 8'h8f;
            8'h74: subWord <= 8'h92;
            8'h75: subWord <= 8'h9d;
            8'h76: subWord <= 8'h38;
            8'h77: subWord <= 8'hf5;
            8'h78: subWord <= 8'hbc;
            8'h79: subWord <= 8'hb6;
            8'h7a: subWord <= 8'hda;
            8'h7b: subWord <= 8'h21;
            8'h7c: subWord <= 8'h10;
            8'h7d: subWord <= 8'hff;
            8'h7e: subWord <= 8'hf3;
            8'h7f: subWord <= 8'hd2;
            8'h80: subWord <= 8'hcd;
            8'h81: subWord <= 8'h0c;
            8'h82: subWord <= 8'h13;
            8'h83: subWord <= 8'hec;
            8'h84: subWord <= 8'h5f;
            8'h85: subWord <= 8'h97;
            8'h86: subWord <= 8'h44;
            8'h87: subWord <= 8'h17;
            8'h88: subWord <= 8'hc4;
            8'h89: subWord <= 8'ha7;
            8'h8a: subWord <= 8'h7e;
            8'h8b: subWord <= 8'h3d;
            8'h8c: subWord <= 8'h64;
            8'h8d: subWord <= 8'h5d;
            8'h8e: subWord <= 8'h19;
            8'h8f: subWord <= 8'h73;
            8'h90: subWord <= 8'h60;
            8'h91: subWord <= 8'h81;
            8'h92: subWord <= 8'h4f;
            8'h93: subWord <= 8'hdc;
            8'h94: subWord <= 8'h22;
            8'h95: subWord <= 8'h2a;
            8'h96: subWord <= 8'h90;
            8'h97: subWord <= 8'h88;
            8'h98: subWord <= 8'h46;
            8'h99: subWord <= 8'hee;
            8'h9a: subWord <= 8'hb8;
            8'h9b: subWord <= 8'h14;
            8'h9c: subWord <= 8'hde;
            8'h9d: subWord <= 8'h5e;
            8'h9e: subWord <= 8'h0b;
            8'h9f: subWord <= 8'hdb;
            8'ha0: subWord <= 8'he0;
            8'ha1: subWord <= 8'h32;
            8'ha2: subWord <= 8'h3a;
            8'ha3: subWord <= 8'h0a;
            8'ha4: subWord <= 8'h49;
            8'ha5: subWord <= 8'h06;
            8'ha6: subWord <= 8'h24;
            8'ha7: subWord <= 8'h5c;
            8'ha8: subWord <= 8'hc2;
            8'ha9: subWord <= 8'hd3;
            8'haa: subWord <= 8'hac;
            8'hab: subWord <= 8'h62;
            8'hac: subWord <= 8'h91;
            8'had: subWord <= 8'h95;
            8'hae: subWord <= 8'he4;
            8'haf: subWord <= 8'h79;
            8'hb0: subWord <= 8'he7;
            8'hb1: subWord <= 8'hc8;
            8'hb2: subWord <= 8'h37;
            8'hb3: subWord <= 8'h6d;
            8'hb4: subWord <= 8'h8d;
            8'hb5: subWord <= 8'hd5;
            8'hb6: subWord <= 8'h4e;
            8'hb7: subWord <= 8'ha9;
            8'hb8: subWord <= 8'h6c;
            8'hb9: subWord <= 8'h56;
            8'hba: subWord <= 8'hf4;
            8'hbb: subWord <= 8'hea;
            8'hbc: subWord <= 8'h65;
            8'hbd: subWord <= 8'h7a;
            8'hbe: subWord <= 8'hae;
            8'hbf: subWord <= 8'h08;
            8'hc0: subWord <= 8'hba;
            8'hc1: subWord <= 8'h78;
            8'hc2: subWord <= 8'h25;
            8'hc3: subWord <= 8'h2e;
            8'hc4: subWord <= 8'h1c;
            8'hc5: subWord <= 8'ha6;
            8'hc6: subWord <= 8'hb4;
            8'hc7: subWord <= 8'hc6;
            8'hc8: subWord <= 8'he8;
            8'hc9: subWord <= 8'hdd;
            8'hca: subWord <= 8'h74;
            8'hcb: subWord <= 8'h1f;
            8'hcc: subWord <= 8'h4b;
            8'hcd: subWord <= 8'hbd;
            8'hce: subWord <= 8'h8b;
            8'hcf: subWord <= 8'h8a;
            8'hd0: subWord <= 8'h70;
            8'hd1: subWord <= 8'h3e;
            8'hd2: subWord <= 8'hb5;
            8'hd3: subWord <= 8'h66;
            8'hd4: subWord <= 8'h48;
            8'hd5: subWord <= 8'h03;
            8'hd6: subWord <= 8'hf6;
            8'hd7: subWord <= 8'h0e;
            8'hd8: subWord <= 8'h61;
            8'hd9: subWord <= 8'h35;
            8'hda: subWord <= 8'h57;
            8'hdb: subWord <= 8'hb9;
            8'hdc: subWord <= 8'h86;
            8'hdd: subWord <= 8'hc1;
            8'hde: subWord <= 8'h1d;
            8'hdf: subWord <= 8'h9e;
            8'he0: subWord <= 8'he1;
            8'he1: subWord <= 8'hf8;
            8'he2: subWord <= 8'h98;
            8'he3: subWord <= 8'h11;
            8'he4: subWord <= 8'h69;
            8'he5: subWord <= 8'hd9;
            8'he6: subWord <= 8'h8e;
            8'he7: subWord <= 8'h94;
            8'he8: subWord <= 8'h9b;
            8'he9: subWord <= 8'h1e;
            8'hea: subWord <= 8'h87;
            8'heb: subWord <= 8'he9;
            8'hec: subWord <= 8'hce;
            8'hed: subWord <= 8'h55;
            8'hee: subWord <= 8'h28;
            8'hef: subWord <= 8'hdf;
            8'hf0: subWord <= 8'h8c;
            8'hf1: subWord <= 8'ha1;
            8'hf2: subWord <= 8'h89;
            8'hf3: subWord <= 8'h0d;
            8'hf4: subWord <= 8'hbf;
            8'hf5: subWord <= 8'he6;
            8'hf6: subWord <= 8'h42;
            8'hf7: subWord <= 8'h68;
            8'hf8: subWord <= 8'h41;
            8'hf9: subWord <= 8'h99;
            8'hfa: subWord <= 8'h2d;
            8'hfb: subWord <= 8'h0f;
            8'hfc: subWord <= 8'hb0;
            8'hfd: subWord <= 8'h54;
            8'hfe: subWord <= 8'hbb;
            8'hff: subWord <= 8'h16;
            endcase
        return subWord;

    endfunction

    function [3:0][7:0] rotWord (input [3:0][7:0] word);

        rotWord[0] = word[1];
        rotWord[1] = word[2];
        rotWord[2] = word[3];
        rotWord[3] = word[0];

        return rotWord;

    endfunction

    //function [59:0][3:0][7:0] keyExpansion (input [59:0][3:0][7:0] wordlist, input[6:0][7:0] Rcon);
    function [59:0][3:0][7:0] keyExpansion (input [59:0][3:0][7:0] wordlist, input [7:0][3:0][7:0] aux, input[6:0][7:0] Rcon);

        index = Nk;
        
        wordlist = aux;
       
        /*for(i=0; i<Nk; i=i+1)
        begin
            for(j=0; j<Nb; j=j+1)
            begin
                wordlist[i][j] = aux[i][j];
                $display("%d %d %h", i, j, aux[i][j]);
                $display("%d %d %h", i, j, wordlist[i][j]);
            end
        end*/
        
        //$display("%h", wordlist[0]);
        
        while(index < Nb*(Nr+1))
        begin
            for(i=0; i < Nb; i=i+1)
            begin
                temp[i] = wordlist[index-1][i];
            end

            if((index % Nk) == 0)
            begin
                temp = rotWord(temp);
                temp[0] = subWord(temp[0]) ^ Rcon[(index/Nk)-1];
                temp[1] = subWord(temp[1]);
                temp[2] = subWord(temp[2]);
                temp[3] = subWord(temp[3]);
            end

            else if((Nk > 6) && (index % Nk) == 4)
            begin
                for(i=0; i<Nb; i=i+1)
                begin
                    temp[i] = subWord(temp[i]);
                end
            end     

            for(i=0; i<Nb; i=i+1)
            begin
                wordlist[index][i] = wordlist[index-Nk][i] ^ temp[i];
            end

            index = index+1;

        end
        
        /*
            for(i=0; i<60; i=i+1)
            begin
                $display("%h", wordlist[i]);
                
                //for(j=0; j<Nb; j=j+1)
                //begin
                    //$display("%h", wordlist[i][j]);
                //end
            end
        */

        //$display("%h", wordlist[0]);

        return wordlist;

    endfunction

    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
        begin
            Rcon[0] = 8'h01; Rcon[1] = 8'h02; Rcon[2] = 8'h04; Rcon[3] = 8'h08; 
            Rcon[4] = 8'h10; Rcon[5] = 8'h20; Rcon[6] = 8'h40;
            wordlist = 0;
            temp = 0;
            index = 0;
        end
    end

    /*
        If kg_validKey is included, then undefined values are caught, therefore the keys are generated uncorrectly 
        Bc dataIn is a set of numbers, it is not detected by the always statement, therefore it is not usable. 
    */

    always @(kg_dataIn or kg_validKey)
    begin
        if(index < Nk) //&& kg_validKey)
        begin
            //$display(index);
            for(i=0; i<Nb; i=i+1)
            begin
                aux[index][i] = kg_dataIn[8*i +: 8];
                //$display("%d %h", i, aux[i]);
            end
            index = index + 1;
        end

        else 
        begin
            wordlist = keyExpansion(wordlist, aux, Rcon);                                         // Tried to put wordlist instead of aux, but did not work. 
            index = 0;
            
            //$display("%h", wordlist[0]);
        end
    end

    assign kg_dataOut = wordlist;

endmodule