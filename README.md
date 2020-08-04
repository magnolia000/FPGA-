# FPGA-Shake Fighter
# 该项目为2020年新工科联盟-Xilinx暑期学校（Summer School）项目。
# 项目成员
刘学谦  
余杭霖
# 项目介绍
这是利用FPGA开发板开发的简易摇摇乐：读取板载陀螺仪的数据通过qspi从FPGA传到ESP32，在Arduino端读取出陀螺仪加速度数据并进行数据处理判断摇动次数.  
通过ESP32WIFI模块连接AWS服务器，上传摇动次数数据。
# 实现过程
1.配置`AWS Iot`云服务器实现`ESP32`与服务器的连接并上传治云端  
2.驱动Demo模块将陀螺仪数据通过IIC模块传递  
3.将数据存于`RAM`，通过`QSPI`将数据传到ESP32  
4.在Arduino端编写代码读取ESP32端数据并进行次数判断。
# 开发工具
Vivado 2018.3  
Arduino 1.8  
AWS Iot  
# 板卡型号
Sea-board spartan-7
# 仓库目录
## Sourcecode
QSPI(verilog语言，vivado工程)   
ArduinoAWS_Demo（Arduino文件）  
## ExecutableFiles
bit文件：其中Gyro_Demo(2.0)为预想扩展功能后修改了代码生成的bit文件，还未上板测试扩展功能。  
测试摇摇乐基础功能请使用Gyro_Demo。
## images
项目演示图片和视频
# 更新
想要在基础功能上扩展功能，当摇动了一定次数后会通过HDMI显示一张图片（采用HDMI_Demo）,仅修改了代码和生成bit文件，还未使用MIN-HDMI线上板测试功能。该扩展功能暂时放弃，等以后有时间精力后再来测试完善该扩展功能。ExecutableFiles文件内的Gyro_Demo(2.0)文件是测试bit文件，不建议使用。
