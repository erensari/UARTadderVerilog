`timescale 1ns / 1ps

module carry_look_ahead_4bit(
input [3:0] a_i,
input [3:0] b_i,
input cin_i,
output [3:0] s_o,
output cout_o
);

wire [3:0] p;
wire [3:0] g;
wire [3:0] c;

//propagate
assign p = a_i ^ b_i; 
//generate
assign g = a_i & b_i; 

assign c[0] = cin_i;
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
assign cout_o = g[3] | (p[3] & g[2]) | (p[3] &p[2] &g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1]& p[0]& c[0]);
assign s_o = p ^ c;

endmodule
