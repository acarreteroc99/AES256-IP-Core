// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmod_enc_shifter.h for the primary calling header

#include "Vmod_enc_shifter.h"
#include "Vmod_enc_shifter__Syms.h"

//==========

VL_CTOR_IMP(Vmod_enc_shifter) {
    Vmod_enc_shifter__Syms* __restrict vlSymsp = __VlSymsp = new Vmod_enc_shifter__Syms(this, name());
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vmod_enc_shifter::__Vconfigure(Vmod_enc_shifter__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vmod_enc_shifter::~Vmod_enc_shifter() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void Vmod_enc_shifter::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vmod_enc_shifter::eval\n"); );
    Vmod_enc_shifter__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("../../design/mod_enc_shifter.sv", 7, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vmod_enc_shifter::_eval_initial_loop(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("../../design/mod_enc_shifter.sv", 7, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vmod_enc_shifter::_combo__TOP__1(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_combo__TOP__1\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->o00 = vlTOPp->p00;
    vlTOPp->o01 = vlTOPp->p01;
    vlTOPp->o02 = vlTOPp->p02;
    vlTOPp->o03 = vlTOPp->p03;
    vlTOPp->o10 = vlTOPp->p13;
    vlTOPp->o11 = vlTOPp->p10;
    vlTOPp->o12 = vlTOPp->p11;
    vlTOPp->o13 = vlTOPp->p12;
    vlTOPp->o20 = vlTOPp->p22;
    vlTOPp->o21 = vlTOPp->p23;
    vlTOPp->o22 = vlTOPp->p20;
    vlTOPp->o23 = vlTOPp->p21;
    vlTOPp->o30 = vlTOPp->p31;
    vlTOPp->o31 = vlTOPp->p32;
    vlTOPp->o32 = vlTOPp->p33;
    vlTOPp->o33 = vlTOPp->p30;
}

void Vmod_enc_shifter::_eval(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

void Vmod_enc_shifter::_eval_initial(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval_initial\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vmod_enc_shifter::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::final\n"); );
    // Variables
    Vmod_enc_shifter__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vmod_enc_shifter::_eval_settle(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval_settle\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

VL_INLINE_OPT QData Vmod_enc_shifter::_change_request(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_change_request\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vmod_enc_shifter::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
}
#endif  // VL_DEBUG

void Vmod_enc_shifter::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    p00 = VL_RAND_RESET_I(8);
    p01 = VL_RAND_RESET_I(8);
    p02 = VL_RAND_RESET_I(8);
    p03 = VL_RAND_RESET_I(8);
    p10 = VL_RAND_RESET_I(8);
    p11 = VL_RAND_RESET_I(8);
    p12 = VL_RAND_RESET_I(8);
    p13 = VL_RAND_RESET_I(8);
    p20 = VL_RAND_RESET_I(8);
    p21 = VL_RAND_RESET_I(8);
    p22 = VL_RAND_RESET_I(8);
    p23 = VL_RAND_RESET_I(8);
    p30 = VL_RAND_RESET_I(8);
    p31 = VL_RAND_RESET_I(8);
    p32 = VL_RAND_RESET_I(8);
    p33 = VL_RAND_RESET_I(8);
    o00 = VL_RAND_RESET_I(8);
    o01 = VL_RAND_RESET_I(8);
    o02 = VL_RAND_RESET_I(8);
    o03 = VL_RAND_RESET_I(8);
    o10 = VL_RAND_RESET_I(8);
    o11 = VL_RAND_RESET_I(8);
    o12 = VL_RAND_RESET_I(8);
    o13 = VL_RAND_RESET_I(8);
    o20 = VL_RAND_RESET_I(8);
    o21 = VL_RAND_RESET_I(8);
    o22 = VL_RAND_RESET_I(8);
    o23 = VL_RAND_RESET_I(8);
    o30 = VL_RAND_RESET_I(8);
    o31 = VL_RAND_RESET_I(8);
    o32 = VL_RAND_RESET_I(8);
    o33 = VL_RAND_RESET_I(8);
    __Vm_traceActivity = 0;
}
