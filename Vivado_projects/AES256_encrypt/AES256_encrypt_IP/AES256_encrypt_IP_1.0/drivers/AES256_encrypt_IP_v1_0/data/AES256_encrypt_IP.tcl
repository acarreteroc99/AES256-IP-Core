

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "AES256_encrypt_IP" "NUM_INSTANCES" "DEVICE_ID"  "C_IO_AXI_BASEADDR" "C_IO_AXI_HIGHADDR"
}
