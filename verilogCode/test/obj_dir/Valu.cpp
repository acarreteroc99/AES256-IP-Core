// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Valu.h for the primary calling header

#include "Valu.h"
#include "Valu__Syms.h"

//==========

VL_CTOR_IMP(Valu) {
    Valu__Syms* __restrict vlSymsp = __VlSymsp = new Valu__Syms(this, name());
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    VL_CELL(__PVT____024unit, Valu___024unit);
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Valu::__Vconfigure(Valu__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Valu::~Valu() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void Valu::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Valu::eval\n"); );
    Valu__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("alu.sv", 8, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Valu::_eval_initial_loop(Valu__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("alu.sv", 8, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Valu::_sequent__TOP__1(Valu__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_sequent__TOP__1\n"); );
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->out = ((IData)(vlTOPp->rst) ? 0U : (IData)(vlTOPp->alu__DOT__result));
    vlTOPp->alu__DOT__b_in_r = ((IData)(vlTOPp->rst)
                                 ? 0U : (IData)(vlTOPp->b_in));
    vlTOPp->alu__DOT__a_in_r = ((IData)(vlTOPp->rst)
                                 ? 0U : (IData)(vlTOPp->a_in));
    vlTOPp->alu__DOT__op_in_r = ((IData)(vlTOPp->rst)
                                  ? 0U : (IData)(vlTOPp->op_in));
    vlTOPp->out_valid = ((~ (IData)(vlTOPp->rst)) & (IData)(vlTOPp->alu__DOT__in_valid_r));
    vlTOPp->alu__DOT__in_valid_r = ((~ (IData)(vlTOPp->rst)) 
                                    & (IData)(vlTOPp->in_valid));
    vlTOPp->alu__DOT__result = 0U;
    if (vlTOPp->alu__DOT__in_valid_r) {
        vlTOPp->alu__DOT__result = (0x3fU & ((1U == (IData)(vlTOPp->alu__DOT__op_in_r))
                                              ? ((IData)(vlTOPp->alu__DOT__a_in_r) 
                                                 + (IData)(vlTOPp->alu__DOT__b_in_r))
                                              : ((2U 
                                                  == (IData)(vlTOPp->alu__DOT__op_in_r))
                                                  ? 
                                                 ((IData)(1U) 
                                                  + 
                                                  ((IData)(vlTOPp->alu__DOT__a_in_r) 
                                                   + 
                                                   (~ (IData)(vlTOPp->alu__DOT__b_in_r))))
                                                  : 0U)));
    }
}

void Valu::_settle__TOP__2(Valu__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_settle__TOP__2\n"); );
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->alu__DOT__result = 0U;
    if (vlTOPp->alu__DOT__in_valid_r) {
        vlTOPp->alu__DOT__result = (0x3fU & ((1U == (IData)(vlTOPp->alu__DOT__op_in_r))
                                              ? ((IData)(vlTOPp->alu__DOT__a_in_r) 
                                                 + (IData)(vlTOPp->alu__DOT__b_in_r))
                                              : ((2U 
                                                  == (IData)(vlTOPp->alu__DOT__op_in_r))
                                                  ? 
                                                 ((IData)(1U) 
                                                  + 
                                                  ((IData)(vlTOPp->alu__DOT__a_in_r) 
                                                   + 
                                                   (~ (IData)(vlTOPp->alu__DOT__b_in_r))))
                                                  : 0U)));
    }
}

void Valu::_eval(Valu__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_eval\n"); );
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if ((((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk))) 
         | ((IData)(vlTOPp->rst) & (~ (IData)(vlTOPp->__Vclklast__TOP__rst))))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
        vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP__rst = vlTOPp->rst;
}

void Valu::_eval_initial(Valu__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_eval_initial\n"); );
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP__rst = vlTOPp->rst;
}

void Valu::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::final\n"); );
    // Variables
    Valu__Syms* __restrict vlSymsp = this->__VlSymsp;
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Valu::_eval_settle(Valu__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_eval_settle\n"); );
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__2(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

VL_INLINE_OPT QData Valu::_change_request(Valu__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_change_request\n"); );
    Valu* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Valu::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((rst & 0xfeU))) {
        Verilated::overWidthError("rst");}
    if (VL_UNLIKELY((op_in & 0xfcU))) {
        Verilated::overWidthError("op_in");}
    if (VL_UNLIKELY((a_in & 0xc0U))) {
        Verilated::overWidthError("a_in");}
    if (VL_UNLIKELY((b_in & 0xc0U))) {
        Verilated::overWidthError("b_in");}
    if (VL_UNLIKELY((in_valid & 0xfeU))) {
        Verilated::overWidthError("in_valid");}
}
#endif  // VL_DEBUG

void Valu::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    rst = VL_RAND_RESET_I(1);
    op_in = VL_RAND_RESET_I(2);
    a_in = VL_RAND_RESET_I(6);
    b_in = VL_RAND_RESET_I(6);
    in_valid = VL_RAND_RESET_I(1);
    out = VL_RAND_RESET_I(6);
    out_valid = VL_RAND_RESET_I(1);
    alu__DOT__op_in_r = VL_RAND_RESET_I(2);
    alu__DOT__a_in_r = VL_RAND_RESET_I(6);
    alu__DOT__b_in_r = VL_RAND_RESET_I(6);
    alu__DOT__in_valid_r = VL_RAND_RESET_I(1);
    alu__DOT__result = VL_RAND_RESET_I(6);
    __Vm_traceActivity = 0;
}
