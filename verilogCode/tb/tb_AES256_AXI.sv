//`include "../design/AES256_device_FSM_AXI.sv"

`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_AXI();

    reg S_AXI_ACLK, S_AXI_ARESETN;
    reg [31:0] slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9;

    integer index;

    AES256_AXI DUT( 
                    .S_AXI_ACLK(S_AXI_ACLK), .S_AXI_ARESETN(S_AXI_ARESETN), 
                    .slv_reg0(slv_reg0), .slv_reg1(slv_reg1), .slv_reg2(slv_reg2), .slv_reg3(slv_reg3), .slv_reg4(slv_reg4), 
                    .slv_reg5(slv_reg5), .slv_reg6(slv_reg6), .slv_reg7(slv_reg7), .slv_reg8(slv_reg8), .slv_reg9(slv_reg9)
                  );

    always #10 S_AXI_ACLK = !S_AXI_ACLK;
    
    initial 
    begin
        $dumpfile("wv_AES256_AXI.vcd");
        $dumpvars(0, tb_AES256_AXI);
    end

    task enableResetn;
    begin
        @(posedge S_AXI_ACLK)
        #1 S_AXI_ARESETN = 1'b0;
        @(posedge S_AXI_ACLK)
        #1 S_AXI_ARESETN = 1'b1;
    end
    endtask

    initial 
    begin
        S_AXI_ACLK = 1'b0;
        enableResetn;
    end

    /******************************************************
    *  ------------ REGISTER DISTRIBUTION --------------
    *
    *  slv0_reg -> control register
    *  slv1_reg -> mod_en
    *  slv_reg2 - slv_reg5 -> data fifo
    *  slv_reg6 - slv_reg9 -> seed register
    *
    *
    *  ------------- CONTROL REGISTER STRC --------------
    *
    *  0 - resetn
    *  1 - ctrl_dataIn
    *  2 - ctrl_dataOut
    *  3 - fifos full
    *  4 - 
    *  5 - 
    *******************************************************/

    
    always @(posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            index <= 0;
            slv_reg0 <= 0;
        end
        
        else
        begin
            if(index < 22200)
            begin
                // ------- ENCRYPTION  -------
                if(index == 0)
                begin
                    // TRASH CYCLES
                    slv_reg0 <= 0;               
                end

                else if(index == 1)
                begin
                    // TRASH CYCLES
                    slv_reg0 <= 0;      
                end
                
                else if(index == 2)
                begin
                    // TRASH CYCLES
                    slv_reg0 <= 0;      
                end

                if(index == 3)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 2;                                                  // 2 == 10 == keygen mod
                    
                    slv_reg6 <= 32'h03020100;
                    slv_reg7 <= 32'h07060504;
                    slv_reg8 <= 32'h0b0a0908;
                    slv_reg9 <= 32'h0f0e0d0c;
                    //inp_device <= 128'h0f0e0d0c0b0a09080706050403020100;
                    //inp_device <= 128'hffeeddccbbaa99887766554433221100;
                end

                else if(index == 4)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 2;                                                  // 2 == 10 == keygen mod

                    slv_reg6 <= 32'h03020100;
                    slv_reg7 <= 32'h07060504;
                    slv_reg8 <= 32'h0b0a0908;
                    slv_reg9 <= 32'h0f0e0d0c;

                    /*
                    slv_reg6 <= 32'h33221100;
                    slv_reg7 <= 32'h77665544;
                    slv_reg8 <= 32'hbbaa9988;
                    slv_reg9 <= 32'hffeeddcc;
                    */

                    //inp_device <= 128'h0f0e0d0c0b0a09080706050403020100;
                    //inp_device <= 128'hffeeddccbbaa99887766554433221100;
                end


                // ------- ENCRYPTION  -------

                /*
                else if(index == 5)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 0;                                                  // 0 == enc mod

                    slv_reg2 <= 32'h01000000;
                    slv_reg3 <= 32'h02000000;
                    slv_reg4 <= 32'h03000000;
                    slv_reg5 <= 32'h04000000;
                    //inp_device <= 128'h04000000030000000200000001000000;
                    //inp_device <= 128'h44444444333333332222222211111111;
                end

                
                else if(index == 6)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 0;                                                  // 0 == enc mod

                    slv_reg2 <= 32'h11111111;
                    slv_reg3 <= 32'h22222222;
                    slv_reg4 <= 32'h33333333;
                    slv_reg5 <= 32'h44444444;
                    //inp_device <= 128'h04000000030000000200000001000000;
                    //inp_device <= 128'h44444444333333332222222211111111;
                end

                else if(index == 7)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 0;                                                  // 0 == enc mod

                    slv_reg2 <= 32'h01000000;
                    slv_reg3 <= 32'h02000000;
                    slv_reg4 <= 32'h03000000;
                    slv_reg5 <= 32'h04000000;
                    //inp_device <= 128'h04000000030000000200000001000000;
                    //inp_device <= 128'hffffffffeeeeeeeeddddddddcccccccc;
                    //inp_device <= 128'h44444444333333332222222211111111;
                end
                
                else if(index == 8)
                begin
                    slv_reg0 <= 0;                                                  // reset not active
                end
                */
                
                
                // ------- DECRYPTION  -------

                /*
                else if(index == 5)
                begin
                    slv_reg0 <= 0;                                                  // reset not active
                end

                else if(index == 20)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 1;                                                  // 0 == dec mod

                    slv_reg2 <= 32'hc4ad3a63;
                    slv_reg3 <= 32'hd6b3563c;
                    slv_reg4 <= 32'hfebc93ea;
                    slv_reg5 <= 32'h7a584d99;
                end

                else if(index == 21)
                begin
                    slv_reg0 <= 0;                                                  // reset not active
                end

                else if(index == 24)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 1;                                                  // 0 == dec mod

                    slv_reg2 <= 32'ha7030e31;
                    slv_reg3 <= 32'ha47991fe;
                    slv_reg4 <= 32'h36d06daa;
                    slv_reg5 <= 32'hea7b3002;
                end

                else if(index == 25)
                begin
                    slv_reg0 <= 0;                                                  // reset not active
                end

                else if(index == 28)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 1;                                                  // 0 == dec mod

                    slv_reg2 <= 32'hc4ad3a63;
                    slv_reg3 <= 32'hd6b3563c;
                    slv_reg4 <= 32'hfebc93ea;
                    slv_reg5 <= 32'h7a584d99;
                end
                
                else if(index == 29)
                begin
                    slv_reg0 <= 0;                                                  // reset not active
                end
                */

                // ------- RESET  -------

                /*
                else if(index == 32'h000004ad)
                begin
                    slv_reg0 <= 1;
                end

                else if(index == 32'h000004af)
                begin
                    slv_reg0 <= 0;
                end

                else if(index == 32'h000004b0)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 2;                                                  // 2 == 10 == keygen mod
                    
                    slv_reg6 <= 32'h03020100;
                    slv_reg7 <= 32'h07060504;
                    slv_reg8 <= 32'h0b0a0908;
                    slv_reg9 <= 32'h0f0e0d0c;
                end

                else if(index == 32'h000004b1)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 2;                                                  // 2 == 10 == keygen mod
                    
                    slv_reg6 <= 32'h03020100;
                    slv_reg7 <= 32'h07060504;
                    slv_reg8 <= 32'h0b0a0908;
                    slv_reg9 <= 32'h0f0e0d0c;
                end

                else if(index == 32'h000004b2)
                begin
                    slv_reg0 <= 2;                                                  // 2 == 10 == ctrl_dataIn
                    slv_reg1 <= 0;                                                  // 0 == enc mod

                    slv_reg2 <= 32'h11111111;
                    slv_reg3 <= 32'h22222222;
                    slv_reg4 <= 32'h33333333;
                    slv_reg5 <= 32'h44444444;
                    //inp_device <= 128'h04000000030000000200000001000000;
                    //inp_device <= 128'h44444444333333332222222211111111;
                end

                else if(index == 32'h000004b3)
                begin
                    slv_reg0 <= 0;
                end
                */

                index=index+1;

            end
        end
    end

endmodule