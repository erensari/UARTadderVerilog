`timescale 1ns / 1ps

module ripple_carry_adder_16bit(
input [15:0] a_i,
input [15:0] b_i, 
input cin_i, 
output [15:0] s_o, 
output cout_o
);

wire c1,c2,c3;

ripple_carry_adder_4bit RCA4_1(
.a_i(a_i[3:0]),
.b_i(b_i[3:0]),
.cin_i(cin_i),
.s_o(s_o[3:0]),
.cout_o(c1)
);


ripple_carry_adder_4bit RCA4_2(
.a_i(a_i[7:4]),
.b_i(b_i[7:4]),
.cin_i(c1),
.s_o(s_o[7:4]),
.cout_o(c2)
);

ripple_carry_adder_4bit RCA4_3(
.a_i(a_i[11:8]),
.b_i(b_i[11:8]),
.cin_i(c2),
.s_o(s_o[11:8]),
.cout_o(c3)
);

ripple_carry_adder_4bit RCA4_4(
.a_i(a_i[15:12]),
.b_i(b_i[15:12]),
.cin_i(c3),
.s_o(s_o[15:12]),
.cout_o(cout_o)
);

endmodule
