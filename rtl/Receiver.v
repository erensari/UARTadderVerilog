`timescale 1ns / 1ps

module Receiver #(parameter c_clkfreq = 100000000, c_baudrate =115200)(
    input clk,
    input rx_i,
    output [151:0]dout_o,
    output reg rx_done_o
    );
    
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;
    localparam bittimer_lim = (c_clkfreq / c_baudrate);
    
    reg [1:0]state;
    reg [bittimer_lim:0] bittimer;
    reg [7:0] bitcntr; 
    reg [7:0] shreg;
    
    reg [143:0] paket;
    reg [15:0] baslik;
    reg [63:0] sayi1;
    reg [63:0] sayi2;
    reg [7:0] checksum;
    reg [7:0] sayac = 8'd143;
    reg [4:0] sayiSayaci = 0;
    
        
    always @(posedge clk)begin
        case (state)
          IDLE  : begin
                     rx_done_o <= 0;
                     bittimer <= 0;
                     if (rx_i == 0)
                        state <= START;
                   end
          START  : begin
                     if(bittimer == bittimer_lim/2-1) begin
                        state <= DATA;
                        bittimer <= 0;
                     end
                     else
                        bittimer <= bittimer +1;
                        
                   end
          DATA  : begin
                      

                      if ( bittimer == bittimer_lim-1 )begin
                            if(bitcntr == 7)begin
                                state <= STOP;
                                bitcntr <= 0;
                                paket[sayac-:8] <= shreg;
                                if (sayac != 0)
                                    sayac <= sayac - 8 ;
                                else
                                    sayac = 8'd143;  
                                    
                                if(paket[143:128] == 16'b1011_1010_1100_1101)begin//0xBACD
                                    sayiSayaci <= sayiSayaci + 1;
                                    baslik = 16'b1011_1010_1100_1101;
                                end
                                else
                                    sayiSayaci <= 0;
                                    
                                if (sayiSayaci == 8)
                                    sayi1 = paket[127:64];
                                if (sayiSayaci == 16)
                                    sayi2 = paket[63:0];    
                                if (sayiSayaci == 16)
                                    checksum = (baslik + sayi1 + sayi2) % 256; 
                                    
                            end
                            else
                                bitcntr <=  bitcntr +1;
                                shreg <= rx_i & shreg[7:1];
                                bittimer <= 0;   
                      end
                      else  
                            bittimer <= bittimer +1;
                           
                   end
          STOP  : begin
                      if (bittimer == bittimer_lim-1)begin
                            state <= IDLE;
                            bittimer <= 0;
                            rx_done_o <= 1;
                      end
                      else
                        bittimer <= bittimer +1;
                   end
          default: begin
                      
                   end
       endcase
    end
    
    assign dout_o[7:0] = checksum;
    assign dout_o[71:8] = sayi2;
    assign dout_o[135:72] = sayi1;
    assign dout_o[151:136] = baslik;
    
endmodule
