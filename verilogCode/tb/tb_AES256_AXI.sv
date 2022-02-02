

 /*****************************************************************************************
                                        NOTES
                                        -----

    1) The following expression is used to select the two bits that define whether data goes to 
        slv_reg0, slv_reg1... Both are localparameters defined in lines 107 and 108, meaning that
        bits 2 and 3 are the ones taken into account to select to which register the information 
        is stored. In the picture sent by e-mail, the following numbers appear:
            30 / 011110 / 11 / slv_reg3
            34 / 100010 / 00 / slv_reg0
            20 / 010100 / 01 / slv_reg1
            24 / 011000 / 10 / slv_reg2
        
        Therefore, to store data in slv_reg0, number 34 shall be written in S_AXI_AWADDR, 20 for
        slv_reg1... and so on.
    


 *****************************************************************************************/


`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_AXI();

    parameter integer FIFO_SZ = 10;
    parameter integer C_S_AXI_DATA_WIDTH = 32;
    parameter integer C_S_AXI_ADDR_WIDTH = 4;

    reg  S_AXI_ACLK, S_AXI_ARESETN, S_AXI_AWVALID, S_AXI_WVALID, S_AXI_BREADY, S_AXI_ARVALID, S_AXI_RREADY;
    reg [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR;
    reg [2 : 0] S_AXI_AWPROT;
    reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA;  
    reg [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB;
    reg [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR;
    reg [2 : 0] S_AXI_ARPROT;

    wire  S_AXI_AWREADY;
    wire  S_AXI_WREADY;
    wire [1 : 0] S_AXI_BRESP;
    wire  S_AXI_BVALID;
    wire  S_AXI_ARREADY;
    wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA;
    wire [1 : 0] S_AXI_RRESP;
    wire  S_AXI_RVALID;

    wire ctrl_check, mod_check, data_check, seed_check;

    integer index;

    AES256_device_IP_v2_v1_0 # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) AES256_device_IP_v2_v1_0_inst (
        .s00_axi_aclk(S_AXI_ACLK),
		.s00_axi_aresetn(S_AXI_ARESETN),
		.s00_axi_awaddr(S_AXI_AWADDR),
		.s00_axi_awprot(S_AXI_AWPROT),
		.s00_axi_awvalid(S_AXI_AWVALID),
		.s00_axi_awready(S_AXI_AWREADY),
		.s00_axi_wdata(S_AXI_WDATA),
		.s00_axi_wstrb(S_AXI_WSTRB),
		.s00_axi_wvalid(S_AXI_WVALID),
		.s00_axi_wready(S_AXI_WREADY),
		.s00_axi_bresp(S_AXI_BRESP),
		.s00_axi_bvalid(S_AXI_BVALID),
		.s00_axi_bready(S_AXI_BREADY),
		.s00_axi_araddr(S_AXI_ARADDR),
		.s00_axi_arprot(S_AXI_ARPROT),
		.s00_axi_arvalid(S_AXI_ARVALID),
		.s00_axi_arready(S_AXI_ARREADY),
		.s00_axi_rdata(S_AXI_RDATA),
		.s00_axi_rresp(S_AXI_RRESP),
		.s00_axi_rvalid(S_AXI_RVALID),
		.s00_axi_rready(S_AXI_RREADY),
		 
		.ctrl_check(ctrl_check), 
		.mod_check(mod_check),
		.data_check(data_check),
		.seed_check(seed_check)
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
    *  slv_reg0 -> control register
    *  slv_reg1 -> mod_en
    *  slv_reg2 -> data fifo
    *  slv_reg3 -> seed register
    *
    *  ------------- CONTROL REGISTER STRC --------------
    *
    *  0 - resetn
    *  1 - ctrl_dataIn
    *  2 - ctrl_dataOut
    *  3 - fifos full
    *  4 - 
    *  5 - 
    *
    * ------------- AXI INPUT SIGNALS --------------------
    *
    * S_AXI_ACLK
    * S_AXI_ARESETN
    * S_AXI_AWADDR: write address (issued by master, accepted by slave)
    * S_AXI_AWPROT: sec level of the transaction and whether the transaction is data access or instr access
    * S_AXI_AWVALID: indicates that the master signaling valid write addr and ctrl info (always 1?)
    * S_AXI_WDATA: input data is sent through here
    * S_AXI_WSTRB: indicates which byte lanes hold valid data
    * S_AXI_WVALID: valid data and strobes are available 
    * S_AXI_BREADY: indicates that the master can receive a write response
    * S_AXI_ARADDR: read addr (issued by master, accepted by slave)
    * S_AXI_ARPROT: sec lvl of transaction and whether the transaction is a data access or instr access
    * S_AXI_ARVALID: indicates that channel is signaling valid read addr and ctrl info
    * S_AXI_RREADY: indicates master can accept the read data and response info
    *
    *
    *******************************************************/
   

    always @(posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            index <= 0;
        end

        else
        begin
            if(index < 2220)
            begin
                if(index == 0)
                begin
                    // To be able to write the regs, the following condition must be fulfilled: axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
                    // Therefore:
                    
                    /* 
                    --------- PORTS NOT USED --------
                    S_AXI_AWPROT:
                    S_AXI_ARPROT:
                    S_AXI_ARVALID: 
                    S_AXI_RREADY 
                    --------------------------------------
                    */
    
                    //indicates that the master can receive a write response
                    S_AXI_BREADY <= 1;
                    //read addr (issued by master, accepted by slave)
                    S_AXI_ARADDR <= 1;
                    //indicates master can accept the read data and response info
                    S_AXI_RREADY <= 1;
                    //indicates which byte lanes hold valid data
                    S_AXI_WSTRB <= f;
                    
                    //write address (issued by master, accepted by slave)
                    S_AXI_AWADDR <= 34;                        // ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB
                    //valid data and strobes are available 
                    S_AXI_WVALID <= 1'b1;
                    //indicates that the master signaling valid write addr and ctrl info (always 1?)
                    S_AXI_AWVALID <= 1'b1;
                    //input data is sent through here
                    S_AXI_WDATA <= 0;
                end

                if(index == 1)
                begin
                    // TRASH CYCLE
                end

                if (index == 2)
                begin
                    // TRASH CYCLE
                end

                // ====================================
                // ---------- KEY GENERATOR -----------
                // ====================================

                if(index == 3)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;
                    S_AXI_AWADDR <= 34;                      
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;             
                    S_AXI_WDATA <= 32'h03020100;
                    
                end

                if(index == 4)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 5)
                begin
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                      
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h07060504;
                end

                if(index == 6)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 7)
                begin
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h0b0a0908;
                end

                if(index == 8)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 9)
                begin
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h0f0e0d0c;
                end

                if(index == 10)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 11)
                begin
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h03020100;
                end

                if(index == 12)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 13)
                begin
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h07060504;
                end

                if(index == 14)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 15)
                begin
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h0b0a0908;
                end

                if(index == 16)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                if(index == 17)
                begin
                    
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 30;
                    S_AXI_WDATA <= 32'h0f0e0d0c;
                end

                if(index == 18)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 3;
                    
                end

                // =================================
                // ---------- ENCRYPTION -----------
                // =================================

                if(index == 19)
                begin
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 0;
                    
                end

                if(index == 20)
                begin
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 24;                         
                    S_AXI_WDATA <= 32'h01000000;
                end

                if(index == 21)
                begin
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 0;
                    
                end

                else if(index == 22)
                begin
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 24;                         
                    S_AXI_WDATA <= 32'h02000000;
                end

                if(index == 23)
                begin
                  
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 

                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 0;
                    
                end

                if(index == 24)
                begin
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 24;                         
                    S_AXI_WDATA <= 32'h03000000;
                end

                if(index == 25)
                begin
                    // 34 - slv_reg0 // 20 - slv_reg1 // 24 - slv_reg2 // 30 - slv_reg3 
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    S_AXI_WDATA <= 0;
                    
                end

                else if(index == 26)
                begin
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 24;                         
                    S_AXI_WDATA <= 32'h04000000;
                end

                if(index == 27)
                begin
                    S_AXI_BREADY <= 1;
                    S_AXI_ARADDR <= 1;
                    S_AXI_RREADY <= 1;
                    S_AXI_WSTRB <= f;                     
                    S_AXI_WVALID <= 1'b1;
                    S_AXI_AWVALID <= 1'b1;
                    S_AXI_AWADDR <= 20;                         
                    // Order to start encrypting (bit 1 to 1)
                    S_AXI_WDATA <= 2;                                    
                end

                // ---------- DECRYPTION -----------


            end
        end
    end

endmodule