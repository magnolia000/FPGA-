set_property SRC_FILE_INFO {cfile:C:/Users/81330/Desktop/FPGA/QSPI/QSPI.srcs/constrs_1/imports/FPGA_Project/system.xdc rfile:../../../QSPI.srcs/constrs_1/imports/FPGA_Project/system.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H4  IOSTANDARD LVCMOS33 } [get_ports { clk_100MHz }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P12 IOSTANDARD LVCMOS33} [get_ports Gyro_IIC_SCL];
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P13 IOSTANDARD LVCMOS33} [get_ports Gyro_IIC_SDA];
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports VCC];
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports GND];
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N4  IOSTANDARD LVCMOS33} [get_ports IIC_OE];
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33} [get_ports VCCEN];
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {I_qspi_clk_IBUF}]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33}  [get_ports {qspi_d0}]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {qspi_d1}]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {qspi_d2}]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN D13 IOSTANDARD LVCMOS33} [get_ports {qspi_d3}]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {I_qspi_cs}]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {I_qspi_clk}]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F4   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Clk_N }]; #IO_L11N_T1_SRCC_35 Sch=hdmi_tx_clk_n
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G4   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Clk_P }]; #IO_L11P_T1_SRCC_35 Sch=hdmi_tx_clk_p
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_N[0] }]; #IO_L12N_T1_MRCC_35 Sch=hdmi_tx_d_n[0]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_P[0] }]; #IO_L12P_T1_MRCC_35 Sch=hdmi_tx_d_p[0]
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D2   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_N[1] }]; #IO_L10N_T1_AD11N_35 Sch=hdmi_tx_d_n[1]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E2   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_P[1] }]; #IO_L10P_T1_AD11P_35 Sch=hdmi_tx_d_p[1]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_N[2] }]; #IO_L14N_T2_AD4N_SRCC_35 Sch=hdmi_tx_d_n[2]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_P[2] }]; #IO_L14P_T2_AD4P_SRCC_35 Sch=hdmi_tx_d_p[2]
