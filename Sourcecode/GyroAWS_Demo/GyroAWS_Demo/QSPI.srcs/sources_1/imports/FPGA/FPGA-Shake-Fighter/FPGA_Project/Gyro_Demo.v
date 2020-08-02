`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/23 18:36:35
// Design Name: 
// Module Name: Gyro_Demo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gyro_Demo(
    input clk_100MHz,
    //input UART0_Rx,
    inout Gyro_IIC_SDA,
    output Gyro_IIC_SCL,
    //output UART0_Tx,
    output IIC_OE,
    output VCCEN,
    output VCC,
    output GND,
    //QSPI
    inout  qspi_d0,
    inout  qspi_d1,
    inout  qspi_d2,
    inout  qspi_d3,
    input  I_qspi_cs,
    input  I_qspi_clk,
    output TMDS_Tx_Clk_N,
    output TMDS_Tx_Clk_P,
    output [2:0]TMDS_Tx_Data_N,
    output [2:0]TMDS_Tx_Data_P
    );
    //HDMI
    wire clk_system;
    wire [23:0]RGB_Data;
    wire [23:0]RGB_In;
    wire RGB_HSync;
    wire RGB_VSync;
    wire RGB_VDE;
    wire [11:0]Set_X;
    wire [11:0]Set_Y;
    wire i_en;
    //Clock
    wire clk_100MHz_System;
    wire clk_10MHz;
    //Control Output
    reg Ctrl_Temp_Out=1;
    reg Ctrl_Gyro_Out=1;
    reg Ctrl_Mag_Out=1;
    //Gyro part out
    wire [7:0]Addr;
    wire [15:0]Reg_Addr;
    wire [7:0]Reg_Data;
    //IIC
    wire Ctrl_IIC;
    wire IIC_Write;
    wire IIC_Read;
    wire [7:0]IIC_Read_Data;
    wire IIC_Busy;
    wire Reg_2Addr;   //Whether the register address is double address bit,0 is single register address, 1 is double.
    //UART data
    wire Tx_ACK;
    wire Rx_ACK;
    wire [15:0]Temp_Data;
    wire [15:0]Gyro_Data_X;
    wire [15:0]Gyro_Data_Y;
    wire [15:0]Gyro_Data_Z;
    wire [15:0]Mag_Data_X;
    wire [15:0]Mag_Data_Y;
    wire [15:0]Mag_Data_Z;
    wire Tx_En;
    wire [7:0]Send_Buffer;
    wire [7:0]Rx_Data;
    reg [30:0]Baud_Rate=115200;
    //IIC
    wire Gyro_IIC_SDA_I;
    wire Gyro_IIC_SDA_O;
    wire Gyro_IIC_SDA_T;
    assign IIC_OE=1;
    assign VCCEN=1;
    assign VCC=1;
    assign GND=0;
    //QSPI
    wire [31:0] addr;
    wire [7:0]  o_data;
    wire [7:0]  i_data;
    wire        o_valid;
    wire [31:0] addrb;
    wire [7:0]  dinb;
    wire [7:0]  doutb;
    wire        web;
    wire [31:0] addrc;
    wire [7:0]  dinc;
    wire [7:0]  doutc;
    wire        wec;
    wire [31:0] addrd;
    wire [7:0]  dind;
    wire [7:0]  doutd;
    wire        wed;
    wire [15:0]temperature_data;
    wire [15:0]anglex_data;
    wire [15:0]angley_data;
    wire [15:0]anglez_data;
    wire [15:0]magx_data;
    wire [15:0]magy_data;
    wire [15:0]magz_data;
    //rgb2vido
 rgb2dvi_0 rgb2dvi(
        .TMDS_Clk_p(TMDS_Tx_Clk_P),
        .TMDS_Clk_n(TMDS_Tx_Clk_N),
        .TMDS_Data_p(TMDS_Tx_Data_P),
        .TMDS_Data_n(TMDS_Tx_Data_N),
        .aRst(0),
        .vid_pData(RGB_Data),
        .vid_pVDE(RGB_VDE),
        .vid_pHSync(RGB_HSync),
        .vid_pVSync(RGB_VSync),
        .PixelClk(clk_system));
          //HDMI driver
    Driver_HDMI Driver_HDMI0(
        .clk(clk_system),        //Clock
        .Rst(1),                 //Reset signal, low reset
        .Video_Mode(0),          //Video format, 0 is 1920*1080@60Hz, 1 is 1280*720@60Hz
        .RGB_In(RGB_In),         //Input data
        .RGB_Data(RGB_Data),     //Output Data
        .RGB_HSync(RGB_HSync),   //Line signal
        .RGB_VSync(RGB_VSync),   //Field signal
        .RGB_VDE(RGB_VDE),       //Data valid signal
        .Set_X(Set_X),           //Image coordinate X
        .Set_Y(Set_Y)            //Image coordinate Y
        );
    Video_Generator Video_Generator0(
        .clk(clk_system),
        .i_en(i_en),
        .RGB_VDE(RGB_VDE),
        .Set_X(Set_X),
        .Set_Y(Set_Y),
        .RGB_Data(RGB_In)    //RBG
        );
    //Frequency divider
    clk_wiz_0 clk_10(.clk_out1(clk_100MHz_System),.clk_out2(clk_10MHz),.clk_in1(clk_100MHz));
    //Tri-state gate
    IOBUF Camera_IIC_SDA_IOBUF
           (.I(Gyro_IIC_SDA_O),
            .IO(Gyro_IIC_SDA),
            .O(Gyro_IIC_SDA_I),
            .T(~Gyro_IIC_SDA_T));
    Driver_Gyro Driver_Gyro0(
        .clk_100MHz(clk_100MHz_System),
        .clk_10MHz(clk_10MHz),
        .IIC_Busy(IIC_Busy),
        .Enable_Gyro(1),
        .IIC_Data(IIC_Read_Data),
        .Ctrl_Temp_Out(Ctrl_Temp_Out),
        .Ctrl_Gyro_Out(Ctrl_Gyro_Out),
        .Ctrl_Mag_Out(Ctrl_Mag_Out),
        .Addr(Addr),
        .Reg_Addr(Reg_Addr),
        .Reg_Data(Reg_Data),
        .Temp_Data(Temp_Data),
        .Gyro_Data_X(Gyro_Data_X),
        .Gyro_Data_Y(Gyro_Data_Y),
        .Gyro_Data_Z(Gyro_Data_Z),
        .Mag_Data_X(Mag_Data_X),
        .Mag_Data_Y(Mag_Data_Y),
        .Mag_Data_Z(Mag_Data_Z),
        .IIC_Write(IIC_Write),
        .IIC_Read(IIC_Read),
        .Reg_2Addr(Reg_2Addr),
        .Ctrl_IIC(Ctrl_IIC)
        );
    /*    Driver_Gyro Gyro_0(
        .i_clk(clk_100MHz_System),
        .i_rst(1),
        .i_en(1),
        .i_iic_busy(IIC_Busy),
        .i_data_mode(3'b111),
        .i_data(IIC_Read_Data),
        .o_reg_mode(Reg_2Addr),
        .o_slave_addr(Addr),
        .o_reg_addr_h(Reg_Addr[15:8]),
        .o_reg_addr_l(Reg_Addr[7:0]),  
        .o_data_w(Reg_Data),      
        .o_temperature_data(temperature_data),
        .o_anglex_data(anglex_data),
        .o_angley_data(angley_data),
        .o_anglez_data(anglez_data),
        .o_magx_data(magx_data),
        .o_magy_data(magy_data),
        .o_magz_data(magz_data),
        .o_iic_write(IIC_Write),
        .o_iic_read(IIC_Read)
    );*/
    Driver_IIC Driver_IIC0(
        .clk(clk_100MHz_System),        // input wire clk
        .Rst(1),                 // input wire Rst
        .Addr(Addr),                    // input wire [7 : 0] Addr
        .Reg_Addr(Reg_Addr),            // input wire [15 : 0] Reg_Addr
        .Data(Reg_Data),                // input wire [7 : 0] Data
        .IIC_Write(IIC_Write),          // input wire IIC_Write
        .IIC_Read(IIC_Read),            // input wire IIC_Read
        .IIC_Read_Data(IIC_Read_Data),  // output wire [7 : 0] IIC_Read_Data
        .IIC_Busy(IIC_Busy),            // output wire IIC_Busy
        .Reg_2Addr(Reg_2Addr),          // input wire Reg_2Addr
        .IIC_SCL(Gyro_IIC_SCL),         // output wire IIC_SCL
        .IIC_SDA_In(Gyro_IIC_SDA_I),    // input wire IIC_SDA_In
        .SDA_Dir(Gyro_IIC_SDA_T),       // output wire SDA_Dir
        .SDA_Out(Gyro_IIC_SDA_O)        // output wire SDA_Out
    );

qspi_slave u_qspi_slave(
    .I_qspi_clk  (I_qspi_clk)  , 
    .I_qspi_cs   (I_qspi_cs)  , 
    .IO_qspi_io0 (qspi_d0)  ,
    .IO_qspi_io1 (qspi_d1)  ,
    .IO_qspi_io2 (qspi_d2)  , 
    .IO_qspi_io3 (qspi_d3)  , 
    .o_addr      (addr)    ,
    .o_data      (o_data)  ,
    .i_data      (i_data)  ,
    .o_valid     (o_valid)
    );

blk_mem_gen_0 u_blk_mem_gen_0(
    .addra(addr),
    .clka(I_qspi_clk),
    .dina(o_data),
    .douta(i_data),
    .wea(o_valid),
    .addrb(addrb),
    .clkb(clk_100MHz_System),
    .dinb(dinb),
    .doutb(doutb),
    .web(web)
);

//Gyro     
Gyro2ram u_Gyro2ram(
    .clk(clk_100MHz_System),
    .rst_n(1),
    //Gyro
    .Temp_Data(temperature_data),
    .Gyro_Data_X(anglex_data),
    .Gyro_Data_Y(angley_data),
    .Gyro_Data_Z(anglez_data),
    .Mag_Data_X(magx_data),
    .Mag_Data_Y(magy_data),
    .Mag_Data_Z(magz_data),
    //TEST_DATA
//    .Temp_Data(16'h3231),
//    .Gyro_Data_X(16'h3433),
//    .Gyro_Data_Y(16'h3635),
//    .Gyro_Data_Z(16'h3837),
//    .Mag_Data_X(16'h3A39),
//    .Mag_Data_Y(16'h3C3B),
//    .Mag_Data_Z(16'h3E3D),
    //RAM 
    .addr(addrb),
    .data_in(doutb),
    .data_out(dinb),
    .wen(web),
    .HDMI(i_en)
    );    
    
endmodule
