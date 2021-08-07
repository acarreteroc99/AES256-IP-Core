
#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "obj_dir/Vmod_enc_shifter.h"
#include "obj_dir/Vmod_enc_shifter__Syms.h"


#define MAX_SIM_TIME 10
vluint64_t sim_time = 0;

int main(int argc, char ** argv, char** env){
    Vmod_enc_shifter *dut = new Vmod_enc_shifter;

    // We order Verilator to trace the simulation in order to create a waveform file
    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform_modEnc_shifter.vcd");

    dut->p00 = 00;
    dut->p01 = 01;
    dut->p02 = 02;
    dut->p03 = 03;

    dut->p10 = 10;
    dut->p11 = 11;
    dut->p12 = 12;
    dut->p13 = 13;

    dut->p20 = 20;
    dut->p21 = 21;
    dut->p22 = 22;
    dut->p23 = 23;

    dut->p30 = 30;
    dut->p31 = 31;
    dut->p32 = 32;
    dut->p33 = 33;


    while(sim_time < MAX_SIM_TIME){
        dut->clk ^= 1;
        dut->eval();
        m_trace->dump(sim_time);
        sim_time++;
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}