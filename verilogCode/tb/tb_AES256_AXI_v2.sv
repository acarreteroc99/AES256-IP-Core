

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

// ================================================================================
// Testbench from: https://www.realdigital.org/doc/32101c99686fe25ec47bedd94e76dc96
// ================================================================================


`timescale 1ns/10ps    // time-unit = 1 ns, precision 10 ps

module tb_AES256_AXI_v2();

    parameter integer FIFO_SZ = 10;
    parameter integer C_S00_AXI_DATA_WIDTH = 32;
    parameter integer C_S00_AXI_ADDR_WIDTH = 4;

    //clock and reset_n signals
	reg S_AXI_ACLK =1'b0;
	reg S_AXI_ARESETN = 1'b0;

	
	//Write Address channel (AW)
	reg [31:0] write_addr =32'd0;	//Master write address
	reg [2:0] write_prot = 3'd0;	//type of write(leave at 0)
	reg write_addr_valid = 1'b0;	//master indicating address is valid
	wire write_addr_ready;		//slave ready to receive address

	//Write Data Channel (W)
	reg [31:0] write_data = 32'd0;	//Master write data
	reg [3:0] write_strb = 4'd0;	//Master byte-wise write strobe
	reg write_data_valid = 1'b0;	//Master indicating write data is valid
	wire write_data_ready;		//slave ready to receive data

	//Write Response Channel (WR)
	reg write_resp_ready = 1'b0;	//Master ready to receive write response
	wire [1:0] write_resp;		//slave write response
	wire write_resp_valid;		//slave response valid
	
	//Read Address channel (AR)
	reg [31:0] read_addr = 32'd0;	//Master read address
	reg [2:0] read_prot =3'd0;	//type of read(leave at 0)
	reg read_addr_valid = 1'b0;	//Master indicating address is valid
	wire read_addr_ready;		//slave ready to receive address

	//Read Data Channel (R)
	reg read_data_ready = 1'b0;	//Master indicating ready to receive data
	wire [31:0] read_data;		//slave read data
	wire [1:0] read_resp;		//slave read response
	wire read_data_valid;		//slave indicating data in channel is valid

	//Device output of the IPcore
	//wire [31:0] dataOut; 
  //  wire ctrl_check, mod_check, data_check, seed_check;
	wire [31:0] crtest;
	wire [31:0] modeTest;		
	wire [31:0] dataTest;
		
    integer index;
	
	//Instantiation of AES256 IP Core
	AES256_device_IP_v2_v1_0_S00_AXI # (
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) AES256_device_IP_v2_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(S_AXI_ACLK),
		.S_AXI_ARESETN(S_AXI_ARESETN),
		
		.S_AXI_AWADDR(write_addr),
		.S_AXI_AWPROT(write_prot),
		.S_AXI_AWVALID(write_addr_valid),
		.S_AXI_AWREADY(write_addr_ready),
		
		.S_AXI_WDATA(write_data),
		.S_AXI_WSTRB(write_strb),
		.S_AXI_WVALID(write_data_valid),
		.S_AXI_WREADY(write_data_ready),
		
		.S_AXI_BRESP(write_resp),
		.S_AXI_BVALID(write_resp_valid),
		.S_AXI_BREADY(write_resp_ready),
		
		.S_AXI_ARADDR(read_addr),
		.S_AXI_ARPROT(read_prot),
		.S_AXI_ARVALID(read_addr_valid),
		.S_AXI_ARREADY(read_addr_ready),
		
		.S_AXI_RDATA(read_data),
		.S_AXI_RRESP(read_resp),
		.S_AXI_RVALID(read_data_valid),
		.S_AXI_RREADY(read_data_ready),
		
        .CRTest(crtest),
		.modeTest(modeTest),		
		.data1Test(data1Test)	
	);

    /*
    initial 
    begin
        $dumpfile("wv_AES256_AXI.vcd");
        $dumpvars(0, tb_AES256_AXI);
    end
    */

    //always #10 S_AXI_ACLK = !S_AXI_ACLK;
    always #5 S_AXI_ACLK = !S_AXI_ACLK;

    task enableResetn;
    begin
        @(posedge S_AXI_ACLK)
        #1 S_AXI_ARESETN = 1'b0;
        @(posedge S_AXI_ACLK)
        #1 S_AXI_ARESETN = 1'b1;
    end
    endtask

    task axi_write;
	input [3:0] addr;
	input [31:0] data;
	begin
		#3 write_addr <= addr;	//Put write address on bus
		write_data <= data;	//put write data on bus
		write_addr_valid <= 1'b1;	//indicate address is valid
		write_data_valid <= 1'b1;	//indicate data is valid
		write_resp_ready <= 1'b1;	//indicate ready for a response
		write_strb <= 4'hF;		//writing all 4 bytes

		//wait for one slave ready signal or the other
		wait(write_data_ready || write_addr_ready);
			
		@(posedge S_AXI_ACLK); //one or both signals and a positive edge
		if(write_data_ready&&write_addr_ready)//received both ready signals
		begin
			write_addr_valid<=0;
			write_data_valid<=0;
		end
		else    //wait for the other signal and a positive edge
		begin
			if(write_data_ready)    //case data handshake completed
			begin
				write_data_valid<=0;
				wait(write_addr_ready); //wait for address address ready
			end
            else if(write_addr_ready)   //case address handshake completed
            begin
                write_addr_valid<=0;
                wait(write_data_ready); //wait for data ready
            end 
			@ (posedge S_AXI_ACLK);// complete the second handshake
			write_addr_valid<=0; //make sure both valid signals are deasserted
			write_data_valid<=0;
		end
            
		//both handshakes have occured
		//deassert strobe
		write_strb<=0;

		//wait for valid response
		wait(write_resp_valid);
		
		//both handshake signals and rising edge
		@(posedge S_AXI_ACLK);

		//deassert ready for response
		write_resp_ready<=0;


		//end of write transaction
	end
	endtask;

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
                    axi_write(8'h0, 0);
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

                    axi_write(4'b1100, 32'h03020100);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h03020100;    
                end

                /*
                if(index == 4)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 4)
                begin
                    axi_write(4'b1100, 32'h07060504);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h07060504;
                end

                /*
                if(index == 6)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 5)
                begin
                    axi_write(4'b1100, 32'h0b0a0908);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h0b0a0908;
                end

                /*
                if(index == 8)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 6)
                begin
                    axi_write(4'b1100, 32'h0f0e0d0c);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h0f0e0d0c;
                end

                /*
                if(index == 10)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 7)
                begin
                    axi_write(4'b1100, 32'h03020100);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h03020100;
                end

                /*
                if(index == 12)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 8)
                begin
                    axi_write(4'b1100, 32'h07060504);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h07060504;
                end

                /*
                if(index == 14)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 9)
                begin
                    axi_write(4'b1100, 32'h0b0a0908);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h0b0a0908;
                end

                /*
                if(index == 16)
                begin
                    axi_write(4'b0100, 3);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end
                */

                if(index == 10)
                begin
                    axi_write(4'b1100, 32'h0f0e0d0c);
                    //S_AXI_AWADDR <= 30;
                    //S_AXI_WDATA <= 32'h0f0e0d0c;
                end

                if(index == 11)
                begin
                    axi_write(4'b0000, 4);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 3;
                    
                end

                // =================================
                // ---------- ENCRYPTION -----------
                // =================================
                
                /*
                if(index == 79)
                    axi_write(20, 0);

                if(index == 80)
                    axi_write(4'b1000, 32'h01000000);
     
                if(index == 81)
                    axi_write(20, 0);

                if(index == 82)
                    axi_write(4'b1000, 32'h02000000);

                if(index == 83)
                    axi_write(20, 0);

                if(index == 84)
                    axi_write(4'b1000, 32'h03000000);

                if(index == 85)
                    axi_write(20, 0);

                if(index == 86)
                    axi_write(4'b1000, 32'h04000000);

                // Order to start encrypting (bit 1 to 1)
                if(index == 227)
                    axi_write(4'b0000, 1);                                                        

                // ---------- NEXT ITERATION ---------

                //if(index == 87)
                if(index == 20)
                begin
                    axi_write(20, 0);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 0;
                    
                end

                //if(index == 88)
                if(index == 21)
                begin
                    axi_write(4'b1000, 32'h11111111);
                    //S_AXI_AWADDR <= 24;                         
                    //S_AXI_WDATA <= 32'h01000000;
                end

                //if(index == 89)
                if(index == 22)
                begin
                    axi_write(20, 0);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 0;
                    
                end

                //if(index == 90)
                if(index == 23)
                begin
                    axi_write(4'b1000, 32'h22222222);
                    //S_AXI_AWADDR <= 24;                         
                    //S_AXI_WDATA <= 32'h02000000;
                end

                //if(index == 91)
                if(index == 24)
                begin
                    axi_write(20, 0);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 0;
                    
                end

                //if(index == 92)
                if(index == 25)
                begin
                    axi_write(4'b1000, 32'h33333333);
                    //S_AXI_AWADDR <= 24;                         
                    //S_AXI_WDATA <= 32'h03000000;
                end

                //if(index == 93)
                if(index == 26)
                begin
                    axi_write(20, 0);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 0;
                    
                end

                //if(index == 94)
                if(index == 27)
                begin
                    axi_write(4'b1000, 32'h44444444);
                    //S_AXI_AWADDR <= 24;                         
                    //S_AXI_WDATA <= 32'h04000000;
                end

                if(crtest[0] == 0)
                    $display("Index when first encryption ends is: ", index);

                if(index == 600 && crtest[0] == 0)
                begin
                    // Order to start encrypting (bit 1 to 1)
                    axi_write(4'b0000, 1);
                    //S_AXI_AWADDR <= 20;                         
                    //S_AXI_WDATA <= 2;                                                         
                end
                */
                

                // ---------- DECRYPTION -----------
                // =================================

                if(index == 200)
                    axi_write(4'b1000, 32'hC4AD3A63);

                if(index == 201)
                    axi_write(4'b1000, 32'hD6B3563C);

                if(index == 202)
                    axi_write(4'b1000, 32'hFEBC93EA);

                if(index == 203)
                    axi_write(4'b1000, 32'h7A584D99);

                if(index == 300)
                    // Order to start decrypting (bit 2 to 1)
                    axi_write(4'b0000, 2);

                // ------ NEXT ITERATION ------

                if(index == 210)
                    axi_write(4'b1000, 32'ha7030e31);

                if(index == 211)
                    axi_write(4'b1000, 32'ha47991fe);

                if(index == 212)
                    axi_write(4'b1000, 32'h36d06daa);

                if(index == 213)
                    axi_write(4'b1000, 32'hea7b3002);    

                if(crtest[1] == 0)
                    $display("Index when first encryption ends is: ", index);

                if(index == 600 && crtest[1] == 0)
                    axi_write(4'b0000, 2);                                                      
                                                                   
	       index <= index+1;

            end
        end
    end

endmodule
