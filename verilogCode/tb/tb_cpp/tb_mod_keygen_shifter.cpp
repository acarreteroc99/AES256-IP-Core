
#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "obj_dir/Vmod_keygen_shifter.h"
#include "obj_dir/Vmod_keygen_shifter__Syms.h"


#define MAX_SIM_TIME 10
vluint64_t sim_time = 0;

int main(int argc, char ** argv, char** env){
    Vmod_keygen_shifter *dut = new Vmod_keygen_shifter;

    // We order Verilator to trace the simulation in order to create a waveform file
    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform_modKeygen_shifter.vcd");

    dut->p00 = 00;
    dut->p01 = 01;
    dut->p02 = 02;
    dut->p03 = 03;


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