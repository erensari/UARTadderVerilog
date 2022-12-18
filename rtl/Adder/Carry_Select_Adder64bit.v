`timescale 1ns / 1ps


module Full_Adder (
input g1,
input g2,
input cin,
output sum , cout

);

    wire w1, w2, w3;
    
    
    xor x1(w1 , g1 ,g2 );
    xor x2 (sum ,w1 , cin );
    and a1( w2,w1 ,cin);
    and a2 ( w3 ,g1,g2);
    or (cout , w2 ,w3);
    

endmodule

module mux2to1(
input a ,b, c,
output y 
);

assign y = c ? a : b;

endmodule

module Carry(
input x,
input y,
input cin,
input fa1_cin,
input fa2_cin,
output cout1,
output cout2,
output sum);

wire subsum1,subsum2;

Full_Adder f1(.g1(x),.g2(y),.cin(fa1_cin),.cout(cout1),.sum(subsum1));
Full_Adder f2(.g1(x),.g2(y),.cin(fa2_cin),.cout(cout2),.sum(subsum2));
mux2to1 m1(.a(sum1),.b(sum2),.c(cin),.y(sum));



endmodule

module Carry_Select_Adder64bit(
input [63:0]birinci ,
input [63:0]ikinci,
input anacin,
output [63:0]toplami,
output ctotal_o
    );
    
    wire [63:0]fa_out1;
    wire  [63:0]fa_out2;
Carry c1(.x(birinci[0]),.y(ikinci[0]),.cin(anacin),.fa1_cin(0),.fal2_cin(1),.cout1(fa_out1[0]),.cout2(fa_out2[0]),.sum(toplami[0]));
Carry c2(.x(birinci[1]),.y(ikinci[1]),.cin(anacin),.fa1_cin(fa_out1[0]),.fal2_cin(fa_out2[0]),.cout1(fa_out1[1]),.cout2(fa_out2[1]),.sum(toplami[1]));

Carry c3(.x(birinci[2]),.y(ikinci[2]),.cin(anacin),.fa1_cin(fa_out1[1]),.fal2_cin(fa_out2[1]),.cout1(fa_out1[2]),.cout2(fa_out2[2]),.sum(toplami[2]));
Carry c4(.x(birinci[3]),.y(ikinci[3]),.cin(anacin),.fa1_cin(fa_out1[2]),.fal2_cin(fa_out2[2]),.cout1(fa_out1[3]),.cout2(fa_out2[3]),.sum(toplami[3]));

Carry c5(.x(birinci[4]),.y(ikinci[4]),.cin(anacin),.fa1_cin(fa_out1[3]),.fal2_cin(fa_out2[3]),.cout1(fa_out1[4]),.cout2(fa_out2[4]),.sum(toplami[4]));
Carry c6(.x(birinci[5]),.y(ikinci[5]),.cin(anacin),.fa1_cin(fa_out1[4]),.fal2_cin(fa_out2[4]),.cout1(fa_out1[5]),.cout2(fa_out2[5]),.sum(toplami[5]));

Carry c7(.x(birinci[6]),.y(ikinci[6]),.cin(anacin),.fa1_cin(fa_out1[5]),.fal2_cin(fa_out2[5]),.cout1(fa_out1[6]),.cout2(fa_out2[6]),.sum(toplami[6]));
Carry c8(.x(birinci[7]),.y(ikinci[7]),.cin(anacin),.fa1_cin(fa_out1[6]),.fal2_cin(fa_out2[6]),.cout1(fa_out1[7]),.cout2(fa_out2[7]),.sum(toplami[7]));

Carry c9(.x(birinci[8]),.y(ikinci[8]),.cin(anacin),.fa1_cin(fa_out1[7]),.fal2_cin(fa_out2[7]),.cout1(fa_out1[8]),.cout2(fa_out2[8]),.sum(toplami[8]));
Carry c10(.x(birinci[9]),.y(ikinci[9]),.cin(anacin),.fa1_cin(fa_out1[8]),.fal2_cin(fa_out2[8]),.cout1(fa_out1[9]),.cout2(fa_out2[9]),.sum(toplami[9]));

Carry c11(.x(birinci[10]),.y(ikinci[10]),.cin(anacin),.fa1_cin(fa_out1[9]),.fal2_cin(fa_out2[9]),.cout1(fa_out1[10]),.cout2(fa_out2[10]),.sum(toplami[10]));
Carry c12(.x(birinci[11]),.y(ikinci[11]),.cin(anacin),.fa1_cin(fa_out1[10]),.fal2_cin(fa_out2[10]),.cout1(fa_out1[11]),.cout2(fa_out2[11]),.sum(toplami[11]));

Carry c13(.x(birinci[12]),.y(ikinci[12]),.cin(anacin),.fa1_cin(fa_out1[11]),.fal2_cin(fa_out2[11]),.cout1(fa_out1[12]),.cout2(fa_out2[12]),.sum(toplami[12]));
Carry c14(.x(birinci[13]),.y(ikinci[13]),.cin(anacin),.fa1_cin(fa_out1[12]),.fal2_cin(fa_out2[12]),.cout1(fa_out1[13]),.cout2(fa_out2[13]),.sum(toplami[13]));

Carry c15(.x(birinci[14]),.y(ikinci[14]),.cin(anacin),.fa1_cin(fa_out1[13]),.fal2_cin(fa_out2[13]),.cout1(fa_out1[14]),.cout2(fa_out2[14]),.sum(toplami[14]));
Carry c16(.x(birinci[15]),.y(ikinci[15]),.cin(anacin),.fa1_cin(fa_out1[14]),.fal2_cin(fa_out2[14]),.cout1(fa_out1[15]),.cout2(fa_out2[15]),.sum(toplami[15]));

Carry c17(.x(birinci[16]),.y(ikinci[16]),.cin(anacin),.fa1_cin(fa_out1[15]),.fal2_cin(fa_out2[15]),.cout1(fa_out1[16]),.cout2(fa_out2[16]),.sum(toplami[16]));
Carry c18(.x(birinci[17]),.y(ikinci[17]),.cin(anacin),.fa1_cin(fa_out1[16]),.fal2_cin(fa_out2[16]),.cout1(fa_out1[17]),.cout2(fa_out2[17]),.sum(toplami[17]));

Carry c19(.x(birinci[18]),.y(ikinci[18]),.cin(anacin),.fa1_cin(fa_out1[17]),.fal2_cin(fa_out2[17]),.cout1(fa_out1[18]),.cout2(fa_out2[18]),.sum(toplami[18]));
Carry c20(.x(birinci[19]),.y(ikinci[19]),.cin(anacin),.fa1_cin(fa_out1[18]),.fal2_cin(fa_out2[18]),.cout1(fa_out1[19]),.cout2(fa_out2[19]),.sum(toplami[19]));

Carry c21(.x(birinci[20]),.y(ikinci[20]),.cin(anacin),.fa1_cin(fa_out1[19]),.fal2_cin(fa_out2[19]),.cout1(fa_out1[20]),.cout2(fa_out2[20]),.sum(toplami[20]));
Carry c22(.x(birinci[21]),.y(ikinci[21]),.cin(anacin),.fa1_cin(fa_out1[20]),.fal2_cin(fa_out2[20]),.cout1(fa_out1[21]),.cout2(fa_out2[21]),.sum(toplami[21]));

Carry c23(.x(birinci[22]),.y(ikinci[22]),.cin(anacin),.fa1_cin(fa_out1[21]),.fal2_cin(fa_out2[21]),.cout1(fa_out1[22]),.cout2(fa_out2[22]),.sum(toplami[22]));
Carry c24(.x(birinci[23]),.y(ikinci[23]),.cin(anacin),.fa1_cin(fa_out1[22]),.fal2_cin(fa_out2[22]),.cout1(fa_out1[23]),.cout2(fa_out2[23]),.sum(toplami[23]));

Carry c25(.x(birinci[24]),.y(ikinci[24]),.cin(anacin),.fa1_cin(fa_out1[23]),.fal2_cin(fa_out2[23]),.cout1(fa_out1[24]),.cout2(fa_out2[24]),.sum(toplami[24]));
Carry c26(.x(birinci[25]),.y(ikinci[25]),.cin(anacin),.fa1_cin(fa_out1[24]),.fal2_cin(fa_out2[24]),.cout1(fa_out1[25]),.cout2(fa_out2[25]),.sum(toplami[25]));

Carry c27(.x(birinci[26]),.y(ikinci[26]),.cin(anacin),.fa1_cin(fa_out1[25]),.fal2_cin(fa_out2[25]),.cout1(fa_out1[26]),.cout2(fa_out2[26]),.sum(toplami[26]));
Carry c28(.x(birinci[27]),.y(ikinci[27]),.cin(anacin),.fa1_cin(fa_out1[26]),.fal2_cin(fa_out2[26]),.cout1(fa_out1[27]),.cout2(fa_out2[27]),.sum(toplami[27]));

Carry c29(.x(birinci[28]),.y(ikinci[28]),.cin(anacin),.fa1_cin(fa_out1[27]),.fal2_cin(fa_out2[27]),.cout1(fa_out1[28]),.cout2(fa_out2[28]),.sum(toplami[28]));
Carry c30(.x(birinci[29]),.y(ikinci[29]),.cin(anacin),.fa1_cin(fa_out1[28]),.fal2_cin(fa_out2[28]),.cout1(fa_out1[29]),.cout2(fa_out2[29]),.sum(toplami[29]));

Carry c31(.x(birinci[30]),.y(ikinci[30]),.cin(anacin),.fa1_cin(fa_out1[29]),.fal2_cin(fa_out2[29]),.cout1(fa_out1[30]),.cout2(fa_out2[30]),.sum(toplami[30]));
Carry c32(.x(birinci[31]),.y(ikinci[31]),.cin(anacin),.fa1_cin(fa_out1[30]),.fal2_cin(fa_out2[30]),.cout1(fa_out1[31]),.cout2(fa_out2[31]),.sum(toplami[31]));

Carry c33(.x(birinci[32]),.y(ikinci[32]),.cin(anacin),.fa1_cin(fa_out1[31]),.fal2_cin(fa_out2[31]),.cout1(fa_out1[32]),.cout2(fa_out2[32]),.sum(toplami[32]));
Carry c34(.x(birinci[33]),.y(ikinci[33]),.cin(anacin),.fa1_cin(fa_out1[32]),.fal2_cin(fa_out2[32]),.cout1(fa_out1[33]),.cout2(fa_out2[33]),.sum(toplami[33]));

Carry c35(.x(birinci[34]),.y(ikinci[34]),.cin(anacin),.fa1_cin(fa_out1[33]),.fal2_cin(fa_out2[33]),.cout1(fa_out1[34]),.cout2(fa_out2[34]),.sum(toplami[34]));
Carry c36(.x(birinci[35]),.y(ikinci[35]),.cin(anacin),.fa1_cin(fa_out1[34]),.fal2_cin(fa_out2[34]),.cout1(fa_out1[35]),.cout2(fa_out2[35]),.sum(toplami[35]));

Carry c37(.x(birinci[36]),.y(ikinci[36]),.cin(anacin),.fa1_cin(fa_out1[35]),.fal2_cin(fa_out2[35]),.cout1(fa_out1[36]),.cout2(fa_out2[36]),.sum(toplami[36]));
Carry c38(.x(birinci[37]),.y(ikinci[37]),.cin(anacin),.fa1_cin(fa_out1[36]),.fal2_cin(fa_out2[36]),.cout1(fa_out1[37]),.cout2(fa_out2[37]),.sum(toplami[37]));

Carry c39(.x(birinci[38]),.y(ikinci[38]),.cin(anacin),.fa1_cin(fa_out1[37]),.fal2_cin(fa_out2[37]),.cout1(fa_out1[38]),.cout2(fa_out2[38]),.sum(toplami[38]));
Carry c40(.x(birinci[39]),.y(ikinci[39]),.cin(anacin),.fa1_cin(fa_out1[38]),.fal2_cin(fa_out2[38]),.cout1(fa_out1[39]),.cout2(fa_out2[39]),.sum(toplami[39]));

Carry c41(.x(birinci[40]),.y(ikinci[40]),.cin(anacin),.fa1_cin(fa_out1[39]),.fal2_cin(fa_out2[39]),.cout1(fa_out1[40]),.cout2(fa_out2[40]),.sum(toplami[40]));
Carry c42(.x(birinci[41]),.y(ikinci[41]),.cin(anacin),.fa1_cin(fa_out1[40]),.fal2_cin(fa_out2[40]),.cout1(fa_out1[41]),.cout2(fa_out2[41]),.sum(toplami[41]));

Carry c43(.x(birinci[42]),.y(ikinci[42]),.cin(anacin),.fa1_cin(fa_out1[41]),.fal2_cin(fa_out2[41]),.cout1(fa_out1[42]),.cout2(fa_out2[42]),.sum(toplami[42]));
Carry c44(.x(birinci[43]),.y(ikinci[43]),.cin(anacin),.fa1_cin(fa_out1[42]),.fal2_cin(fa_out2[42]),.cout1(fa_out1[43]),.cout2(fa_out2[43]),.sum(toplami[43]));

Carry c45(.x(birinci[44]),.y(ikinci[44]),.cin(anacin),.fa1_cin(fa_out1[43]),.fal2_cin(fa_out2[43]),.cout1(fa_out1[44]),.cout2(fa_out2[44]),.sum(toplami[44]));
Carry c46(.x(birinci[45]),.y(ikinci[45]),.cin(anacin),.fa1_cin(fa_out1[44]),.fal2_cin(fa_out2[44]),.cout1(fa_out1[45]),.cout2(fa_out2[45]),.sum(toplami[45]));

Carry c47(.x(birinci[46]),.y(ikinci[46]),.cin(anacin),.fa1_cin(fa_out1[45]),.fal2_cin(fa_out2[45]),.cout1(fa_out1[46]),.cout2(fa_out2[46]),.sum(toplami[46]));
Carry c48(.x(birinci[47]),.y(ikinci[47]),.cin(anacin),.fa1_cin(fa_out1[46]),.fal2_cin(fa_out2[46]),.cout1(fa_out1[47]),.cout2(fa_out2[47]),.sum(toplami[47]));

Carry c49(.x(birinci[48]),.y(ikinci[48]),.cin(anacin),.fa1_cin(fa_out1[47]),.fal2_cin(fa_out2[47]),.cout1(fa_out1[48]),.cout2(fa_out2[48]),.sum(toplami[48]));
Carry c50(.x(birinci[49]),.y(ikinci[49]),.cin(anacin),.fa1_cin(fa_out1[48]),.fal2_cin(fa_out2[48]),.cout1(fa_out1[49]),.cout2(fa_out2[49]),.sum(toplami[49]));

Carry c51(.x(birinci[50]),.y(ikinci[50]),.cin(anacin),.fa1_cin(fa_out1[49]),.fal2_cin(fa_out2[49]),.cout1(fa_out1[50]),.cout2(fa_out2[50]),.sum(toplami[50]));
Carry c52(.x(birinci[51]),.y(ikinci[51]),.cin(anacin),.fa1_cin(fa_out1[50]),.fal2_cin(fa_out2[50]),.cout1(fa_out1[51]),.cout2(fa_out2[51]),.sum(toplami[51]));

Carry c53(.x(birinci[52]),.y(ikinci[52]),.cin(anacin),.fa1_cin(fa_out1[51]),.fal2_cin(fa_out2[51]),.cout1(fa_out1[52]),.cout2(fa_out2[52]),.sum(toplami[52]));
Carry c54(.x(birinci[53]),.y(ikinci[53]),.cin(anacin),.fa1_cin(fa_out1[52]),.fal2_cin(fa_out2[52]),.cout1(fa_out1[53]),.cout2(fa_out2[53]),.sum(toplami[53]));

Carry c55(.x(birinci[54]),.y(ikinci[54]),.cin(anacin),.fa1_cin(fa_out1[53]),.fal2_cin(fa_out2[53]),.cout1(fa_out1[54]),.cout2(fa_out2[54]),.sum(toplami[54]));
Carry c56(.x(birinci[55]),.y(ikinci[55]),.cin(anacin),.fa1_cin(fa_out1[54]),.fal2_cin(fa_out2[54]),.cout1(fa_out1[55]),.cout2(fa_out2[55]),.sum(toplami[55]));

Carry c57(.x(birinci[56]),.y(ikinci[56]),.cin(anacin),.fa1_cin(fa_out1[55]),.fal2_cin(fa_out2[55]),.cout1(fa_out1[56]),.cout2(fa_out2[56]),.sum(toplami[56]));
Carry c58(.x(birinci[57]),.y(ikinci[57]),.cin(anacin),.fa1_cin(fa_out1[56]),.fal2_cin(fa_out2[56]),.cout1(fa_out1[57]),.cout2(fa_out2[57]),.sum(toplami[57]));

Carry c59(.x(birinci[58]),.y(ikinci[58]),.cin(anacin),.fa1_cin(fa_out1[57]),.fal2_cin(fa_out2[57]),.cout1(fa_out1[58]),.cout2(fa_out2[58]),.sum(toplami[58]));
Carry c60(.x(birinci[59]),.y(ikinci[59]),.cin(anacin),.fa1_cin(fa_out1[58]),.fal2_cin(fa_out2[58]),.cout1(fa_out1[59]),.cout2(fa_out2[59]),.sum(toplami[59]));

Carry c61(.x(birinci[60]),.y(ikinci[60]),.cin(anacin),.fa1_cin(fa_out1[59]),.fal2_cin(fa_out2[59]),.cout1(fa_out1[60]),.cout2(fa_out2[60]),.sum(toplami[60]));
Carry c62(.x(birinci[61]),.y(ikinci[61]),.cin(anacin),.fa1_cin(fa_out1[60]),.fal2_cin(fa_out2[60]),.cout1(fa_out1[61]),.cout2(fa_out2[61]),.sum(toplami[61]));

Carry c63(.x(birinci[62]),.y(ikinci[62]),.cin(anacin),.fa1_cin(fa_out1[61]),.fal2_cin(fa_out2[61]),.cout1(fa_out1[62]),.cout2(fa_out2[62]),.sum(toplami[62]));
Carry c64(.x(birinci[63]),.y(ikinci[63]),.cin(anacin),.fa1_cin(fa_out1[62]),.fal2_cin(fa_out2[62]),.cout1(fa_out1[63]),.cout2(fa_out2[63]),.sum(toplami[63]));



 mux2to1 (.a(fa_out1[63]),.b(fa_out2[63]),.c(anacin),.y(ctotal_o));
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
