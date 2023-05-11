\m5_TLV_version 1d: tl-x.org
\m5

   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================

   //use(m5-0.1)   // uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   `include "sqrt32.v";
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   
   |pythagoras
      @1 
         $reset = *reset;
      ?$valid
         @1 
            $aa_sq[8:0] = $aa[3:0] * $aa[3:0];
            $bb_sq[8:0] = $bb[3:0] * $bb[3:0];
         @2
            $cc_sq[9:0] = $aa_sq + $bb_sq;
         @3
            $cc[4:0] = sqrt($cc_sq);
      @4
         $tot_dist[15:0] =
              $reset? '0:
              $valid? >>1$tot_dist + $cc:
                      $RETAIN;
         


   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule


