# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/adrian/Desktop/AES256-HW-Accelerator/Vitis_projects/AES256_system3/hw_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/adrian/Desktop/AES256-HW-Accelerator/Vitis_projects/AES256_system3/hw_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {hw_platform}\
-hw {/home/adrian/Desktop/AES256-HW-Accelerator/Vivado_projects/AES256_system3/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/adrian/Desktop/AES256-HW-Accelerator/Vitis_projects/AES256_system3}

platform write
platform generate -domains 
platform active {hw_platform}
platform generate
platform active {hw_platform}
platform generate -domains 
platform active {hw_platform}
platform generate -domains 
platform active {hw_platform}
platform active {hw_platform}
platform generate
platform active {hw_platform}
platform generate -domains 
platform generate
