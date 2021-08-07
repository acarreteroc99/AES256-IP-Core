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
            VL_FATAL_MT("tb_mod_enc_shifter.sv", 3, "",
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
            VL_FATAL_MT("tb_mod_enc_shifter.sv", 3, "",
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
    vlTOPp->tb_mod_enc_shifter__DOT__clk = (1U & (~ (IData)(vlTOPp->tb_mod_enc_shifter__DOT__clk)));
}

void Vmod_enc_shifter::_initial__TOP__3(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_initial__TOP__3\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_mod_enc_shifter__DOT__p00 = 0U;
    vlTOPp->tb_mod_enc_shifter__DOT__p01 = 1U;
    vlTOPp->tb_mod_enc_shifter__DOT__p02 = 2U;
    vlTOPp->tb_mod_enc_shifter__DOT__p03 = 3U;
    vlTOPp->tb_mod_enc_shifter__DOT__p10 = 0x10U;
    vlTOPp->tb_mod_enc_shifter__DOT__p11 = 0x11U;
    vlTOPp->tb_mod_enc_shifter__DOT__p12 = 0x12U;
    vlTOPp->tb_mod_enc_shifter__DOT__p13 = 0x13U;
    vlTOPp->tb_mod_enc_shifter__DOT__p20 = 0x20U;
    vlTOPp->tb_mod_enc_shifter__DOT__p21 = 0x21U;
    vlTOPp->tb_mod_enc_shifter__DOT__p22 = 0x22U;
    vlTOPp->tb_mod_enc_shifter__DOT__p23 = 0x23U;
    vlTOPp->tb_mod_enc_shifter__DOT__p30 = 0x30U;
    vlTOPp->tb_mod_enc_shifter__DOT__p31 = 0x31U;
    vlTOPp->tb_mod_enc_shifter__DOT__p32 = 0x32U;
    vlTOPp->tb_mod_enc_shifter__DOT__p33 = 0x33U;
}

void Vmod_enc_shifter::_eval(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
    vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
}

void Vmod_enc_shifter::_eval_initial(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval_initial\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_initial__TOP__3(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
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
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

VL_INLINE_OPT QData Vmod_enc_shifter::_change_request(Vmod_enc_shifter__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_change_request\n"); );
    Vmod_enc_shifter* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->tb_mod_enc_shifter__DOT__clk ^ vlTOPp->__Vchglast__TOP__tb_mod_enc_shifter__DOT__clk));
    VL_DEBUG_IF( if(__req && ((vlTOPp->tb_mod_enc_shifter__DOT__clk ^ vlTOPp->__Vchglast__TOP__tb_mod_enc_shifter__DOT__clk))) VL_DBG_MSGF("        CHANGE: tb_mod_enc_shifter.sv:6: tb_mod_enc_shifter.clk\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__tb_mod_enc_shifter__DOT__clk 
        = vlTOPp->tb_mod_enc_shifter__DOT__clk;
    return __req;
}

#ifdef VL_DEBUG
void Vmod_enc_shifter::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_eval_debug_assertions\n"); );
}
#endif  // VL_DEBUG

void Vmod_enc_shifter::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmod_enc_shifter::_ctor_var_reset\n"); );
    // Body
    tb_mod_enc_shifter__DOT__clk = VL_RAND_RESET_I(1);
    tb_mod_enc_shifter__DOT__p00 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p01 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p02 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p03 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p10 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p11 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p12 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p13 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p20 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p21 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p22 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p23 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p30 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p31 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p32 = VL_RAND_RESET_I(8);
    tb_mod_enc_shifter__DOT__p33 = VL_RAND_RESET_I(8);
    __Vchglast__TOP__tb_mod_enc_shifter__DOT__clk = VL_RAND_RESET_I(1);
    __Vm_traceActivity = 0;
}
