// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vmod_enc_shifter__Syms.h"


//======================

void Vmod_enc_shifter::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vmod_enc_shifter* t = (Vmod_enc_shifter*)userthis;
    Vmod_enc_shifter__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void Vmod_enc_shifter::traceChgThis(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vmod_enc_shifter::traceChgThis__2(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1,(vlTOPp->clk));
        vcdp->chgBus(c+9,(vlTOPp->p00),8);
        vcdp->chgBus(c+17,(vlTOPp->p01),8);
        vcdp->chgBus(c+25,(vlTOPp->p02),8);
        vcdp->chgBus(c+33,(vlTOPp->p03),8);
        vcdp->chgBus(c+41,(vlTOPp->p10),8);
        vcdp->chgBus(c+49,(vlTOPp->p11),8);
        vcdp->chgBus(c+57,(vlTOPp->p12),8);
        vcdp->chgBus(c+65,(vlTOPp->p13),8);
        vcdp->chgBus(c+73,(vlTOPp->p20),8);
        vcdp->chgBus(c+81,(vlTOPp->p21),8);
        vcdp->chgBus(c+89,(vlTOPp->p22),8);
        vcdp->chgBus(c+97,(vlTOPp->p23),8);
        vcdp->chgBus(c+105,(vlTOPp->p30),8);
        vcdp->chgBus(c+113,(vlTOPp->p31),8);
        vcdp->chgBus(c+121,(vlTOPp->p32),8);
        vcdp->chgBus(c+129,(vlTOPp->p33),8);
        vcdp->chgBus(c+137,(vlTOPp->o00),8);
        vcdp->chgBus(c+145,(vlTOPp->o01),8);
        vcdp->chgBus(c+153,(vlTOPp->o02),8);
        vcdp->chgBus(c+161,(vlTOPp->o03),8);
        vcdp->chgBus(c+169,(vlTOPp->o10),8);
        vcdp->chgBus(c+177,(vlTOPp->o11),8);
        vcdp->chgBus(c+185,(vlTOPp->o12),8);
        vcdp->chgBus(c+193,(vlTOPp->o13),8);
        vcdp->chgBus(c+201,(vlTOPp->o20),8);
        vcdp->chgBus(c+209,(vlTOPp->o21),8);
        vcdp->chgBus(c+217,(vlTOPp->o22),8);
        vcdp->chgBus(c+225,(vlTOPp->o23),8);
        vcdp->chgBus(c+233,(vlTOPp->o30),8);
        vcdp->chgBus(c+241,(vlTOPp->o31),8);
        vcdp->chgBus(c+249,(vlTOPp->o32),8);
        vcdp->chgBus(c+257,(vlTOPp->o33),8);
    }
}
