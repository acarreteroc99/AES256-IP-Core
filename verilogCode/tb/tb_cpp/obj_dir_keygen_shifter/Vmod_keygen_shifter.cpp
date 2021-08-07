// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmod_keygen_shifter.h for the primary calling header

#include "Vmod_keygen_shifter.h"
#include "Vmod_keygen_shifter__Syms.h"

//==========

VL_CTOR_IMP(Vmod_keygen_shifter) {
    Vmod_keygen_shifter__Syms* __restrict vlSymsp = __VlSymsp = new Vmod_keygen_shifter__Syms(this, name());
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vmod_keygen_shifter::__Vconfigure(Vmod_keygen_shifter__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vmod_keygen_shifter::~Vmod_keygen_shifter() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void Vmod_keygen_shifter::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vmod_keygen_shifter::eval\n"); );
    Vmod_keygen_shifter__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("../../design/mod_keygen_shifter.sv", 7, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vmod_keygen_shifter::_eval_initial_loop(Vmod_keygen_shifter__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("../../design/mod_keygen_shifter.sv", 7, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vmod_keygen_shifter::_combo__TOP__1(Vmod_keygen_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_combo__TOP__1\n"); );
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->o00 = vlTOPp->p01;
    vlTOPp->o01 = vlTOPp->p02;
    vlTOPp->o02 = vlTOPp->p03;
    vlTOPp->o03 = vlTOPp->p00;
}

void Vmod_keygen_shifter::_eval(Vmod_keygen_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_eval\n"); );
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

void Vmod_keygen_shifter::_eval_initial(Vmod_keygen_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_eval_initial\n"); );
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vmod_keygen_shifter::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::final\n"); );
    // Variables
    Vmod_keygen_shifter__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vmod_keygen_shifter::_eval_settle(Vmod_keygen_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_eval_settle\n"); );
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

VL_INLINE_OPT QData Vmod_keygen_shifter::_change_request(Vmod_keygen_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_change_request\n"); );
    Vmod_keygen_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vmod_keygen_shifter::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
}
#endif  // VL_DEBUG

void Vmod_keygen_shifter::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_keygen_shifter::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    p00 = VL_RAND_RESET_I(8);
    p01 = VL_RAND_RESET_I(8);
    p02 = VL_RAND_RESET_I(8);
    p03 = VL_RAND_RESET_I(8);
    o00 = VL_RAND_RESET_I(8);
    o01 = VL_RAND_RESET_I(8);
    o02 = VL_RAND_RESET_I(8);
    o03 = VL_RAND_RESET_I(8);
    __Vm_traceActivity = 0;
}
