set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1.0ns

# Set the current design
current_design fifo1

create_clock -name "rclk" -period 50.0 -waveform {0.0 25.0} [get_ports rclk]
create_clock -name "wclk" -period 100.0 -waveform {0.0 50.0} [get_ports wclk]

set_clock_uncertainty -from [get_clocks wclk]  -to [get_clocks rclk] 0.75

set_clock_latency -source 1.0 [get_clocks wclk]
set_clock_latency -source 1.0 [get_clocks rclk]

set_false_path -from [get_clocks rclk] -to [get_clocks wclk]
set_false_path -from [get_clocks wclk] -to [get_clocks rclk]

set_max_delay 15 -from [get_clocks wclk] -to [get_clocks rclk]
set_min_delay 5 -from [get_clocks wclk] -to [get_clocks rclk]

set_multicycle_path -setup -from [get_clocks wclk] -to [get_clocks rclk] 2
set_multicycle_path -hold -from [get_clocks wclk] -to [get_clocks rclk] 1

set_input_delay -clock [get_clocks {wclk}] -max 0.5 [get_ports {winc wrst_n wdata[0] wdata[1] wdata[2] wdata[3] wdata[4] wdata[5] wdata[6] wdata[7]}]
set_input_delay -clock [get_clocks {rclk}] -max 0.5 [get_ports {rinc rrst_n}]

set_output_delay -clock [get_clocks {rclk}] -max 1 [get_ports {rempty rdata[0] rdata[1] rdata[2] rdata[3] rdata[4] rdata[5] rdata[6] rdata[7]}]
set_output_delay -clock [get_clocks {wclk}] -max 1 [get_ports {wfull}]

set_max_transition 0.2 [get_ports {winc wrst_n wdata[0] wdata[1] wdata[2] wdata[3] wdata[4] wdata[5] wdata[6] wdata[7] rinc rrst_n rempty rdata[0] rdata[1] rdata[2] rdata[3] rdata[4] rdata[5] rdata[6] rdata[7] wfull}]

set_max_capacitance 1 [all_outputs]

set_wire_load_mode "top"



