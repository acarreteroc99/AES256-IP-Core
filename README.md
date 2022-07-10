# AES256 IP Core
AES256 hardware accelerator tested in a Xilinx ZC-702 board (Zynq-7000 family)

## Abstract

This project aims to complete CNM’s IPs portfolio with the addition of an AES-256 ECB hardware accelerator IP Core, which has been designed according to FIPS 197 specification published by the NIST (National Institute of Standards and Technology) in November 26, 2001. Incorporating this IP into CNM’s portfolio helps the organization’s devices to encrypt and decrypt data in a faster and more efficient manner. Along this work, AES-256 is explained in detail, an RTL implementation has been created and integrated into an AXI based system. To conclude with, the device has been implemented in a Xilinx FPGA to proof it works at a physical level, therefore included in the IP library. 

## Comments

Since the IP Core implements an AXI-Lite wrapper, input data shall be transmitted through the S_AXI_WDATA signal belonging to the AXI-Lite protocol. 

### Inputs

- 2 128-bit keys 
- 1 128-bit input data to be encrypted

## Future improvements

- Switching to CBC algorithm to improve security: for the time being now, the IP Core implements the AES-256 ECB algorithm. However, there are many other AES-256 variations that are more secure although more complex to implement. CBC is a variant that increases security and does not differ much from ECB.
- PUF implementation: to enhance security, a random vector might be used to obfuscate information. This random vector of numbrs can be extracted from a PUF (Physically Unclonable Function) deivce. 
