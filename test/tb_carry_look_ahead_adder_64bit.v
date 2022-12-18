`timescale 1ns / 1ps

module tb_carry_look_ahead_adder_64bit(
    
    );
reg [63:0] a_i;
reg [63:0] b_i; 
reg cin_i;
wire [63:0] s_o; 
wire cout_o;

carry_look_ahead_adder_64bit uut(
.a_i(a_i),
.b_i(b_i),
.cin_i(cin_i),
.s_o(s_o),
.cout_o(cout_o)
);

initial begin
a_i = 64'd23; b_i = 64'd81; cin_i = 1'b0; #10;
a_i = 64'd617; b_i = 64'd65; cin_i = 1'b0; #10;
a_i = 64'd635; b_i = 64'd1617; cin_i = 1'b0; #10; 
a_i = 64'd3658; b_i = 64'd1456; cin_i = 1'b0; #10;
end

endmodule
