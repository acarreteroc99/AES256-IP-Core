// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vmod_keygen_shifter__Syms.h"


//======================

void Vmod_keygen_shifter::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&Vmod_keygen_shifter::traceInit, &Vmod_keygen_shifter::traceFull, &Vmod_keygen_shifter::traceChg, this);
}
void Vmod_keygen_shifter::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vmod_keygen_shifter* t = (Vmod_keygen_shifter*)userthis;
    Vmod_keygen_shifter__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vmod_keygen_shifter::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vmod_keygen_shifter* t = (Vmod_keygen_shifter*)userthis;
    Vmod_keygen_shifter__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void Vmod_keygen_shifter::traceInitThis(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vmod_keygen_shifter::traceFullThis(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vmod_keygen_shifter::traceInitThis__1(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+1,"clk", false,-1);
        vcdp->declBus(c+9,"p00", false,-1, 7,0);
        vcdp->declBus(c+17,"p01", false,-1, 7,0);
        vcdp->declBus(c+25,"p02", false,-1, 7,0);
        vcdp->declBus(c+33,"p03", false,-1, 7,0);
        vcdp->declBus(c+41,"o00", false,-1, 7,0);
        vcdp->declBus(c+49,"o01", false,-1, 7,0);
        vcdp->declBus(c+57,"o02", false,-1, 7,0);
        vcdp->declBus(c+65,"o03", false,-1, 7,0);
        vcdp->declBit(c+1,"mod_keygen_shifter clk", false,-1);
        vcdp->declBus(c+9,"mod_keygen_shifter p00", false,-1, 7,0);
        vcdp->declBus(c+17,"mod_keygen_shifter p01", false,-1, 7,0);
        vcdp->declBus(c+25,"mod_keygen_shifter p02", false,-1, 7,0);
        vcdp->declBus(c+33,"mod_keygen_shifter p03", false,-1, 7,0);
        vcdp->declBus(c+41,"mod_keygen_shifter o00", false,-1, 7,0);
        vcdp->declBus(c+49,"mod_keygen_shifter o01", false,-1, 7,0);
        vcdp->declBus(c+57,"mod_keygen_shifter o02", false,-1, 7,0);
        vcdp->declBus(c+65,"mod_keygen_shifter o03", false,-1, 7,0);
    }
}

void Vmod_keygen_shifter::traceFullThis__1(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBit(c+1,(vlTOPp->clk));
        vcdp->fullBus(c+9,(vlTOPp->p00),8);
        vcdp->fullBus(c+17,(vlTOPp->p01),8);
        vcdp->fullBus(c+25,(vlTOPp->p02),8);
        vcdp->fullBus(c+33,(vlTOPp->p03),8);
        vcdp->fullBus(c+41,(vlTOPp->o00),8);
        vcdp->fullBus(c+49,(vlTOPp->o01),8);
        vcdp->fullBus(c+57,(vlTOPp->o02),8);
        vcdp->fullBus(c+65,(vlTOPp->o03),8);
    }
}
