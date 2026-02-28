# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Push Buttons
set_property PACKAGE_PIN U18 [get_ports btnC]
set_property IOSTANDARD LVCMOS33 [get_ports btnC]

set_property PACKAGE_PIN U19 [get_ports btnU]
set_property IOSTANDARD LVCMOS33 [get_ports btnU]

set_property PACKAGE_PIN V17 [get_ports btnR]
set_property IOSTANDARD LVCMOS33 [get_ports btnR]

# Switch
set_property PACKAGE_PIN V16 [get_ports sw]
set_property IOSTANDARD LVCMOS33 [get_ports sw]

# 7-Segment Display Segments
set_property PACKAGE_PIN U3 [get_ports {seg[0]}]
set_property PACKAGE_PIN U4 [get_ports {seg[1]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]
set_property PACKAGE_PIN U6 [get_ports {seg[3]}]
set_property PACKAGE_PIN U7 [get_ports {seg[4]}]
set_property PACKAGE_PIN U8 [get_ports {seg[5]}]
set_property PACKAGE_PIN U9 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]

# 7-Segment Digit Select
set_property PACKAGE_PIN V4 [get_ports {an[0]}]
set_property PACKAGE_PIN V5 [get_ports {an[1]}]
set_property PACKAGE_PIN W6 [get_ports {an[2]}]
set_property PACKAGE_PIN W7 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]

# LEDs
set_property PACKAGE_PIN U1 [get_ports {led[0]}]
set_property PACKAGE_PIN U2 [get_ports {led[1]}]
set_property PACKAGE_PIN V1 [get_ports {led[2]}]
set_property PACKAGE_PIN V2 [get_ports {led[3]}]
set_property PACKAGE_PIN W1 [get_ports {led[4]}]
set_property PACKAGE_PIN W2 [get_ports {led[5]}]
set_property PACKAGE_PIN W3 [get_ports {led[6]}]
set_property PACKAGE_PIN W4 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]