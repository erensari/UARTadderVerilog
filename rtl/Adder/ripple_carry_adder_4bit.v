`timescale 1ns / 1ps

module ripple_carry_adder_4bit(
input [3:0] a_i,
input [3:0] b_i, 
input cin_i, 
output [3:0] s_o, 
output cout_o
);

wire c1,c2,c3;

full_adder FA1(
.a_i(a_i[0]),
.b_i(b_i[0]),
.cin_i(cin_i),
.s_o(s_o[0]),
.cout_o(c1)
);


full_adder FA2(
.a_i(a_i[1]),
.b_i(b_i[1]),
.cin_i(c1),
.s_o(s_o[1]),
.cout_o(c2)
);

full_adder FA3(
.a_i(a_i[2]),
.b_i(b_i[2]),
.cin_i(c2),
.s_o(s_o[2]),
.cout_o(c3)
);

full_adder FA4(
.a_i(a_i[3]),
.b_i(b_i[3]),
.cin_i(c3),
.s_o(s_o[3]),
.cout_o(cout_o)
);

endmodule
