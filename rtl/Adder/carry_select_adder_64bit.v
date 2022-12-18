module carry_select_adder_64bit(
input [63:0] a_i,
input [63:0] b_i,
output [63:0] s_o, 
output cout_o
);

wire [63:0] sum0, sum1;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
wire cout0_0,cout0_1,cout1_0,cout1_1,cout2_0,cout2_1,cout3_0,cout3_1,cout4_0,cout4_1,cout5_0,cout5_1,cout6_0,cout6_1,cout7_0,cout7_1,cout8_0,cout8_1;
wire cout9_0,cout9_1,cout10_0,cout10_1,cout11_0,cout11_1,cout12_0,cout12_1,cout13_0,cout13_1,cout14_0,cout14_1,cout15_0,cout15_1;

ripple_carry_adder_4bit RCA1_0(.s_o(sum0[3:0]),.cout_o(cout0_0),.a_i(a_i[3:0]),.b_i(b_i[3:0]),.cin_i(0));
ripple_carry_adder_4bit RCA1_1(.s_o(sum1[3:0]),.cout_o(cout0_1),.a_i(a_i[3:0]),.b_i(b_i[3:0]),.cin_i(1));
mux_2x1_4bit mux0_sum(.out_o(s_o[3:0]),.i0_i(sum0[3:0]),.i1_i(sum1[3:0]),.sel_i(0));
mux_2x1_1bit mux0_cout( .out_o(c1), .i0_i(cout0_0), .i1_i(cout0_1), .sel_i(0));

ripple_carry_adder_4bit RCA2_0(.s_o(sum0[7:4]),.cout_o(cout1_0),.a_i(a_i[7:4]),.b_i(b_i[7:4]),.cin_i(0));
ripple_carry_adder_4bit RCA2_1(.s_o(sum1[7:4]),.cout_o(cout1_1),.a_i(a_i[7:4]),.b_i(b_i[7:4]),.cin_i(1));
mux_2x1_4bit mux1_sum(.out_o(s_o[7:4]),.i0_i(sum0[7:4]),.i1_i(sum1[7:4]),.sel_i(c1));
mux_2x1_1bit mux1_cout(.out_o(c2), .i0_i(cout1_0), .i1_i(cout1_1), .sel_i(c1));

ripple_carry_adder_4bit RCA3_0(.s_o(sum0[11:8]),.cout_o(cout2_0),.a_i(a_i[11:8]),.b_i(b_i[11:8]),.cin_i(0));
ripple_carry_adder_4bit RCA3_1(.s_o(sum1[11:8]),.cout_o(cout2_1),.a_i(a_i[11:8]),.b_i(b_i[11:8]),.cin_i(1));
mux_2x1_4bit mux2_sum(.out_o(s_o[11:8]), .i0_i(sum0[11:8]), .i1_i(sum1[11:8]), .sel_i(c2));
mux_2x1_1bit mux2_cout(.out_o(c3), .i0_i(cout2_0), .i1_i(cout2_1), .sel_i(c2));

ripple_carry_adder_4bit RCA4_0(.s_o(sum0[15:12]),.cout_o(cout3_0),.a_i(a_i[15:12]),.b_i(b_i[15:12]),.cin_i(0));
ripple_carry_adder_4bit RCA4_1(.s_o(sum1[15:12]),.cout_o(cout3_1),.a_i(a_i[15:12]),.b_i(b_i[15:12]),.cin_i(1));
mux_2x1_4bit mux3_sum(.out_o(s_o[15:12]), .i0_i(sum0[15:12]), .i1_i(sum1[15:12]), .sel_i(c3));
mux_2x1_1bit mux3_cout(.out_o(c4), .i0_i(cout3_0), .i1_i(cout3_1), .sel_i(c3));

ripple_carry_adder_4bit RCA5_0(.s_o(sum0[19:16]),.cout_o(cout4_0),.a_i(a_i[19:16]),.b_i(b_i[19:16]),.cin_i(0));
ripple_carry_adder_4bit RCA5_1(.s_o(sum1[19:16]),.cout_o(cout4_1),.a_i(a_i[19:16]),.b_i(b_i[19:16]),.cin_i(1));
mux_2x1_4bit mux4_sum(.out_o(s_o[19:16]), .i0_i(sum0[19:16]), .i1_i(sum1[19:16]), .sel_i(c4));
mux_2x1_1bit mux4_cout(.out_o(c5), .i0_i(cout4_0), .i1_i(cout4_1), .sel_i(c4));

ripple_carry_adder_4bit RCA6_0(.s_o(sum0[23:20]),.cout_o(cout5_0),.a_i(a_i[23:20]),.b_i(b_i[23:20]),.cin_i(0));
ripple_carry_adder_4bit RCA6_1(.s_o(sum1[23:20]),.cout_o(cout5_1),.a_i(a_i[23:20]),.b_i(b_i[23:20]),.cin_i(1));
mux_2x1_4bit mux5_sum(.out_o(s_o[23:20]), .i0_i(sum0[23:20]), .i1_i(sum1[23:20]), .sel_i(c5));
mux_2x1_1bit mux5_cout(.out_o(c6), .i0_i(cout5_0), .i1_i(cout5_1), .sel_i(c5));

ripple_carry_adder_4bit RCA7_0(.s_o(sum0[27:24]),.cout_o(cout6_0),.a_i(a_i[27:24]),.b_i(b_i[27:24]),.cin_i(0));
ripple_carry_adder_4bit RCA7_1(.s_o(sum1[27:24]),.cout_o(cout6_1),.a_i(a_i[27:24]),.b_i(b_i[27:24]),.cin_i(1));
mux_2x1_4bit mux6_sum(.out_o(s_o[27:24]), .i0_i(sum0[27:24]), .i1_i(sum1[27:24]), .sel_i(c6));
mux_2x1_1bit mux6_cout(.out_o(c7), .i0_i(cout6_0), .i1_i(cout6_1), .sel_i(c6));

ripple_carry_adder_4bit RCA8_0(.s_o(sum0[31:28]),.cout_o(cout7_0),.a_i(a_i[31:28]),.b_i(b_i[31:28]),.cin_i(0));
ripple_carry_adder_4bit RCA8_1(.s_o(sum1[31:28]),.cout_o(cout7_1),.a_i(a_i[31:28]),.b_i(b_i[31:28]),.cin_i(1));
mux_2x1_4bit mux7_sum(.out_o(s_o[31:28]), .i0_i(sum0[31:28]), .i1_i(sum1[31:28]), .sel_i(c7));
mux_2x1_1bit mux7_cout(.out_o(c8), .i0_i(cout7_0), .i1_i(cout7_1), .sel_i(c7));

ripple_carry_adder_4bit RCA9_0(.s_o(sum0[35:32]),.cout_o(cout7_0),.a_i(a_i[35:32]),.b_i(b_i[35:32]),.cin_i(0));
ripple_carry_adder_4bit RCA9_1(.s_o(sum1[35:32]),.cout_o(cout7_1),.a_i(a_i[35:32]),.b_i(b_i[35:32]),.cin_i(1));
mux_2x1_4bit mux8_sum(.out_o(s_o[35:32]), .i0_i(sum0[35:32]), .i1_i(sum1[35:32]), .sel_i(c8));
mux_2x1_1bit mux8_cout(.out_o(c9), .i0_i(cout8_0), .i1_i(cout8_1), .sel_i(c8));

ripple_carry_adder_4bit RCA10_0(.s_o(sum0[39:36]),.cout_o(cout8_0),.a_i(a_i[39:36]),.b_i(b_i[39:36]),.cin_i(0));
ripple_carry_adder_4bit RCA10_1(.s_o(sum1[39:36]),.cout_o(cout8_1),.a_i(a_i[39:36]),.b_i(b_i[39:36]),.cin_i(1));
mux_2x1_4bit mux9_sum(.out_o(s_o[39:36]), .i0_i(sum0[39:36]), .i1_i(sum1[39:36]), .sel_i(c9));
mux_2x1_1bit mux9_cout(.out_o(c10), .i0_i(cout9_0), .i1_i(cout9_1), .sel_i(c9));

ripple_carry_adder_4bit RCA11_0(.s_o(sum0[43:40]),.cout_o(cout8_0),.a_i(a_i[43:40]),.b_i(b_i[43:40]),.cin_i(0));
ripple_carry_adder_4bit RCA11_1(.s_o(sum1[43:40]),.cout_o(cout8_1),.a_i(a_i[43:40]),.b_i(b_i[43:40]),.cin_i(1));
mux_2x1_4bit mux10_sum(.out_o(s_o[43:40]), .i0_i(sum0[43:40]), .i1_i(sum1[43:40]), .sel_i(c10));
mux_2x1_1bit mux10_cout(.out_o(c11), .i0_i(cout10_0), .i1_i(cout10_1), .sel_i(c10));

ripple_carry_adder_4bit RCA12_0(.s_o(sum0[47:44]),.cout_o(cout8_0),.a_i(a_i[47:44]),.b_i(b_i[47:44]),.cin_i(0));
ripple_carry_adder_4bit RCA12_1(.s_o(sum1[47:44]),.cout_o(cout8_1),.a_i(a_i[47:44]),.b_i(b_i[47:44]),.cin_i(1));
mux_2x1_4bit mux11_sum(.out_o(s_o[47:44]), .i0_i(sum0[47:44]), .i1_i(sum1[47:44]), .sel_i(c11));
mux_2x1_1bit mux11_cout(.out_o(c12), .i0_i(cout11_0), .i1_i(cout11_1), .sel_i(c11));

ripple_carry_adder_4bit RCA13_0(.s_o(sum0[51:48]),.cout_o(cout8_0),.a_i(a_i[51:48]),.b_i(b_i[51:48]),.cin_i(0));
ripple_carry_adder_4bit RCA13_1(.s_o(sum1[51:48]),.cout_o(cout8_1),.a_i(a_i[51:48]),.b_i(b_i[51:48]),.cin_i(1));
mux_2x1_4bit mux12_sum(.out_o(s_o[51:48]), .i0_i(sum0[51:48]), .i1_i(sum1[51:48]), .sel_i(c12));
mux_2x1_1bit mux12_cout(.out_o(c13), .i0_i(cout12_0), .i1_i(cout12_1), .sel_i(c12));

ripple_carry_adder_4bit RCA14_0(.s_o(sum0[55:52]),.cout_o(cout8_0),.a_i(a_i[55:52]),.b_i(b_i[55:52]),.cin_i(0));
ripple_carry_adder_4bit RCA14_1(.s_o(sum1[55:52]),.cout_o(cout8_1),.a_i(a_i[55:52]),.b_i(b_i[55:52]),.cin_i(1));
mux_2x1_4bit mux13_sum(.out_o(s_o[55:52]), .i0_i(sum0[55:52]), .i1_i(sum1[55:52]), .sel_i(c13));
mux_2x1_1bit mux13_cout(.out_o(c14), .i0_i(cout13_0), .i1_i(cout13_1), .sel_i(c13));

ripple_carry_adder_4bit RCA15_0(.s_o(sum0[59:56]),.cout_o(cout8_0),.a_i(a_i[59:56]),.b_i(b_i[59:56]),.cin_i(0));
ripple_carry_adder_4bit RCA15_1(.s_o(sum1[59:56]),.cout_o(cout8_1),.a_i(a_i[59:56]),.b_i(b_i[59:56]),.cin_i(1));
mux_2x1_4bit mux14_sum(.out_o(s_o[59:56]), .i0_i(sum0[59:56]), .i1_i(sum1[59:56]), .sel_i(c14));
mux_2x1_1bit mux14_cout(.out_o(c15), .i0_i(cout14_0), .i1_i(cout14_1), .sel_i(c14));

ripple_carry_adder_4bit RCA16_0(.s_o(sum0[63:60]),.cout_o(cout8_0),.a_i(a_i[63:60]),.b_i(b_i[63:60]),.cin_i(0));
ripple_carry_adder_4bit RCA16_1(.s_o(sum1[63:60]),.cout_o(cout8_1),.a_i(a_i[63:60]),.b_i(b_i[63:60]),.cin_i(1));
mux_2x1_4bit mux15_sum(.out_o(s_o[63:60]), .i0_i(sum0[63:60]), .i1_i(sum1[63:60]), .sel_i(c15));
mux_2x1_1bit mux15_cout(.out_o(cout_o), .i0_i(cout15_0), .i1_i(cout15_1), .sel_i(c15));


endmodule