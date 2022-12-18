`timescale 1ns / 1ps


module test_carry_select_adder(

    );
    
    reg [63:0]test_giris1;
    reg [63:0]test_giris2;
    reg prime_cin;
    wire [63:0]added;
    wire c_total_t;
    
    Carry_Select_Adder64bit test(.birinci(test_giris1),.ikinci(test_giris2),.anacin(primecin),.added(toplami),.total_o(c_total_t));
    
    
    
    initial begin
    
    test_giris1 =  64'd3846;
    test_giris2 = 64'd2342;
    prime_cin = 1 ;
    
    #100
    
    test_giris1 =  64'd3846;
    test_giris2 = 64'd2342;
    prime_cin = 0 ;
    
    #100
    
    test_giris1 =  64'd2006;
    test_giris2 = 64'd2006;
    prime_cin = 1 ;
    
    #100
    
    test_giris1 =  64'd2006;
    test_giris2 = 64'd2006;
    prime_cin = 0 ;
    
    #100
    
    test_giris1 =  64'd0000;
    test_giris2 = 64'd0000;
    prime_cin = 1 ;
    
    #100
    
    test_giris1 =  64'd0000;
    test_giris2 = 64'd0000;
    prime_cin = 0 ;
    
    #100
    
    test_giris1 =  64'd0012;
    test_giris2 = 64'd0300;
    prime_cin = 1 ;
    
    #100
    
    test_giris1 =  64'd0012;
    test_giris2 = 64'd0300;
    prime_cin = 0 ;
    
    #100
    
    test_giris1 =  64'd0200;
    test_giris2 = 64'd0016;
    prime_cin = 1 ;
    
    #100
    
    test_giris1 =  64'd0200;
    test_giris2 = 64'd0016;
    prime_cin = 0 ;
    
    end   
    
    
endmodule
