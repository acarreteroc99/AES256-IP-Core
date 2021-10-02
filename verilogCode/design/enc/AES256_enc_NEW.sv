/**********************************************************************
                            PREGUNTAS DEL CODIGO
    1) Multiplexor inicial: si lo pongo dentro de un always, me dice que no se pueden hacer asignaciones a los wires (lo que 
    yo quiero es "empalmarlos") y si no lo pongo, las condiciones que hay en los if's no las respeta  --> CREO que esta resuelto
    2) En la ROM, la senyal 'done' NUNCA se pone a 0, de ahi que el reg41 no almacene los valores correctamente. Problema: No se 
    por que no entra dentro del if donde se cambia el valor de la variable done. 
    3) Pese a que regCTRL[0] se ponga a 0, el valor no llega al addRK, haciendo que no deje de encriptar en bucle sin parar. 
    
**********************************************************************/

/*
`include "../design/mod_fifo1.sv"
`include "../design/mod_reg4_1to4.sv"
`include "../design/mod_reg16.sv"
`include "../design/mod_reg16_16to1.sv"
`include "../design/mod_reg16_1to16.sv"
`include "../design/mod_regCTRL.sv"
`include "../design/mod_romKey.sv"
`include "../design/mod_mux_2to1.sv"
`include "../design/mod_demuxInit.sv"
`include "../design/enc/mod_enc_rom256.sv"
`include "../design/enc/mod_enc_shifter.sv"
`include "../design/enc/mod_enc_mixColumns.sv"
`include "../design/enc/mod_enc_addRoundKey.sv"
*/


`define AES_ROUNDS      14                              // AES-128 = 10 ;; AES-192 = 12 ;; AES-256 = 14    
`define BUF_WIDTH_FIFO  2                               // BUF_SIZE = 4 -> BUF_WIDTH = 2, no. of bits to be used in pointer
`define BUF_SIZE_FIFO   ( 1 << `BUF_WIDTH_FIFO )

module AES256_enc(
                    clk, resetn, 
                    addr, plaintext, req_axi_in,
                    encData, done
                 );

    
    localparam N = 16;
    localparam Nrows = 4;
    localparam elementsXRow = 4;
    localparam nFlags = 8;
    localparam keyLength = 128;

    //------------ Ports -------------

    input clk, resetn;
              
    input [(elementsXRow*8)-1:0] plaintext;
    input addr;
    input req_axi_in;
    //input [1:0] addr;                                   

    reg [(nFlags-1):0] regCTRL;
    reg [(N-1):0][7:0] encryptedData;

    output reg done;
    output [(N-1):0][7:0] encData;


    integer i;

    //------------ Signal control FSM -----------

    localparam [3:0]
     idle_st = 3'b0000,
     xor_st =  3'b0001,
     reg_xor_st = 3'b0010,
     rom_st = 3'b0011, 
     reg161_st = 3'b100,
     shf_st = 3'b0101,
     mixCol_st = 3'b0110,
     reg162_st = 3'b0111,

     end_round_st = 3'b1000,
     end_st = 3'b1001;

    reg [3:0] aes_st, aes_st_next; 

    reg [3:0] round;
    reg [3:0] fifo_cnt;
    reg [3:0] reg161_cnt;
    reg [1:0] shf_row_cnt;
    reg [1:0] reg162_cnt;
    
    reg wr_xor;
    reg req_fifo;
    reg wr_reg161;
    reg wr_shf;
    

    //------------ reg164 -----------

    wire [(N-1):0][7:0] dataOut_reg416;
    wire reg416_empty;
    wire reg416_full;
    //wire req_axi_in;

    //------------ demux -------------

    wire [(nFlags-1):0] dataOut1_demux;
    wire [(N-1):0][7:0] dataOut2_demux;

    //------------ FIFO -------------
    //wire fifo_wr_en;

    wire fifo_empty;
    wire [7:0] dataOut_fifo;
    //wire [`BUF_WIDTH_FIFO:0] fifo_counter;

    //------------ ROM -------------
    wire [7:0] dataOut_ROM;
    wire OK_ROM;
    wire req_ROM;

    //------------ reg_4to1 ------------
    wire [3:0][7:0] dataOut_reg41;
    wire reg41_full;

    //------------ shifter -------------
    wire [3:0][7:0] dataOut_shifter;
    wire [1:0] row;
    wire OK_shifter;

    //------------ reg16_1 ------------
    wire [(N-1):0][7:0] dataOut_reg16_1;
    wire reg161_full;

    //------------ mixColumns ------------
    wire OK_mC;
    wire [(N-1):0][7:0] dataOut_mixColumns;
    wire req_mixColumns;
    wire reg162_reseted;
    wire mC_reseted;

    //------------ reg16_2 ------------
    wire [(N-1):0][7:0] dataOut_reg16_2;
    wire reg162_full;

    //------------ mux -------------

    //------------ addRoundKey -------------
    wire OK_inKey;
    wire [(N-1):0][7:0] dataIn_addRK;
    wire [(N-1):0][7:0] dataOut_addRK;
    //reg [(N-1):0][7:0] auxAddRK;

    //------------ reg16_3 ------------
    wire [7:0] dataOut_reg163;
    wire reg163_empty;

    //------------ ROM_Key -------------
    wire [(keyLength-1):0] key;
    wire OK_romKey;
    
    always @(posedge clk or negedge resetn)                             // Round addition
    begin
        if(!resetn)
        begin
            round = 0;
        end

        else
        begin
            if(aes_st == end_round_st)
                round = round + 1;
            else if (aes_st == idle_st)
                round = 0;

        end
    end

    always @(posedge clk or negedge resetn)                             // Controling whether input goes to regCTRL or not
    begin
        if(!resetn)
        begin
            regCTRL <= 8'h0;
        end
        else
        begin
            if(addr == 0 && req_axi_in == 1)
            begin
                regCTRL <= plaintext;
            end
            else if(done == 1)
            begin
                regCTRL <= 0;
            end
        end
    end 

    always @(posedge clk or negedge resetn)                             // Controling current state (aes_st)
    begin
        if(!resetn)
            aes_st = idle_st;

        else
            aes_st = aes_st_next;
    end 

    always @(posedge clk or negedge resetn)                             // Reg_xor_st state control 
    begin
        if(!resetn)
        begin
            wr_xor = 1'b0;
            req_fifo = 1'b0;
        end

        else
        begin
            if(aes_st == reg_xor_st)
                wr_xor = 1'b1;
            else
                wr_xor = 1'b0; 

            if(aes_st == rom_st)
                req_fifo = 1'b1;
            else
                req_fifo = 1'b0;
        end
    end

    always @(posedge clk or negedge resetn)                             // rom_st state control
    begin
        if(!resetn)
            fifo_cnt = 0;

        else
        begin
            if(aes_st == rom_st)
                fifo_cnt = fifo_cnt + 1; 
            else
                fifo_cnt = 0;
        end
    end 

    always @(posedge clk or negedge resetn)                             // reg161_st signal control
    begin
        if(!resetn)
            reg161_cnt = 0;

        else
        begin
            if(aes_st == reg161_st)
                reg161_cnt = reg161_cnt + 1;
            else
                reg161_cnt = 0;
        end
    end

    /*
    always @(posedge clk or negedge resetn)                             // Shifter signal control
    begin
        if(!resetn)
            shf_row_cnt = 0;
        else
        begin
            if(reg161_cnt == (N-1))
            begin
                if(shf_row_cnt == (Nrows-1))
                    shf_row_cnt = 0;
                else
                    shf_row_cnt = shf_row_cnt + 1;
            end
        end
    end
    */
    
    

    always @(regCTRL, aes_st, fifo_cnt)                                 // FSM (Finite State Machine)
    begin
        aes_st_next = aes_st;

        case(aes_st)
            idle_st: 
                begin
                    if(regCTRL[0] == 1)
                    begin
                        aes_st_next = xor_st;
                    end
                end 
            xor_st:
                begin
                    aes_st_next = reg_xor_st;
                end
            reg_xor_st:
                begin
                    aes_st_next = rom_st;
                end
            rom_st:
                begin
                    if(fifo_cnt == N-1)
                        aes_st_next = reg161_st;
                end
            reg161_st:
                begin
                    if(reg161_st == (Nrows-1))
                        aes_st_next = end_st;
                end
            
            /*
            reg41_st:
                begin
                    if(reg41_round_cnt == (N/Nrows)-1)
                        aes_st_next = shf_st;
                        //aes_st_next = end_st;
                    //if(reg41_cnt == (Nrows-1))
                        //aes_st_next = ;
                end
            shf_st:
                begin
                    if(shf_row_cnt == (Nrows-1))
                        aes_st_next = end_st; 
                end
            */
        endcase
    end

    // ===================  CONTROL REGISTER  ========================
    mod_demuxInit demux (
                        .addr(addr), 
                        .inp(plaintext), 
                        .outp0(dataOut1_demux), .outp1(dataOut2_demux)
                        );


    // ===================  DATA ENCRYPTER  ========================

    // Store 1 element in FIFO
    /*
    mod_fifo1 fifo(
                    .clk(clk), .resetn(resetn), 
                    .inp(dataOut_reg163), .rd_ROM(OK_ROM), .reg16_empty(reg163_empty),
                    .outp(dataOut_fifo), .empty(fifo_empty)
                    );
    */
    // Substitution through ROM module
    mod_enc_rom256 rom_Sbox( 
                            .clk(clk), .resetn(resetn),                                 //.reg_full(reg41_full), .fifo_empty(fifo_empty),
                            .addr(dataOut_reg163),
                            .data(dataOut_ROM)                                          //, .done(OK_ROM), .wr_req(req_ROM)
                           );


    // 4-byte reg storing 1 row
    /*
    mod_reg4_1to4 reg4_1(
                        .clk(clk), .resetn(resetn),                                     //.rd_en(reg161_full),         //rd_en should ideally be "reg161_full"
                        .i(dataOut_ROM), .wr_en(wr_reg41),
                        .o(dataOut_reg41), .reg_full(reg41_full)
                        );
    */

    mod_enc_reg16_1to16 reg16_1(
                                    .clk(clk), .resetn(resetn),
                                    .i(dataOut_ROM), .wr_en(wr_reg161), 
                                    .o(dataOut_reg161)
                               );

    // Shifting 1 row     
    mod_enc_shifter shifter(
                            .clk(clk), .resetn(resetn),                                 //.wr_en(reg161_full), .reg41_full(reg41_full),
                            .inp(dataOut_reg41), .row(shf_row_cnt), .wr_en(wr_shf),
                            .outp(dataOut_shifter)                                      //, .done(OK_shifter)
                            );
                            
    // 16-byte reg storing the whole matrix
    /*
    mod_reg16_4to16 reg16_1(
                            .clk(clk), .resetn(resetn), .rd_en(OK_mC), .wr_en(OK_shifter), .mC_reseted(mC_reseted),   //wr_en should ideally be "reg41_full"
                            .i(dataOut_shifter), 
                            .o(dataOut_reg16_1), .reg_full(reg161_full)
                            );
    */

    // Mixing all columns w/ polynomial matrix
    mod_enc_mixColumns mixColumns(
                                .clk(clk), .enable(reg162_full), .reset(resetn), .reg161_status(reg161_full), .reg162_reseted(reg162_reseted),
                                .state(dataOut_reg16_1), 
                                .state_out(dataOut_mixColumns), .done(OK_mC), .mC_reseted(mC_reseted)
                                );

    // 16-byte reg storing entire matrix
    mod_reg16 reg16_2(
                    .clk(clk), .resetn(resetn), .wr_en(OK_mC), .rd_en(wr_xor),
                    .i(dataOut_mixColumns), 
                    .o(dataOut_reg16_2), .reg_full(reg162_full), .reg_reseted(reg162_reseted)
                    );

    
    mod_reg16_4to16_INIT reg416_INIT(
                                    .clk(clk), .resetn(resetn),
                                    .i(dataOut2_demux), .req_axi_in(req_axi_in), .rd_en(1),
                                    .o(dataOut_reg416), .reg_empty(reg416_empty), .reg_full(reg416_full)
                                    );
    
    mod_mux_2to1 mux(
                    .addr(round),
                    .inp0(dataOut_reg416), .inp1(dataOut_reg16_2), 
                    .outp(dataIn_addRK)
                    );

    // 16 XOR modules for date-key addition
    mod_enc_addRoundKey addRK(
                             .clk(clk), .resetn(resetn),     
                             .p(dataIn_addRK), .k(key),      
                             .o(dataOut_addRK)              
                             );


    // Extracting corresponding key (column) from     
    mod_romKey  rom_key(                                
                        .clk(clk), .resetn(resetn),         
                        .selectKey(round),                  
                        .data(key)                          
                       );

    mod_reg16_16to1 reg16_3(
                            .clk(clk), .resetn(resetn),
                            .i(dataOut_addRK), .wr_en(wr_xor), .req_fifo(req_fifo),
                            .o(dataOut_reg163), .reg_empty(reg163_empty)                       
                           );
    

    assign encData = encryptedData;

endmodule

// ===================================================================================================

// =================  CONTROL FLOW ELEMENTS  =====================

    /*
    always @*
    begin
        case(addr)
            0:
            begin
                flags = plaintext[(nFlags-1):0];
            end
            1:
            begin
                if(round == 0)
                begin
                    for(i=0; i < N; i=i+1)
                        auxAddRK[i] = plaintext[8*i +: 8];
                    
                   dataIn_addRK = auxAddRK;
                end
                else
                    dataIn_addRK = dataOut_reg16_2;
                if(round == `AES_ROUNDS)                                                  // If all round have been completed, encrypted data goes to the AXI bus. 
                    encData = dataOut_addRK;
            end
        endcase
        if(currFlags[0])
            assign enEncryption = curFlags[0];
                                          
    end
    */ 