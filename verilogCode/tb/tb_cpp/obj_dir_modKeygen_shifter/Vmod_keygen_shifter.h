// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VMOD_KEYGEN_SHIFTER_H_
#define _VMOD_KEYGEN_SHIFTER_H_  // guard

#include "verilated.h"

//==========

class Vmod_keygen_shifter__Syms;
class Vmod_keygen_shifter_VerilatedVcd;


//----------

VL_MODULE(Vmod_keygen_shifter) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(p00,7,0);
    VL_IN8(p01,7,0);
    VL_IN8(p02,7,0);
    VL_IN8(p03,7,0);
    VL_OUT8(o00,7,0);
    VL_OUT8(o01,7,0);
    VL_OUT8(o02,7,0);
    VL_OUT8(o03,7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    IData/*31:0*/ __Vm_traceActivity;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vmod_keygen_shifter__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vmod_keygen_shifter);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vmod_keygen_shifter(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vmod_keygen_shifter();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vmod_keygen_shifter__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vmod_keygen_shifter__Syms* symsp, bool first);
  private:
    static QData _change_request(Vmod_keygen_shifter__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__1(Vmod_keygen_shifter__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vmod_keygen_shifter__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vmod_keygen_shifter__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vmod_keygen_shifter__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(Vmod_keygen_shifter__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
