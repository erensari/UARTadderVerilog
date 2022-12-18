# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -period 10.000 -name sys_clk_pin  -waveform {0 5} -add [get_ports clk]
	
set_property PACKAGE_PIN V17 [get_ports {rst_n}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]


set_property PACKAGE_PIN T18 [get_ports btnu_i]						
	set_property IOSTANDARD LVCMOS33 [get_ports btnu_i]
set_property PACKAGE_PIN W19 [get_ports btnl_i]						
	set_property IOSTANDARD LVCMOS33 [get_ports btnl_i]
set_property PACKAGE_PIN T17 [get_ports btnr_i]						
	set_property IOSTANDARD LVCMOS33 [get_ports btnr_i]
set_property PACKAGE_PIN U17 [get_ports btnd_i]						
	set_property IOSTANDARD LVCMOS33 [get_ports btnd_i]
	
	
set_property PACKAGE_PIN B18 [get_ports rx_i]						
	set_property IOSTANDARD LVCMOS33 [get_ports rx_i]
set_property PACKAGE_PIN A18 [get_ports tx_o]						
	set_property IOSTANDARD LVCMOS33 [get_ports tx_o]
 
