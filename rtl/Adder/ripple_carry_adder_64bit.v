`timescale 1ns / 1ps

module ripple_carry_adder_64bit(
input [63:0] a_i,
input [63:0] b_i, 
input cin_i, 
output [63:0] s_o, 
output cout_o
);

wire c1,c2,c3;

ripple_carry_adder_16bit RCA16_1(
.a_i(a_i[15:0]),
.b_i(b_i[15:0]),
.cin_i(cin_i),
.s_o(s_o[15:0]),
.cout_o(c1)
);


ripple_carry_adder_16bit RCA16_2(
.a_i(a_i[31:16]),
.b_i(b_i[31:16]),
.cin_i(c1),
.s_o(s_o[31:16]),
.cout_o(c2)
);

ripple_carry_adder_16bit RCA16_3(
.a_i(a_i[47:32]),
.b_i(b_i[47:32]),
.cin_i(c2),
.s_o(s_o[47:32]),
.cout_o(c3)
);

ripple_carry_adder_16bit RCA16_4(
.a_i(a_i[63:48]),
.b_i(b_i[63:48]),
.cin_i(c3),
.s_o(s_o[63:48]),
.cout_o(cout_o)
);

endmodule
