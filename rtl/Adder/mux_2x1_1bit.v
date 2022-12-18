`timescale 1ns / 1ps

module mux_2x1_1bit(
input i0_i, 
input i1_i, 
input sel_i,
output out_o
);

  wire e0;
  wire e1;
  wire notSel;
  
  not #(1) (notSel, sel_i);
  
  and #(1) (e0, i0_i, notSel);
  and #(1) (e1, i1_i, sel_i);
  
  or #(1) (out_o, e0, e1);
  
endmodule