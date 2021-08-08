// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vmod_enc_addRoundKey__Syms.h"


//======================

void Vmod_enc_addRoundKey::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vmod_enc_addRoundKey* t = (Vmod_enc_addRoundKey*)userthis;
    Vmod_enc_addRoundKey__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void Vmod_enc_addRoundKey::traceChgThis(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vmod_enc_addRoundKey::traceChgThis__2(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1,(vlTOPp->clk));
        vcdp->chgBus(c+9,(vlTOPp->p00),8);
        vcdp->chgBus(c+17,(vlTOPp->k00),8);
        vcdp->chgBus(c+25,(vlTOPp->p01),8);
        vcdp->chgBus(c+33,(vlTOPp->k01),8);
        vcdp->chgBus(c+41,(vlTOPp->p02),8);
        vcdp->chgBus(c+49,(vlTOPp->k02),8);
        vcdp->chgBus(c+57,(vlTOPp->p03),8);
        vcdp->chgBus(c+65,(vlTOPp->k03),8);
        vcdp->chgBus(c+73,(vlTOPp->p10),8);
        vcdp->chgBus(c+81,(vlTOPp->k10),8);
        vcdp->chgBus(c+89,(vlTOPp->p11),8);
        vcdp->chgBus(c+97,(vlTOPp->k11),8);
        vcdp->chgBus(c+105,(vlTOPp->p12),8);
        vcdp->chgBus(c+113,(vlTOPp->k12),8);
        vcdp->chgBus(c+121,(vlTOPp->p13),8);
        vcdp->chgBus(c+129,(vlTOPp->k13),8);
        vcdp->chgBus(c+137,(vlTOPp->p20),8);
        vcdp->chgBus(c+145,(vlTOPp->k20),8);
        vcdp->chgBus(c+153,(vlTOPp->p21),8);
        vcdp->chgBus(c+161,(vlTOPp->k21),8);
        vcdp->chgBus(c+169,(vlTOPp->p22),8);
        vcdp->chgBus(c+177,(vlTOPp->k22),8);
        vcdp->chgBus(c+185,(vlTOPp->p23),8);
        vcdp->chgBus(c+193,(vlTOPp->k23),8);
        vcdp->chgBus(c+201,(vlTOPp->p30),8);
        vcdp->chgBus(c+209,(vlTOPp->k30),8);
        vcdp->chgBus(c+217,(vlTOPp->p31),8);
        vcdp->chgBus(c+225,(vlTOPp->k31),8);
        vcdp->chgBus(c+233,(vlTOPp->p32),8);
        vcdp->chgBus(c+241,(vlTOPp->k32),8);
        vcdp->chgBus(c+249,(vlTOPp->p33),8);
        vcdp->chgBus(c+257,(vlTOPp->k33),8);
        vcdp->chgBus(c+265,(vlTOPp->out0),8);
        vcdp->chgBus(c+273,(vlTOPp->out8),8);
        vcdp->chgBus(c+281,(vlTOPp->out1),8);
        vcdp->chgBus(c+289,(vlTOPp->out9),8);
        vcdp->chgBus(c+297,(vlTOPp->out2),8);
        vcdp->chgBus(c+305,(vlTOPp->out10),8);
        vcdp->chgBus(c+313,(vlTOPp->out3),8);
        vcdp->chgBus(c+321,(vlTOPp->out11),8);
        vcdp->chgBus(c+329,(vlTOPp->out4),8);
        vcdp->chgBus(c+337,(vlTOPp->out12),8);
        vcdp->chgBus(c+345,(vlTOPp->out5),8);
        vcdp->chgBus(c+353,(vlTOPp->out13),8);
        vcdp->chgBus(c+361,(vlTOPp->out6),8);
        vcdp->chgBus(c+369,(vlTOPp->out14),8);
        vcdp->chgBus(c+377,(vlTOPp->out7),8);
        vcdp->chgBus(c+385,(vlTOPp->out15),8);
    }
}
