// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vmod_enc_addRoundKey__Syms.h"


//======================

void Vmod_enc_addRoundKey::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&Vmod_enc_addRoundKey::traceInit, &Vmod_enc_addRoundKey::traceFull, &Vmod_enc_addRoundKey::traceChg, this);
}
void Vmod_enc_addRoundKey::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vmod_enc_addRoundKey* t = (Vmod_enc_addRoundKey*)userthis;
    Vmod_enc_addRoundKey__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vmod_enc_addRoundKey::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vmod_enc_addRoundKey* t = (Vmod_enc_addRoundKey*)userthis;
    Vmod_enc_addRoundKey__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void Vmod_enc_addRoundKey::traceInitThis(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vmod_enc_addRoundKey::traceFullThis(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vmod_enc_addRoundKey::traceInitThis__1(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+1,"clk", false,-1);
        vcdp->declBus(c+9,"p00", false,-1, 7,0);
        vcdp->declBus(c+17,"k00", false,-1, 7,0);
        vcdp->declBus(c+25,"p01", false,-1, 7,0);
        vcdp->declBus(c+33,"k01", false,-1, 7,0);
        vcdp->declBus(c+41,"p02", false,-1, 7,0);
        vcdp->declBus(c+49,"k02", false,-1, 7,0);
        vcdp->declBus(c+57,"p03", false,-1, 7,0);
        vcdp->declBus(c+65,"k03", false,-1, 7,0);
        vcdp->declBus(c+73,"p10", false,-1, 7,0);
        vcdp->declBus(c+81,"k10", false,-1, 7,0);
        vcdp->declBus(c+89,"p11", false,-1, 7,0);
        vcdp->declBus(c+97,"k11", false,-1, 7,0);
        vcdp->declBus(c+105,"p12", false,-1, 7,0);
        vcdp->declBus(c+113,"k12", false,-1, 7,0);
        vcdp->declBus(c+121,"p13", false,-1, 7,0);
        vcdp->declBus(c+129,"k13", false,-1, 7,0);
        vcdp->declBus(c+137,"p20", false,-1, 7,0);
        vcdp->declBus(c+145,"k20", false,-1, 7,0);
        vcdp->declBus(c+153,"p21", false,-1, 7,0);
        vcdp->declBus(c+161,"k21", false,-1, 7,0);
        vcdp->declBus(c+169,"p22", false,-1, 7,0);
        vcdp->declBus(c+177,"k22", false,-1, 7,0);
        vcdp->declBus(c+185,"p23", false,-1, 7,0);
        vcdp->declBus(c+193,"k23", false,-1, 7,0);
        vcdp->declBus(c+201,"p30", false,-1, 7,0);
        vcdp->declBus(c+209,"k30", false,-1, 7,0);
        vcdp->declBus(c+217,"p31", false,-1, 7,0);
        vcdp->declBus(c+225,"k31", false,-1, 7,0);
        vcdp->declBus(c+233,"p32", false,-1, 7,0);
        vcdp->declBus(c+241,"k32", false,-1, 7,0);
        vcdp->declBus(c+249,"p33", false,-1, 7,0);
        vcdp->declBus(c+257,"k33", false,-1, 7,0);
        vcdp->declBus(c+265,"out0", false,-1, 7,0);
        vcdp->declBus(c+273,"out8", false,-1, 7,0);
        vcdp->declBus(c+281,"out1", false,-1, 7,0);
        vcdp->declBus(c+289,"out9", false,-1, 7,0);
        vcdp->declBus(c+297,"out2", false,-1, 7,0);
        vcdp->declBus(c+305,"out10", false,-1, 7,0);
        vcdp->declBus(c+313,"out3", false,-1, 7,0);
        vcdp->declBus(c+321,"out11", false,-1, 7,0);
        vcdp->declBus(c+329,"out4", false,-1, 7,0);
        vcdp->declBus(c+337,"out12", false,-1, 7,0);
        vcdp->declBus(c+345,"out5", false,-1, 7,0);
        vcdp->declBus(c+353,"out13", false,-1, 7,0);
        vcdp->declBus(c+361,"out6", false,-1, 7,0);
        vcdp->declBus(c+369,"out14", false,-1, 7,0);
        vcdp->declBus(c+377,"out7", false,-1, 7,0);
        vcdp->declBus(c+385,"out15", false,-1, 7,0);
        vcdp->declBit(c+1,"mod_enc_addRoundKey clk", false,-1);
        vcdp->declBus(c+9,"mod_enc_addRoundKey p00", false,-1, 7,0);
        vcdp->declBus(c+17,"mod_enc_addRoundKey k00", false,-1, 7,0);
        vcdp->declBus(c+25,"mod_enc_addRoundKey p01", false,-1, 7,0);
        vcdp->declBus(c+33,"mod_enc_addRoundKey k01", false,-1, 7,0);
        vcdp->declBus(c+41,"mod_enc_addRoundKey p02", false,-1, 7,0);
        vcdp->declBus(c+49,"mod_enc_addRoundKey k02", false,-1, 7,0);
        vcdp->declBus(c+57,"mod_enc_addRoundKey p03", false,-1, 7,0);
        vcdp->declBus(c+65,"mod_enc_addRoundKey k03", false,-1, 7,0);
        vcdp->declBus(c+73,"mod_enc_addRoundKey p10", false,-1, 7,0);
        vcdp->declBus(c+81,"mod_enc_addRoundKey k10", false,-1, 7,0);
        vcdp->declBus(c+89,"mod_enc_addRoundKey p11", false,-1, 7,0);
        vcdp->declBus(c+97,"mod_enc_addRoundKey k11", false,-1, 7,0);
        vcdp->declBus(c+105,"mod_enc_addRoundKey p12", false,-1, 7,0);
        vcdp->declBus(c+113,"mod_enc_addRoundKey k12", false,-1, 7,0);
        vcdp->declBus(c+121,"mod_enc_addRoundKey p13", false,-1, 7,0);
        vcdp->declBus(c+129,"mod_enc_addRoundKey k13", false,-1, 7,0);
        vcdp->declBus(c+137,"mod_enc_addRoundKey p20", false,-1, 7,0);
        vcdp->declBus(c+145,"mod_enc_addRoundKey k20", false,-1, 7,0);
        vcdp->declBus(c+153,"mod_enc_addRoundKey p21", false,-1, 7,0);
        vcdp->declBus(c+161,"mod_enc_addRoundKey k21", false,-1, 7,0);
        vcdp->declBus(c+169,"mod_enc_addRoundKey p22", false,-1, 7,0);
        vcdp->declBus(c+177,"mod_enc_addRoundKey k22", false,-1, 7,0);
        vcdp->declBus(c+185,"mod_enc_addRoundKey p23", false,-1, 7,0);
        vcdp->declBus(c+193,"mod_enc_addRoundKey k23", false,-1, 7,0);
        vcdp->declBus(c+201,"mod_enc_addRoundKey p30", false,-1, 7,0);
        vcdp->declBus(c+209,"mod_enc_addRoundKey k30", false,-1, 7,0);
        vcdp->declBus(c+217,"mod_enc_addRoundKey p31", false,-1, 7,0);
        vcdp->declBus(c+225,"mod_enc_addRoundKey k31", false,-1, 7,0);
        vcdp->declBus(c+233,"mod_enc_addRoundKey p32", false,-1, 7,0);
        vcdp->declBus(c+241,"mod_enc_addRoundKey k32", false,-1, 7,0);
        vcdp->declBus(c+249,"mod_enc_addRoundKey p33", false,-1, 7,0);
        vcdp->declBus(c+257,"mod_enc_addRoundKey k33", false,-1, 7,0);
        vcdp->declBus(c+265,"mod_enc_addRoundKey out0", false,-1, 7,0);
        vcdp->declBus(c+273,"mod_enc_addRoundKey out8", false,-1, 7,0);
        vcdp->declBus(c+281,"mod_enc_addRoundKey out1", false,-1, 7,0);
        vcdp->declBus(c+289,"mod_enc_addRoundKey out9", false,-1, 7,0);
        vcdp->declBus(c+297,"mod_enc_addRoundKey out2", false,-1, 7,0);
        vcdp->declBus(c+305,"mod_enc_addRoundKey out10", false,-1, 7,0);
        vcdp->declBus(c+313,"mod_enc_addRoundKey out3", false,-1, 7,0);
        vcdp->declBus(c+321,"mod_enc_addRoundKey out11", false,-1, 7,0);
        vcdp->declBus(c+329,"mod_enc_addRoundKey out4", false,-1, 7,0);
        vcdp->declBus(c+337,"mod_enc_addRoundKey out12", false,-1, 7,0);
        vcdp->declBus(c+345,"mod_enc_addRoundKey out5", false,-1, 7,0);
        vcdp->declBus(c+353,"mod_enc_addRoundKey out13", false,-1, 7,0);
        vcdp->declBus(c+361,"mod_enc_addRoundKey out6", false,-1, 7,0);
        vcdp->declBus(c+369,"mod_enc_addRoundKey out14", false,-1, 7,0);
        vcdp->declBus(c+377,"mod_enc_addRoundKey out7", false,-1, 7,0);
        vcdp->declBus(c+385,"mod_enc_addRoundKey out15", false,-1, 7,0);
    }
}

void Vmod_enc_addRoundKey::traceFullThis__1(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBit(c+1,(vlTOPp->clk));
        vcdp->fullBus(c+9,(vlTOPp->p00),8);
        vcdp->fullBus(c+17,(vlTOPp->k00),8);
        vcdp->fullBus(c+25,(vlTOPp->p01),8);
        vcdp->fullBus(c+33,(vlTOPp->k01),8);
        vcdp->fullBus(c+41,(vlTOPp->p02),8);
        vcdp->fullBus(c+49,(vlTOPp->k02),8);
        vcdp->fullBus(c+57,(vlTOPp->p03),8);
        vcdp->fullBus(c+65,(vlTOPp->k03),8);
        vcdp->fullBus(c+73,(vlTOPp->p10),8);
        vcdp->fullBus(c+81,(vlTOPp->k10),8);
        vcdp->fullBus(c+89,(vlTOPp->p11),8);
        vcdp->fullBus(c+97,(vlTOPp->k11),8);
        vcdp->fullBus(c+105,(vlTOPp->p12),8);
        vcdp->fullBus(c+113,(vlTOPp->k12),8);
        vcdp->fullBus(c+121,(vlTOPp->p13),8);
        vcdp->fullBus(c+129,(vlTOPp->k13),8);
        vcdp->fullBus(c+137,(vlTOPp->p20),8);
        vcdp->fullBus(c+145,(vlTOPp->k20),8);
        vcdp->fullBus(c+153,(vlTOPp->p21),8);
        vcdp->fullBus(c+161,(vlTOPp->k21),8);
        vcdp->fullBus(c+169,(vlTOPp->p22),8);
        vcdp->fullBus(c+177,(vlTOPp->k22),8);
        vcdp->fullBus(c+185,(vlTOPp->p23),8);
        vcdp->fullBus(c+193,(vlTOPp->k23),8);
        vcdp->fullBus(c+201,(vlTOPp->p30),8);
        vcdp->fullBus(c+209,(vlTOPp->k30),8);
        vcdp->fullBus(c+217,(vlTOPp->p31),8);
        vcdp->fullBus(c+225,(vlTOPp->k31),8);
        vcdp->fullBus(c+233,(vlTOPp->p32),8);
        vcdp->fullBus(c+241,(vlTOPp->k32),8);
        vcdp->fullBus(c+249,(vlTOPp->p33),8);
        vcdp->fullBus(c+257,(vlTOPp->k33),8);
        vcdp->fullBus(c+265,(vlTOPp->out0),8);
        vcdp->fullBus(c+273,(vlTOPp->out8),8);
        vcdp->fullBus(c+281,(vlTOPp->out1),8);
        vcdp->fullBus(c+289,(vlTOPp->out9),8);
        vcdp->fullBus(c+297,(vlTOPp->out2),8);
        vcdp->fullBus(c+305,(vlTOPp->out10),8);
        vcdp->fullBus(c+313,(vlTOPp->out3),8);
        vcdp->fullBus(c+321,(vlTOPp->out11),8);
        vcdp->fullBus(c+329,(vlTOPp->out4),8);
        vcdp->fullBus(c+337,(vlTOPp->out12),8);
        vcdp->fullBus(c+345,(vlTOPp->out5),8);
        vcdp->fullBus(c+353,(vlTOPp->out13),8);
        vcdp->fullBus(c+361,(vlTOPp->out6),8);
        vcdp->fullBus(c+369,(vlTOPp->out14),8);
        vcdp->fullBus(c+377,(vlTOPp->out7),8);
        vcdp->fullBus(c+385,(vlTOPp->out15),8);
    }
}
