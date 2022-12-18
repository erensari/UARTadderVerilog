`timescale 1ns / 1ps


module bil265_proje_top(
input clk, // clock
input rst_n, // active-low reset
input btnl_i, // Left button
input btnu_i, // Upper button
input btnr_i, // Right button
input btnd_i, // Down button
input rx_i, // UART receive
output tx_o // UART transmit
    );
  wire rxlk,txlk; 
  wire [151:0]dout_o;
  wire rx_done_o; 
  baudrategenerator b_r_g (clk,rxlk,txlk);
  
  wire [63:0] sayi_1  ;
  wire [63:0] sayi_2 ;
  Receiver receiver (rxlk,rx_i,dout_o,rx_done_o); 
   assign  sayi_1 = dout_o[127:64];
   assign  sayi_2 = dout_o[63:0];
     
  reg [63:0]sum_cla;
  carry_look_adder_64bit cla(sayi_1,sayi_2,1'b0,sum_cla,1'b0);
  
  reg [63:0]sum_csa;
  CarrySkipAdder csa(sayi_1,sayi_2,sum_csa);
  
  reg [63:0]sum_ra;
  ripple_adder_64bit ra(sayi_1,sayi_2,1'b0,sum_ra,1'b0);
  
    reg [63:0]sum_csla;
  carry_selec_adder_64bit csla(sayi_1,sayi_2,sum_csla,1'b0);
  
  
  wire tx,tx_done_tick_o;
  reg [87:0] baslik;
  reg [7:0] checksum;
always @(posedge clk,negedge rst_n) begin 
if(!rst_n)begin
 baslik <=0 ;
 checksum <= 0;
end
else begin
    baslik[87:72] = 16'hBAFD;
    if(btnl_i)begin
     checksum <= (16'hBAFD + sum_cla)%256;
     baslik[71:8] <= sum_cla; 
     baslik[7:0] <= checksum;
    end
    else if(btnu_i)begin
     checksum <= (16'hBAFD + sum_csa)%256;
     baslik[71:8] <= sum_csa; 
     baslik[7:0] <= checksum;
    end
     else if(btnr_i)begin
     checksum <= (16'hBAFD + sum_ra)%256;
     baslik[71:8] <= sum_ra; 
     baslik[7:0] <= checksum;
    end
     else if(btnu_i)begin
     checksum <= (16'hBAFD + sum_csla)%256;
     baslik[71:8] <= sum_csla; 
     baslik[7:0] <= checksum;
    end
    
    end
   
 end
 
 Transmitter tranmitter(baslik,1'b1,tx_o,tx_done_tick_o); 
 
 
endmodule

   
