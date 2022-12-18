`timescale 1ns / 1ps

module tb_carry_select_adder_64bit(

);
    
reg [63:0] a_i;
reg [63:0] b_i; 
wire [63:0] s_o; 
wire cout_o;

carry_select_adder_64bit uut(
.a_i(a_i),
.b_i(b_i),
.s_o(s_o),
.cout_o(cout_o)
);

initial begin
a_i = 64'd36; b_i = 64'd47;  #10;
a_i = 64'd23; b_i = 64'd1; #10;
a_i = 64'd1453; b_i = 64'd571; #10; 
a_i = 64'd1071; b_i = 64'd51; #10;
end
endmodule
