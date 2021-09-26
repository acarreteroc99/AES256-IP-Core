

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "AES256_Encrypt_AXI" "NUM_INSTANCES" "DEVICE_ID"  "C_Input_AXI_BASEADDR" "C_Input_AXI_HIGHADDR" "C_Ouput_AXI_BASEADDR" "C_Ouput_AXI_HIGHADDR"
}
