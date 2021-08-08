// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmod_enc_addRoundKey.h for the primary calling header

#include "Vmod_enc_addRoundKey.h"
#include "Vmod_enc_addRoundKey__Syms.h"

//==========

VL_CTOR_IMP(Vmod_enc_addRoundKey) {
    Vmod_enc_addRoundKey__Syms* __restrict vlSymsp = __VlSymsp = new Vmod_enc_addRoundKey__Syms(this, name());
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vmod_enc_addRoundKey::__Vconfigure(Vmod_enc_addRoundKey__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vmod_enc_addRoundKey::~Vmod_enc_addRoundKey() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void Vmod_enc_addRoundKey::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vmod_enc_addRoundKey::eval\n"); );
    Vmod_enc_addRoundKey__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        vlSymsp->__Vm_activity = true;
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("../../design/mod_enc_addRoundKey.sv", 4, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vmod_enc_addRoundKey::_eval_initial_loop(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("../../design/mod_enc_addRoundKey.sv", 4, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vmod_enc_addRoundKey::_combo__TOP__1(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_combo__TOP__1\n"); );
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->out0 = ((IData)(vlTOPp->p00) ^ (IData)(vlTOPp->k00));
    vlTOPp->out1 = ((IData)(vlTOPp->p01) ^ (IData)(vlTOPp->k01));
    vlTOPp->out2 = ((IData)(vlTOPp->p02) ^ (IData)(vlTOPp->k02));
    vlTOPp->out3 = ((IData)(vlTOPp->p03) ^ (IData)(vlTOPp->k03));
    vlTOPp->out4 = ((IData)(vlTOPp->p10) ^ (IData)(vlTOPp->k10));
    vlTOPp->out5 = ((IData)(vlTOPp->p11) ^ (IData)(vlTOPp->k11));
    vlTOPp->out6 = ((IData)(vlTOPp->p12) ^ (IData)(vlTOPp->k12));
    vlTOPp->out7 = ((IData)(vlTOPp->p13) ^ (IData)(vlTOPp->k13));
    vlTOPp->out8 = ((IData)(vlTOPp->p20) ^ (IData)(vlTOPp->k20));
    vlTOPp->out9 = ((IData)(vlTOPp->p21) ^ (IData)(vlTOPp->k21));
    vlTOPp->out10 = ((IData)(vlTOPp->p22) ^ (IData)(vlTOPp->k22));
    vlTOPp->out11 = ((IData)(vlTOPp->p23) ^ (IData)(vlTOPp->k23));
    vlTOPp->out12 = ((IData)(vlTOPp->p30) ^ (IData)(vlTOPp->k30));
    vlTOPp->out13 = ((IData)(vlTOPp->p31) ^ (IData)(vlTOPp->k31));
    vlTOPp->out14 = ((IData)(vlTOPp->p32) ^ (IData)(vlTOPp->k32));
    vlTOPp->out15 = ((IData)(vlTOPp->p33) ^ (IData)(vlTOPp->k33));
}

void Vmod_enc_addRoundKey::_eval(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_eval\n"); );
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

void Vmod_enc_addRoundKey::_eval_initial(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_eval_initial\n"); );
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vmod_enc_addRoundKey::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::final\n"); );
    // Variables
    Vmod_enc_addRoundKey__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vmod_enc_addRoundKey::_eval_settle(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_eval_settle\n"); );
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

VL_INLINE_OPT QData Vmod_enc_addRoundKey::_change_request(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_change_request\n"); );
    Vmod_enc_addRoundKey* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vmod_enc_addRoundKey::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
}
#endif  // VL_DEBUG

void Vmod_enc_addRoundKey::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_addRoundKey::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    p00 = VL_RAND_RESET_I(8);
    k00 = VL_RAND_RESET_I(8);
    p01 = VL_RAND_RESET_I(8);
    k01 = VL_RAND_RESET_I(8);
    p02 = VL_RAND_RESET_I(8);
    k02 = VL_RAND_RESET_I(8);
    p03 = VL_RAND_RESET_I(8);
    k03 = VL_RAND_RESET_I(8);
    p10 = VL_RAND_RESET_I(8);
    k10 = VL_RAND_RESET_I(8);
    p11 = VL_RAND_RESET_I(8);
    k11 = VL_RAND_RESET_I(8);
    p12 = VL_RAND_RESET_I(8);
    k12 = VL_RAND_RESET_I(8);
    p13 = VL_RAND_RESET_I(8);
    k13 = VL_RAND_RESET_I(8);
    p20 = VL_RAND_RESET_I(8);
    k20 = VL_RAND_RESET_I(8);
    p21 = VL_RAND_RESET_I(8);
    k21 = VL_RAND_RESET_I(8);
    p22 = VL_RAND_RESET_I(8);
    k22 = VL_RAND_RESET_I(8);
    p23 = VL_RAND_RESET_I(8);
    k23 = VL_RAND_RESET_I(8);
    p30 = VL_RAND_RESET_I(8);
    k30 = VL_RAND_RESET_I(8);
    p31 = VL_RAND_RESET_I(8);
    k31 = VL_RAND_RESET_I(8);
    p32 = VL_RAND_RESET_I(8);
    k32 = VL_RAND_RESET_I(8);
    p33 = VL_RAND_RESET_I(8);
    k33 = VL_RAND_RESET_I(8);
    out0 = VL_RAND_RESET_I(8);
    out8 = VL_RAND_RESET_I(8);
    out1 = VL_RAND_RESET_I(8);
    out9 = VL_RAND_RESET_I(8);
    out2 = VL_RAND_RESET_I(8);
    out10 = VL_RAND_RESET_I(8);
    out3 = VL_RAND_RESET_I(8);
    out11 = VL_RAND_RESET_I(8);
    out4 = VL_RAND_RESET_I(8);
    out12 = VL_RAND_RESET_I(8);
    out5 = VL_RAND_RESET_I(8);
    out13 = VL_RAND_RESET_I(8);
    out6 = VL_RAND_RESET_I(8);
    out14 = VL_RAND_RESET_I(8);
    out7 = VL_RAND_RESET_I(8);
    out15 = VL_RAND_RESET_I(8);
    __Vm_traceActivity = 0;
}
