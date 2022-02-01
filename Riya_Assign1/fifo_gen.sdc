# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.12-s121_1 on Tue Feb 01 15:44:51 IST 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fifo1

create_clock -name "rclk" -period 50.0 -waveform {0.0 25.0} [get_ports rclk]
create_clock -name "wclk" -period 100.0 -waveform {0.0 50.0} [get_ports wclk]
set_false_path -from [get_clocks rclk] -to [get_clocks wclk]
set_false_path -from [get_clocks wclk] -to [get_clocks rclk]
set_multicycle_path -from [get_clocks wclk] -to [get_clocks rclk] -setup -end 2
set_multicycle_path -from [get_clocks wclk] -to [get_clocks rclk] -hold -start 1
set_max_delay 15 -from [get_clocks wclk] -to [get_clocks rclk]
set_min_delay 5 -from [get_clocks wclk] -to [get_clocks rclk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports winc]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports wrst_n]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[0]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[1]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[2]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[3]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[4]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[5]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[6]}]
set_input_delay -clock [get_clocks wclk] -add_delay -max 0.5 [get_ports {wdata[7]}]
set_input_delay -clock [get_clocks rclk] -add_delay -max 0.5 [get_ports rinc]
set_input_delay -clock [get_clocks rclk] -add_delay -max 0.5 [get_ports rrst_n]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports rempty]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[0]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[1]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[2]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[3]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[4]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[5]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[6]}]
set_output_delay -clock [get_clocks rclk] -add_delay -max 1.0 [get_ports {rdata[7]}]
set_output_delay -clock [get_clocks wclk] -add_delay -max 1.0 [get_ports wfull]
set_max_transition 0.2 [get_ports {wdata[7]}]
set_max_transition 0.2 [get_ports {wdata[6]}]
set_max_transition 0.2 [get_ports {wdata[5]}]
set_max_transition 0.2 [get_ports {wdata[4]}]
set_max_transition 0.2 [get_ports {wdata[3]}]
set_max_transition 0.2 [get_ports {wdata[2]}]
set_max_transition 0.2 [get_ports {wdata[1]}]
set_max_transition 0.2 [get_ports {wdata[0]}]
set_max_transition 0.2 [get_ports winc]
set_max_transition 0.2 [get_ports wrst_n]
set_max_transition 0.2 [get_ports rinc]
set_max_transition 0.2 [get_ports rrst_n]
set_max_transition 0.2 [get_ports {rdata[7]}]
set_max_transition 0.2 [get_ports {rdata[6]}]
set_max_transition 0.2 [get_ports {rdata[5]}]
set_max_transition 0.2 [get_ports {rdata[4]}]
set_max_transition 0.2 [get_ports {rdata[3]}]
set_max_transition 0.2 [get_ports {rdata[2]}]
set_max_transition 0.2 [get_ports {rdata[1]}]
set_max_transition 0.2 [get_ports {rdata[0]}]
set_max_transition 0.2 [get_ports wfull]
set_max_transition 0.2 [get_ports rempty]
set_max_capacitance 1.0 [get_ports {rdata[7]}]
set_max_capacitance 1.0 [get_ports {rdata[6]}]
set_max_capacitance 1.0 [get_ports {rdata[5]}]
set_max_capacitance 1.0 [get_ports {rdata[4]}]
set_max_capacitance 1.0 [get_ports {rdata[3]}]
set_max_capacitance 1.0 [get_ports {rdata[2]}]
set_max_capacitance 1.0 [get_ports {rdata[1]}]
set_max_capacitance 1.0 [get_ports {rdata[0]}]
set_max_capacitance 1.0 [get_ports wfull]
set_max_capacitance 1.0 [get_ports rempty]
set_wire_load_mode "top"
set_clock_latency -source 1.0 [get_clocks rclk]
set_clock_latency -source 1.0 [get_clocks wclk]
set_clock_uncertainty -from [get_clocks wclk] -to [get_clocks rclk]  -setup 0.75 
set_clock_uncertainty -from [get_clocks wclk] -to [get_clocks rclk]  -hold 0.75 
