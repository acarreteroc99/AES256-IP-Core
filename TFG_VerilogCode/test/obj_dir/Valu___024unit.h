// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Valu.h for the primary calling header

#ifndef _VALU___024UNIT_H_
#define _VALU___024UNIT_H_  // guard

#include "verilated.h"

//==========

class Valu__Syms;
class Valu_VerilatedVcd;


//----------

VL_MODULE(Valu___024unit) {
  public:
    
    // TYPEDEFS
    // That were declared public
    enum operation_t {
        add = 1U,
        sub = 2U,
        nop = 0U
    };
    
    // INTERNAL VARIABLES
  private:
    Valu__Syms* __VlSymsp;  // Symbol table
  public:
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Valu___024unit);  ///< Copying not allowed
  public:
    Valu___024unit(const char* name = "TOP");
    ~Valu___024unit();
    
    // INTERNAL METHODS
    void __Vconfigure(Valu__Syms* symsp, bool first);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
