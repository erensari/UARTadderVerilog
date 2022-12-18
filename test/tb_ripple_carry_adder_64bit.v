`timescale 1ns / 1ps

module tb_ripple_carry_adder_64bit(

    );

reg [63:0] a_i;
reg [63:0] b_i; 
reg cin_i;
wire [63:0] s_o; 
wire cout_o;

ripple_carry_adder_64bit uut(
.a_i(a_i),
.b_i(b_i),
.cin_i(cin_i),
.s_o(s_o),
.cout_o(cout_o)
);

initial begin
a_i = 64'd20; b_i = 64'd20; cin_i = 1'b0; #10;
a_i = 64'd1; b_i = 64'd1; cin_i = 1'b0; #10;
a_i = 64'd1000; b_i = 64'd1000; cin_i = 1'b0; #10; 
a_i = 64'd9999; b_i = 64'd1; cin_i = 1'b0; #10;
end

endmodule
