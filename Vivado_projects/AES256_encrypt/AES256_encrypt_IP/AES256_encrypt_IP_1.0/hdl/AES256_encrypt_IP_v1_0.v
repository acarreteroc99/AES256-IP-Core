
`timescale 1 ns / 1 ps

	module AES256_encrypt_IP_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface IO_AXI
		parameter integer C_IO_AXI_DATA_WIDTH	= 32,
		parameter integer C_IO_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface IO_AXI
		input wire  io_axi_aclk,
		input wire  io_axi_aresetn,
		input wire [C_IO_AXI_ADDR_WIDTH-1 : 0] io_axi_awaddr,
		input wire [2 : 0] io_axi_awprot,
		input wire  io_axi_awvalid,
		output wire  io_axi_awready,
		input wire [C_IO_AXI_DATA_WIDTH-1 : 0] io_axi_wdata,
		input wire [(C_IO_AXI_DATA_WIDTH/8)-1 : 0] io_axi_wstrb,
		input wire  io_axi_wvalid,
		output wire  io_axi_wready,
		output wire [1 : 0] io_axi_bresp,
		output wire  io_axi_bvalid,
		input wire  io_axi_bready,
		input wire [C_IO_AXI_ADDR_WIDTH-1 : 0] io_axi_araddr,
		input wire [2 : 0] io_axi_arprot,
		input wire  io_axi_arvalid,
		output wire  io_axi_arready,
		output wire [C_IO_AXI_DATA_WIDTH-1 : 0] io_axi_rdata,
		output wire [1 : 0] io_axi_rresp,
		output wire  io_axi_rvalid,
		input wire  io_axi_rready
	);
// Instantiation of Axi Bus Interface IO_AXI
	AES256_encrypt_IP_v1_0_IO_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_IO_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_IO_AXI_ADDR_WIDTH)
	) AES256_encrypt_IP_v1_0_IO_AXI_inst (
		.S_AXI_ACLK(io_axi_aclk),
		.S_AXI_ARESETN(io_axi_aresetn),
		.S_AXI_AWADDR(io_axi_awaddr),
		.S_AXI_AWPROT(io_axi_awprot),
		.S_AXI_AWVALID(io_axi_awvalid),
		.S_AXI_AWREADY(io_axi_awready),
		.S_AXI_WDATA(io_axi_wdata),
		.S_AXI_WSTRB(io_axi_wstrb),
		.S_AXI_WVALID(io_axi_wvalid),
		.S_AXI_WREADY(io_axi_wready),
		.S_AXI_BRESP(io_axi_bresp),
		.S_AXI_BVALID(io_axi_bvalid),
		.S_AXI_BREADY(io_axi_bready),
		.S_AXI_ARADDR(io_axi_araddr),
		.S_AXI_ARPROT(io_axi_arprot),
		.S_AXI_ARVALID(io_axi_arvalid),
		.S_AXI_ARREADY(io_axi_arready),
		.S_AXI_RDATA(io_axi_rdata),
		.S_AXI_RRESP(io_axi_rresp),
		.S_AXI_RVALID(io_axi_rvalid),
		.S_AXI_RREADY(io_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
