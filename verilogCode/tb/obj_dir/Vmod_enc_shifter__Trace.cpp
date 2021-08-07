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
        if (VL_UNLIKELY((1U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 1U))))) {
            vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
        }
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
        vcdp->chgBus(c+1,(vlTOPp->tb_mod_enc_shifter__DOT__p00),8);
        vcdp->chgBus(c+9,(vlTOPp->tb_mod_enc_shifter__DOT__p01),8);
        vcdp->chgBus(c+17,(vlTOPp->tb_mod_enc_shifter__DOT__p02),8);
        vcdp->chgBus(c+25,(vlTOPp->tb_mod_enc_shifter__DOT__p03),8);
        vcdp->chgBus(c+33,(vlTOPp->tb_mod_enc_shifter__DOT__p10),8);
        vcdp->chgBus(c+41,(vlTOPp->tb_mod_enc_shifter__DOT__p11),8);
        vcdp->chgBus(c+49,(vlTOPp->tb_mod_enc_shifter__DOT__p12),8);
        vcdp->chgBus(c+57,(vlTOPp->tb_mod_enc_shifter__DOT__p13),8);
        vcdp->chgBus(c+65,(vlTOPp->tb_mod_enc_shifter__DOT__p20),8);
        vcdp->chgBus(c+73,(vlTOPp->tb_mod_enc_shifter__DOT__p21),8);
        vcdp->chgBus(c+81,(vlTOPp->tb_mod_enc_shifter__DOT__p22),8);
        vcdp->chgBus(c+89,(vlTOPp->tb_mod_enc_shifter__DOT__p23),8);
        vcdp->chgBus(c+97,(vlTOPp->tb_mod_enc_shifter__DOT__p30),8);
        vcdp->chgBus(c+105,(vlTOPp->tb_mod_enc_shifter__DOT__p31),8);
        vcdp->chgBus(c+113,(vlTOPp->tb_mod_enc_shifter__DOT__p32),8);
        vcdp->chgBus(c+121,(vlTOPp->tb_mod_enc_shifter__DOT__p33),8);
    }
}

void Vmod_enc_shifter::traceChgThis__3(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+129,(vlTOPp->tb_mod_enc_shifter__DOT__clk));
    }
}
