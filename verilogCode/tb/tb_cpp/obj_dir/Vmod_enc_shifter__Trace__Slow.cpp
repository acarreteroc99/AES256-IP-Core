// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vmod_enc_shifter__Syms.h"


//======================

void Vmod_enc_shifter::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&Vmod_enc_shifter::traceInit, &Vmod_enc_shifter::traceFull, &Vmod_enc_shifter::traceChg, this);
}
void Vmod_enc_shifter::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vmod_enc_shifter* t = (Vmod_enc_shifter*)userthis;
    Vmod_enc_shifter__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vmod_enc_shifter::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vmod_enc_shifter* t = (Vmod_enc_shifter*)userthis;
    Vmod_enc_shifter__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void Vmod_enc_shifter::traceInitThis(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vmod_enc_shifter::traceFullThis(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vmod_enc_shifter::traceInitThis__1(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+1,"clk", false,-1);
        vcdp->declBus(c+9,"p00", false,-1, 7,0);
        vcdp->declBus(c+17,"p01", false,-1, 7,0);
        vcdp->declBus(c+25,"p02", false,-1, 7,0);
        vcdp->declBus(c+33,"p03", false,-1, 7,0);
        vcdp->declBus(c+41,"p10", false,-1, 7,0);
        vcdp->declBus(c+49,"p11", false,-1, 7,0);
        vcdp->declBus(c+57,"p12", false,-1, 7,0);
        vcdp->declBus(c+65,"p13", false,-1, 7,0);
        vcdp->declBus(c+73,"p20", false,-1, 7,0);
        vcdp->declBus(c+81,"p21", false,-1, 7,0);
        vcdp->declBus(c+89,"p22", false,-1, 7,0);
        vcdp->declBus(c+97,"p23", false,-1, 7,0);
        vcdp->declBus(c+105,"p30", false,-1, 7,0);
        vcdp->declBus(c+113,"p31", false,-1, 7,0);
        vcdp->declBus(c+121,"p32", false,-1, 7,0);
        vcdp->declBus(c+129,"p33", false,-1, 7,0);
        vcdp->declBus(c+137,"o00", false,-1, 7,0);
        vcdp->declBus(c+145,"o01", false,-1, 7,0);
        vcdp->declBus(c+153,"o02", false,-1, 7,0);
        vcdp->declBus(c+161,"o03", false,-1, 7,0);
        vcdp->declBus(c+169,"o10", false,-1, 7,0);
        vcdp->declBus(c+177,"o11", false,-1, 7,0);
        vcdp->declBus(c+185,"o12", false,-1, 7,0);
        vcdp->declBus(c+193,"o13", false,-1, 7,0);
        vcdp->declBus(c+201,"o20", false,-1, 7,0);
        vcdp->declBus(c+209,"o21", false,-1, 7,0);
        vcdp->declBus(c+217,"o22", false,-1, 7,0);
        vcdp->declBus(c+225,"o23", false,-1, 7,0);
        vcdp->declBus(c+233,"o30", false,-1, 7,0);
        vcdp->declBus(c+241,"o31", false,-1, 7,0);
        vcdp->declBus(c+249,"o32", false,-1, 7,0);
        vcdp->declBus(c+257,"o33", false,-1, 7,0);
        vcdp->declBit(c+1,"mod_enc_shifter clk", false,-1);
        vcdp->declBus(c+9,"mod_enc_shifter p00", false,-1, 7,0);
        vcdp->declBus(c+17,"mod_enc_shifter p01", false,-1, 7,0);
        vcdp->declBus(c+25,"mod_enc_shifter p02", false,-1, 7,0);
        vcdp->declBus(c+33,"mod_enc_shifter p03", false,-1, 7,0);
        vcdp->declBus(c+41,"mod_enc_shifter p10", false,-1, 7,0);
        vcdp->declBus(c+49,"mod_enc_shifter p11", false,-1, 7,0);
        vcdp->declBus(c+57,"mod_enc_shifter p12", false,-1, 7,0);
        vcdp->declBus(c+65,"mod_enc_shifter p13", false,-1, 7,0);
        vcdp->declBus(c+73,"mod_enc_shifter p20", false,-1, 7,0);
        vcdp->declBus(c+81,"mod_enc_shifter p21", false,-1, 7,0);
        vcdp->declBus(c+89,"mod_enc_shifter p22", false,-1, 7,0);
        vcdp->declBus(c+97,"mod_enc_shifter p23", false,-1, 7,0);
        vcdp->declBus(c+105,"mod_enc_shifter p30", false,-1, 7,0);
        vcdp->declBus(c+113,"mod_enc_shifter p31", false,-1, 7,0);
        vcdp->declBus(c+121,"mod_enc_shifter p32", false,-1, 7,0);
        vcdp->declBus(c+129,"mod_enc_shifter p33", false,-1, 7,0);
        vcdp->declBus(c+137,"mod_enc_shifter o00", false,-1, 7,0);
        vcdp->declBus(c+145,"mod_enc_shifter o01", false,-1, 7,0);
        vcdp->declBus(c+153,"mod_enc_shifter o02", false,-1, 7,0);
        vcdp->declBus(c+161,"mod_enc_shifter o03", false,-1, 7,0);
        vcdp->declBus(c+169,"mod_enc_shifter o10", false,-1, 7,0);
        vcdp->declBus(c+177,"mod_enc_shifter o11", false,-1, 7,0);
        vcdp->declBus(c+185,"mod_enc_shifter o12", false,-1, 7,0);
        vcdp->declBus(c+193,"mod_enc_shifter o13", false,-1, 7,0);
        vcdp->declBus(c+201,"mod_enc_shifter o20", false,-1, 7,0);
        vcdp->declBus(c+209,"mod_enc_shifter o21", false,-1, 7,0);
        vcdp->declBus(c+217,"mod_enc_shifter o22", false,-1, 7,0);
        vcdp->declBus(c+225,"mod_enc_shifter o23", false,-1, 7,0);
        vcdp->declBus(c+233,"mod_enc_shifter o30", false,-1, 7,0);
        vcdp->declBus(c+241,"mod_enc_shifter o31", false,-1, 7,0);
        vcdp->declBus(c+249,"mod_enc_shifter o32", false,-1, 7,0);
        vcdp->declBus(c+257,"mod_enc_shifter o33", false,-1, 7,0);
    }
}

void Vmod_enc_shifter::traceFullThis__1(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBit(c+1,(vlTOPp->clk));
        vcdp->fullBus(c+9,(vlTOPp->p00),8);
        vcdp->fullBus(c+17,(vlTOPp->p01),8);
        vcdp->fullBus(c+25,(vlTOPp->p02),8);
        vcdp->fullBus(c+33,(vlTOPp->p03),8);
        vcdp->fullBus(c+41,(vlTOPp->p10),8);
        vcdp->fullBus(c+49,(vlTOPp->p11),8);
        vcdp->fullBus(c+57,(vlTOPp->p12),8);
        vcdp->fullBus(c+65,(vlTOPp->p13),8);
        vcdp->fullBus(c+73,(vlTOPp->p20),8);
        vcdp->fullBus(c+81,(vlTOPp->p21),8);
        vcdp->fullBus(c+89,(vlTOPp->p22),8);
        vcdp->fullBus(c+97,(vlTOPp->p23),8);
        vcdp->fullBus(c+105,(vlTOPp->p30),8);
        vcdp->fullBus(c+113,(vlTOPp->p31),8);
        vcdp->fullBus(c+121,(vlTOPp->p32),8);
        vcdp->fullBus(c+129,(vlTOPp->p33),8);
        vcdp->fullBus(c+137,(vlTOPp->o00),8);
        vcdp->fullBus(c+145,(vlTOPp->o01),8);
        vcdp->fullBus(c+153,(vlTOPp->o02),8);
        vcdp->fullBus(c+161,(vlTOPp->o03),8);
        vcdp->fullBus(c+169,(vlTOPp->o10),8);
        vcdp->fullBus(c+177,(vlTOPp->o11),8);
        vcdp->fullBus(c+185,(vlTOPp->o12),8);
        vcdp->fullBus(c+193,(vlTOPp->o13),8);
        vcdp->fullBus(c+201,(vlTOPp->o20),8);
        vcdp->fullBus(c+209,(vlTOPp->o21),8);
        vcdp->fullBus(c+217,(vlTOPp->o22),8);
        vcdp->fullBus(c+225,(vlTOPp->o23),8);
        vcdp->fullBus(c+233,(vlTOPp->o30),8);
        vcdp->fullBus(c+241,(vlTOPp->o31),8);
        vcdp->fullBus(c+249,(vlTOPp->o32),8);
        vcdp->fullBus(c+257,(vlTOPp->o33),8);
    }
}
