\m5_TLV_version 1d: tl-x.org
\m5

   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================

   //use(m5-0.1)   // uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   |calc
      @0
         $reset = *reset;
      @1
         $val1[31:0] = >>1$out[31:0];
         $val2[31:0] = $rand2[1:0];
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $sub[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31:0] * $val2[31:0];
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         $out[31:0] = ($reset? 0: ($op[0]? $sum : ($op[1]? $sub : ($op[2]? $prod : $quot))));
         $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1);

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule