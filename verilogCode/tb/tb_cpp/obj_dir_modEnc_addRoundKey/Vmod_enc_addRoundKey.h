// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VMOD_ENC_ADDROUNDKEY_H_
#define _VMOD_ENC_ADDROUNDKEY_H_  // guard

#include "verilated.h"

//==========

class Vmod_enc_addRoundKey__Syms;
class Vmod_enc_addRoundKey_VerilatedVcd;


//----------

VL_MODULE(Vmod_enc_addRoundKey) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(p00,7,0);
    VL_IN8(k00,7,0);
    VL_IN8(p01,7,0);
    VL_IN8(k01,7,0);
    VL_IN8(p02,7,0);
    VL_IN8(k02,7,0);
    VL_IN8(p03,7,0);
    VL_IN8(k03,7,0);
    VL_IN8(p10,7,0);
    VL_IN8(k10,7,0);
    VL_IN8(p11,7,0);
    VL_IN8(k11,7,0);
    VL_IN8(p12,7,0);
    VL_IN8(k12,7,0);
    VL_IN8(p13,7,0);
    VL_IN8(k13,7,0);
    VL_IN8(p20,7,0);
    VL_IN8(k20,7,0);
    VL_IN8(p21,7,0);
    VL_IN8(k21,7,0);
    VL_IN8(p22,7,0);
    VL_IN8(k22,7,0);
    VL_IN8(p23,7,0);
    VL_IN8(k23,7,0);
    VL_IN8(p30,7,0);
    VL_IN8(k30,7,0);
    VL_IN8(p31,7,0);
    VL_IN8(k31,7,0);
    VL_IN8(p32,7,0);
    VL_IN8(k32,7,0);
    VL_IN8(p33,7,0);
    VL_IN8(k33,7,0);
    VL_OUT8(out0,7,0);
    VL_OUT8(out8,7,0);
    VL_OUT8(out1,7,0);
    VL_OUT8(out9,7,0);
    VL_OUT8(out2,7,0);
    VL_OUT8(out10,7,0);
    VL_OUT8(out3,7,0);
    VL_OUT8(out11,7,0);
    VL_OUT8(out4,7,0);
    VL_OUT8(out12,7,0);
    VL_OUT8(out5,7,0);
    VL_OUT8(out13,7,0);
    VL_OUT8(out6,7,0);
    VL_OUT8(out14,7,0);
    VL_OUT8(out7,7,0);
    VL_OUT8(out15,7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    IData/*31:0*/ __Vm_traceActivity;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vmod_enc_addRoundKey__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vmod_enc_addRoundKey);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vmod_enc_addRoundKey(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vmod_enc_addRoundKey();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vmod_enc_addRoundKey__Syms* symsp, bool first);
  private:
    static QData _change_request(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__1(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(Vmod_enc_addRoundKey__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
