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
        vcdp->declBit(c+129,"tb_mod_enc_shifter clk", false,-1);
        vcdp->declBus(c+1,"tb_mod_enc_shifter p00", false,-1, 7,0);
        vcdp->declBus(c+9,"tb_mod_enc_shifter p01", false,-1, 7,0);
        vcdp->declBus(c+17,"tb_mod_enc_shifter p02", false,-1, 7,0);
        vcdp->declBus(c+25,"tb_mod_enc_shifter p03", false,-1, 7,0);
        vcdp->declBus(c+33,"tb_mod_enc_shifter p10", false,-1, 7,0);
        vcdp->declBus(c+41,"tb_mod_enc_shifter p11", false,-1, 7,0);
        vcdp->declBus(c+49,"tb_mod_enc_shifter p12", false,-1, 7,0);
        vcdp->declBus(c+57,"tb_mod_enc_shifter p13", false,-1, 7,0);
        vcdp->declBus(c+65,"tb_mod_enc_shifter p20", false,-1, 7,0);
        vcdp->declBus(c+73,"tb_mod_enc_shifter p21", false,-1, 7,0);
        vcdp->declBus(c+81,"tb_mod_enc_shifter p22", false,-1, 7,0);
        vcdp->declBus(c+89,"tb_mod_enc_shifter p23", false,-1, 7,0);
        vcdp->declBus(c+97,"tb_mod_enc_shifter p30", false,-1, 7,0);
        vcdp->declBus(c+105,"tb_mod_enc_shifter p31", false,-1, 7,0);
        vcdp->declBus(c+113,"tb_mod_enc_shifter p32", false,-1, 7,0);
        vcdp->declBus(c+121,"tb_mod_enc_shifter p33", false,-1, 7,0);
        vcdp->declBus(c+1,"tb_mod_enc_shifter o00", false,-1, 7,0);
        vcdp->declBus(c+9,"tb_mod_enc_shifter o01", false,-1, 7,0);
        vcdp->declBus(c+17,"tb_mod_enc_shifter o02", false,-1, 7,0);
        vcdp->declBus(c+25,"tb_mod_enc_shifter o03", false,-1, 7,0);
        vcdp->declBus(c+57,"tb_mod_enc_shifter o10", false,-1, 7,0);
        vcdp->declBus(c+33,"tb_mod_enc_shifter o11", false,-1, 7,0);
        vcdp->declBus(c+41,"tb_mod_enc_shifter o12", false,-1, 7,0);
        vcdp->declBus(c+49,"tb_mod_enc_shifter o13", false,-1, 7,0);
        vcdp->declBus(c+81,"tb_mod_enc_shifter o20", false,-1, 7,0);
        vcdp->declBus(c+89,"tb_mod_enc_shifter o21", false,-1, 7,0);
        vcdp->declBus(c+65,"tb_mod_enc_shifter o22", false,-1, 7,0);
        vcdp->declBus(c+73,"tb_mod_enc_shifter o23", false,-1, 7,0);
        vcdp->declBus(c+105,"tb_mod_enc_shifter o30", false,-1, 7,0);
        vcdp->declBus(c+113,"tb_mod_enc_shifter o31", false,-1, 7,0);
        vcdp->declBus(c+121,"tb_mod_enc_shifter o32", false,-1, 7,0);
        vcdp->declBus(c+97,"tb_mod_enc_shifter o33", false,-1, 7,0);
        vcdp->declBit(c+129,"tb_mod_enc_shifter DUT clk", false,-1);
        vcdp->declBus(c+1,"tb_mod_enc_shifter DUT p00", false,-1, 7,0);
        vcdp->declBus(c+9,"tb_mod_enc_shifter DUT p01", false,-1, 7,0);
        vcdp->declBus(c+17,"tb_mod_enc_shifter DUT p02", false,-1, 7,0);
        vcdp->declBus(c+25,"tb_mod_enc_shifter DUT p03", false,-1, 7,0);
        vcdp->declBus(c+33,"tb_mod_enc_shifter DUT p10", false,-1, 7,0);
        vcdp->declBus(c+41,"tb_mod_enc_shifter DUT p11", false,-1, 7,0);
        vcdp->declBus(c+49,"tb_mod_enc_shifter DUT p12", false,-1, 7,0);
        vcdp->declBus(c+57,"tb_mod_enc_shifter DUT p13", false,-1, 7,0);
        vcdp->declBus(c+65,"tb_mod_enc_shifter DUT p20", false,-1, 7,0);
        vcdp->declBus(c+73,"tb_mod_enc_shifter DUT p21", false,-1, 7,0);
        vcdp->declBus(c+81,"tb_mod_enc_shifter DUT p22", false,-1, 7,0);
        vcdp->declBus(c+89,"tb_mod_enc_shifter DUT p23", false,-1, 7,0);
        vcdp->declBus(c+97,"tb_mod_enc_shifter DUT p30", false,-1, 7,0);
        vcdp->declBus(c+105,"tb_mod_enc_shifter DUT p31", false,-1, 7,0);
        vcdp->declBus(c+113,"tb_mod_enc_shifter DUT p32", false,-1, 7,0);
        vcdp->declBus(c+121,"tb_mod_enc_shifter DUT p33", false,-1, 7,0);
        vcdp->declBus(c+1,"tb_mod_enc_shifter DUT o00", false,-1, 7,0);
        vcdp->declBus(c+9,"tb_mod_enc_shifter DUT o01", false,-1, 7,0);
        vcdp->declBus(c+17,"tb_mod_enc_shifter DUT o02", false,-1, 7,0);
        vcdp->declBus(c+25,"tb_mod_enc_shifter DUT o03", false,-1, 7,0);
        vcdp->declBus(c+57,"tb_mod_enc_shifter DUT o10", false,-1, 7,0);
        vcdp->declBus(c+33,"tb_mod_enc_shifter DUT o11", false,-1, 7,0);
        vcdp->declBus(c+41,"tb_mod_enc_shifter DUT o12", false,-1, 7,0);
        vcdp->declBus(c+49,"tb_mod_enc_shifter DUT o13", false,-1, 7,0);
        vcdp->declBus(c+81,"tb_mod_enc_shifter DUT o20", false,-1, 7,0);
        vcdp->declBus(c+89,"tb_mod_enc_shifter DUT o21", false,-1, 7,0);
        vcdp->declBus(c+65,"tb_mod_enc_shifter DUT o22", false,-1, 7,0);
        vcdp->declBus(c+73,"tb_mod_enc_shifter DUT o23", false,-1, 7,0);
        vcdp->declBus(c+105,"tb_mod_enc_shifter DUT o30", false,-1, 7,0);
        vcdp->declBus(c+113,"tb_mod_enc_shifter DUT o31", false,-1, 7,0);
        vcdp->declBus(c+121,"tb_mod_enc_shifter DUT o32", false,-1, 7,0);
        vcdp->declBus(c+97,"tb_mod_enc_shifter DUT o33", false,-1, 7,0);
    }
}

void Vmod_enc_shifter::traceFullThis__1(Vmod_enc_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBus(c+1,(vlTOPp->tb_mod_enc_shifter__DOT__p00),8);
        vcdp->fullBus(c+9,(vlTOPp->tb_mod_enc_shifter__DOT__p01),8);
        vcdp->fullBus(c+17,(vlTOPp->tb_mod_enc_shifter__DOT__p02),8);
        vcdp->fullBus(c+25,(vlTOPp->tb_mod_enc_shifter__DOT__p03),8);
        vcdp->fullBus(c+33,(vlTOPp->tb_mod_enc_shifter__DOT__p10),8);
        vcdp->fullBus(c+41,(vlTOPp->tb_mod_enc_shifter__DOT__p11),8);
        vcdp->fullBus(c+49,(vlTOPp->tb_mod_enc_shifter__DOT__p12),8);
        vcdp->fullBus(c+57,(vlTOPp->tb_mod_enc_shifter__DOT__p13),8);
        vcdp->fullBus(c+65,(vlTOPp->tb_mod_enc_shifter__DOT__p20),8);
        vcdp->fullBus(c+73,(vlTOPp->tb_mod_enc_shifter__DOT__p21),8);
        vcdp->fullBus(c+81,(vlTOPp->tb_mod_enc_shifter__DOT__p22),8);
        vcdp->fullBus(c+89,(vlTOPp->tb_mod_enc_shifter__DOT__p23),8);
        vcdp->fullBus(c+97,(vlTOPp->tb_mod_enc_shifter__DOT__p30),8);
        vcdp->fullBus(c+105,(vlTOPp->tb_mod_enc_shifter__DOT__p31),8);
        vcdp->fullBus(c+113,(vlTOPp->tb_mod_enc_shifter__DOT__p32),8);
        vcdp->fullBus(c+121,(vlTOPp->tb_mod_enc_shifter__DOT__p33),8);
        vcdp->fullBit(c+129,(vlTOPp->tb_mod_enc_shifter__DOT__clk));
    }
}
