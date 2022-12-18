`timescale 1ns / 1ps

    
module Transmitter #(clkfreq = 100000000,baudrate = 115200,stopbit=2)(
input clk,
input [87:0]din_i,
input tx_start_i,
output reg tx_o,
output reg tx_done_tick_o

);


localparam IDLE= 2'b00;
localparam START= 2'b01;
localparam DATA= 2'b10;
localparam STOP= 2'b11;
reg [1:0] state = IDLE;
localparam bittimer_lim = clkfreq/baudrate;
localparam stopbit_lim = (clkfreq/baudrate)*stopbit;

reg [bittimer_lim-1:0]bittimer = 0 ;
reg [7:0]bitcntr = 0;
reg [7:0]shreg = 0;

reg [6:0] sayac = 7'd87; 
reg [4:0] sayiSayaci = 0;






    always @(posedge clk)begin
    
   
         if( din_i[87:72] == 16'b1011101011111101 )begin //0xBAFD
           shreg <= din_i[sayac-:8] ;
           sayac <= sayac -8;
           if ( sayac == 0)
                sayac <= 7'd87;
           end
        
    
    
       case (state)
        IDLE : begin 
           tx_o <= 1'b1;
           tx_done_tick_o <= 1'b0;
           bitcntr <= 0;
           if(tx_start_i == 1'b1) begin
            state <= START;
            tx_o <= 1'b0;
            shreg <= din_i;
           end
        end
      
      START: begin
       if (bittimer == bittimer_lim-1) begin
                    state				<= DATA;
                    tx_o				<= shreg[0];
                    shreg[7]			<= shreg[0];
                    shreg[6:0]	        <= shreg[7:1];
                    bittimer			<= 0;
                    end
                else
                    bittimer			<= bittimer + 1;
        end
      
      DATA: begin 
        if (bitcntr == 7) begin
                    if (bittimer == bittimer_lim-1) begin
                        bitcntr				<= 0;
                        state				<= STOP;
                        tx_o				<= 1;
                        bittimer			<= 0;
                        
                        
                        
                        
                        end
                        
                    else 
                        bittimer			<= bittimer + 1;					
                                
        end		
        else begin
                    if (bittimer == bittimer_lim - 1)begin
                    
                        shreg[7]			<= shreg[0];
                        shreg[6:0]         	<= shreg[7:1];					
                        tx_o				<= shreg[0];
                        bitcntr				<= bitcntr + 1;
                        bittimer			<= 0;
                        end
                    else
                        bittimer			<= bittimer + 1;
                    end 
        end		
       STOP: begin   
            if (bittimer == stopbit_lim-1) begin
                    state				<= IDLE;
                    tx_done_tick_o		<= 1;
                    bittimer			<= 0;
                    end
                else
                    bittimer			<= bittimer + 1;
       end 
       
     endcase
  end


endmodule
    

