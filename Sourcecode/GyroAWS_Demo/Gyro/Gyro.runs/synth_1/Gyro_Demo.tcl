# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7s15ftgb196-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.cache/wt [current_project]
set_property parent.project_path C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths {
  c:/Users/81330/Desktop/FPGA/SEA/Examples/FPGA/4.Module-Interface/Mini-HDMI-Interface/HDMI_Demo/HDMI_Demo.ip_user_files/ip/rgb2dvi_0
  c:/Users/81330/Desktop/FPGA/SEA/Examples/FPGA/4.Module-Interface/Mini-HDMI-Interface/HDMI_Demo/HDMI_Demo.ip_user_files/ip/Picture_R_Rom
  c:/Users/81330/Desktop/FPGA/SEA/Examples/FPGA/4.Module-Interface/Mini-HDMI-Interface/HDMI_Demo/HDMI_Demo.ip_user_files/ip/Picture_G_Rom
  c:/Users/81330/Desktop/FPGA/SEA/Examples/FPGA/4.Module-Interface/Mini-HDMI-Interface/HDMI_Demo/HDMI_Demo.ip_user_files/ip/Picture_B_Rom
} [current_project]
update_ip_catalog
set_property ip_output_repo c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files f:/matlab/bin/SEU_Picture_R_Rom.coe
add_files f:/matlab/bin/SEU_Picture_G_Rom.coe
add_files f:/matlab/bin/SEU_Picture_B_Rom.coe
read_verilog -library xil_defaultlib {
  C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/Clk_Division.v
  C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/Driver_Gyro.v
  C:/Users/81330/Desktop/FPGA/SEA/Examples/FPGA/4.Module-Interface/Mini-HDMI-Interface/HDMI_Demo/HDMI_Demo.srcs/sources_1/new/Driver_HDMI.v
  C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/Driver_IIC.v
  C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/Gyro2ram.v
  C:/Users/81330/Desktop/FPGA/SEA/Examples/FPGA/4.Module-Interface/Mini-HDMI-Interface/HDMI_Demo/HDMI_Demo.srcs/sources_1/new/Video_Generator.v
  C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/qspi_slave.v
  C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/Gyro_Demo.v
}
read_ip -quiet C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

read_ip -quiet C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/rgb2dvi_0/rgb2dvi_0.xci
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi.xdc]
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi_clocks.xdc]

read_ip -quiet C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/Picture_R_Rom/Picture_R_Rom.xci
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/Picture_R_Rom/Picture_R_Rom_ooc.xdc]

read_ip -quiet C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/Picture_G_Rom/Picture_G_Rom.xci
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/Picture_G_Rom/Picture_G_Rom_ooc.xdc]

read_ip -quiet C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/Picture_B_Rom/Picture_B_Rom.xci
set_property used_in_implementation false [get_files -all c:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter1/Sourcecode/GyroAWS_Demo/Gyro/Gyro.srcs/sources_1/ip/Picture_B_Rom/Picture_B_Rom_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/system.xdc
set_property used_in_implementation false [get_files C:/Users/81330/Desktop/FPGA/FPGA-Shake-Fighter/FPGA_Project/system.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Gyro_Demo -part xc7s15ftgb196-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Gyro_Demo.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Gyro_Demo_utilization_synth.rpt -pb Gyro_Demo_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
