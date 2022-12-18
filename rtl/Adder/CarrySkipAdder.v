`timescale 1ns / 1ps


// Carry Skip Adder - 64 bits
module CarrySkipAdder(output [63:0] sum, output cout, input [63:0] a, b);
  
  wire [15:0] couts;
  wire [14:0] e;
  
  RCA4 rca0(sum[3:0], couts[0], a[3:0], b[3:0], 0);
  RCA4 rca[15:1](sum[63:4], couts[15:1], a[63:4], b[63:4], e[14:0]);
  
  SkipLogic skip0(e[0], a[3:0], b[3:0], 0, couts[0]);
  SkipLogic skip[14:1](e[14:1], a[59:4], b[59:4], e[13:0], couts[14:1]);
  SkipLogic skip15(cout, a[63:60], b[63:60], e[14], couts[15]);
  
endmodule


// Full Adder
module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor (w0, a, b);
  xor (sum, w0, cin);
  
  and (w1, w0, cin);
  and (w2, a, b);
  or (cout, w1, w2);
endmodule

// Ripple Carry Adder - 4 bits
module RCA4(output [3:0] sum, output cout, input [3:0] a, b, input cin);
  
  wire [3:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], cin);
  FA fa[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
  FA fa31(sum[3], cout, a[3], b[3], c[3]);
  
endmodule

module SkipLogic(output cin_next,
  input [3:0] a, b, input cin, cout);
  
  wire p0, p1, p2, p3, P, e;
  
  or (p0, a[0], b[0]);
  or (p1, a[1], b[1]);
  or (p2, a[2], b[2]);
  or (p3, a[3], b[3]);
  
  and (P, p0, p1, p2, p3);
  and (e, P, cin);
  
  or (cin_next, e, cout);

endmodule
