// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vmod_keygen_shifter__Syms.h"


//======================

void Vmod_keygen_shifter::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vmod_keygen_shifter* t = (Vmod_keygen_shifter*)userthis;
    Vmod_keygen_shifter__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void Vmod_keygen_shifter::traceChgThis(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vmod_keygen_shifter::traceChgThis__2(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1,(vlTOPp->clk));
        vcdp->chgBus(c+9,(vlTOPp->p00),8);
        vcdp->chgBus(c+17,(vlTOPp->p01),8);
        vcdp->chgBus(c+25,(vlTOPp->p02),8);
        vcdp->chgBus(c+33,(vlTOPp->p03),8);
        vcdp->chgBus(c+41,(vlTOPp->o00),8);
        vcdp->chgBus(c+49,(vlTOPp->o01),8);
        vcdp->chgBus(c+57,(vlTOPp->o02),8);
        vcdp->chgBus(c+65,(vlTOPp->o03),8);
    }
}
