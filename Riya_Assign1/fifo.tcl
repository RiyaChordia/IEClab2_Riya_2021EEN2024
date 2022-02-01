set search_path "/afs/iitd.ac.in/service/tools/public/asiclib/umcoa/L65/libraries/UMC65LLSC/synopsys/ccs"
set_attribute lib_search_path "/afs/iitd.ac.in/service/tools/public/asiclib/umcoa/L65/libraries/UMC65LLSC/synopsys/ccs"
set_attribute hdl_search_path "./rtl_fifo/"
set_attribute library "uk65lscllmvbbr_100c25_tc_ccs.lib"

read_hdl {fifo1.v fifomem.v sync_w2r.v sync_r2w.v rptr_empty.v wptr_full.v}
elaborate fifo1
check_design -unresolved
read_sdc ./synthesis/fifo.sdc
synthesize -to_mapped -effort medium
write_hdl > ./typical/fifo_netlist.v
write_sdc > ./typical/fifo_gen.sdc
