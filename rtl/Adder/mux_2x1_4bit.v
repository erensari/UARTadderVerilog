`timescale 1ns / 1ps

module mux_2x1_4bit(
input [3:0] i0_i,
input [3:0] i1_i,
input sel_i,
output [3:0] out_o
);

  wire [3:0] e0;
  wire [3:0] e1;
  wire notSel;
  
  not #(1) (notSel, sel_i);
  
  and #(1) (e0[0], i0_i[0], notSel);
  and #(1) (e0[1], i0_i[1], notSel);
  and #(1) (e0[2], i0_i[2], notSel);
  and #(1) (e0[3], i0_i[3], notSel);
      
  and #(1) (e1[0], i1_i[0], sel_i);
  and #(1) (e1[1], i1_i[1], sel_i);
  and #(1) (e1[2], i1_i[2], sel_i);
  and #(1) (e1[3], i1_i[3], sel_i);
  
  or #(1) (out_o[0], e0[0], e1[0]);
  or #(1) (out_o[1], e0[1], e1[1]);
  or #(1) (out_o[2], e0[2], e1[2]);
  or #(1) (out_o[3], e0[3], e1[3]);
  
endmodule