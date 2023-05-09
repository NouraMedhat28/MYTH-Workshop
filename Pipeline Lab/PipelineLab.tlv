\m5_TLV_version 1d: tl-x.org
\m5

   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================

   //use(m5-0.1)   // uncomment to use M5 macro library.
\SV
   `include "sqrt32.v"
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   |comp
      @1
         $err1 = $bad_input || $illegal_op;
      @2
         $err1 = $err1;
      @3
         $err2 = $err1 || $over_flow;
      @4
         $err2 = $err2;
      @5
         $err2 = $err2;
      @6
         $err3 = $div_by_zero || $err2;

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
