
`timescale 1 ns / 1 ps

	module AES256_Encrypt_AXI_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface Input_AXI
		parameter integer C_Input_AXI_DATA_WIDTH	= 32,
		parameter integer C_Input_AXI_ADDR_WIDTH	= 4,

		// Parameters of Axi Slave Bus Interface Ouput_AXI
		parameter integer C_Ouput_AXI_DATA_WIDTH	= 32,
		parameter integer C_Ouput_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface Input_AXI
		input wire  input_axi_aclk,
		input wire  input_axi_aresetn,
		input wire [C_Input_AXI_ADDR_WIDTH-1 : 0] input_axi_awaddr,
		input wire [2 : 0] input_axi_awprot,
		input wire  input_axi_awvalid,
		output wire  input_axi_awready,
		input wire [C_Input_AXI_DATA_WIDTH-1 : 0] input_axi_wdata,
		input wire [(C_Input_AXI_DATA_WIDTH/8)-1 : 0] input_axi_wstrb,
		input wire  input_axi_wvalid,
		output wire  input_axi_wready,
		output wire [1 : 0] input_axi_bresp,
		output wire  input_axi_bvalid,
		input wire  input_axi_bready,
		input wire [C_Input_AXI_ADDR_WIDTH-1 : 0] input_axi_araddr,
		input wire [2 : 0] input_axi_arprot,
		input wire  input_axi_arvalid,
		output wire  input_axi_arready,
		output wire [C_Input_AXI_DATA_WIDTH-1 : 0] input_axi_rdata,
		output wire [1 : 0] input_axi_rresp,
		output wire  input_axi_rvalid,
		input wire  input_axi_rready,

		// Ports of Axi Slave Bus Interface Ouput_AXI
		input wire  ouput_axi_aclk,
		input wire  ouput_axi_aresetn,
		input wire [C_Ouput_AXI_ADDR_WIDTH-1 : 0] ouput_axi_awaddr,
		input wire [2 : 0] ouput_axi_awprot,
		input wire  ouput_axi_awvalid,
		output wire  ouput_axi_awready,
		input wire [C_Ouput_AXI_DATA_WIDTH-1 : 0] ouput_axi_wdata,
		input wire [(C_Ouput_AXI_DATA_WIDTH/8)-1 : 0] ouput_axi_wstrb,
		input wire  ouput_axi_wvalid,
		output wire  ouput_axi_wready,
		output wire [1 : 0] ouput_axi_bresp,
		output wire  ouput_axi_bvalid,
		input wire  ouput_axi_bready,
		input wire [C_Ouput_AXI_ADDR_WIDTH-1 : 0] ouput_axi_araddr,
		input wire [2 : 0] ouput_axi_arprot,
		input wire  ouput_axi_arvalid,
		output wire  ouput_axi_arready,
		output wire [C_Ouput_AXI_DATA_WIDTH-1 : 0] ouput_axi_rdata,
		output wire [1 : 0] ouput_axi_rresp,
		output wire  ouput_axi_rvalid,
		input wire  ouput_axi_rready
	);
// Instantiation of Axi Bus Interface Input_AXI
	AES256_Encrypt_AXI_v1_0_Input_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_Input_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_Input_AXI_ADDR_WIDTH)
	) AES256_Encrypt_AXI_v1_0_Input_AXI_inst (
		.S_AXI_ACLK(input_axi_aclk),
		.S_AXI_ARESETN(input_axi_aresetn),
		.S_AXI_AWADDR(input_axi_awaddr),
		.S_AXI_AWPROT(input_axi_awprot),
		.S_AXI_AWVALID(input_axi_awvalid),
		.S_AXI_AWREADY(input_axi_awready),
		.S_AXI_WDATA(input_axi_wdata),
		.S_AXI_WSTRB(input_axi_wstrb),
		.S_AXI_WVALID(input_axi_wvalid),
		.S_AXI_WREADY(input_axi_wready),
		.S_AXI_BRESP(input_axi_bresp),
		.S_AXI_BVALID(input_axi_bvalid),
		.S_AXI_BREADY(input_axi_bready),
		.S_AXI_ARADDR(input_axi_araddr),
		.S_AXI_ARPROT(input_axi_arprot),
		.S_AXI_ARVALID(input_axi_arvalid),
		.S_AXI_ARREADY(input_axi_arready),
		.S_AXI_RDATA(input_axi_rdata),
		.S_AXI_RRESP(input_axi_rresp),
		.S_AXI_RVALID(input_axi_rvalid),
		.S_AXI_RREADY(input_axi_rready)
	);

// Instantiation of Axi Bus Interface Ouput_AXI
	AES256_Encrypt_AXI_v1_0_Ouput_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_Ouput_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_Ouput_AXI_ADDR_WIDTH)
	) AES256_Encrypt_AXI_v1_0_Ouput_AXI_inst (
		.S_AXI_ACLK(ouput_axi_aclk),
		.S_AXI_ARESETN(ouput_axi_aresetn),
		.S_AXI_AWADDR(ouput_axi_awaddr),
		.S_AXI_AWPROT(ouput_axi_awprot),
		.S_AXI_AWVALID(ouput_axi_awvalid),
		.S_AXI_AWREADY(ouput_axi_awready),
		.S_AXI_WDATA(ouput_axi_wdata),
		.S_AXI_WSTRB(ouput_axi_wstrb),
		.S_AXI_WVALID(ouput_axi_wvalid),
		.S_AXI_WREADY(ouput_axi_wready),
		.S_AXI_BRESP(ouput_axi_bresp),
		.S_AXI_BVALID(ouput_axi_bvalid),
		.S_AXI_BREADY(ouput_axi_bready),
		.S_AXI_ARADDR(ouput_axi_araddr),
		.S_AXI_ARPROT(ouput_axi_arprot),
		.S_AXI_ARVALID(ouput_axi_arvalid),
		.S_AXI_ARREADY(ouput_axi_arready),
		.S_AXI_RDATA(ouput_axi_rdata),
		.S_AXI_RRESP(ouput_axi_rresp),
		.S_AXI_RVALID(ouput_axi_rvalid),
		.S_AXI_RREADY(ouput_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
