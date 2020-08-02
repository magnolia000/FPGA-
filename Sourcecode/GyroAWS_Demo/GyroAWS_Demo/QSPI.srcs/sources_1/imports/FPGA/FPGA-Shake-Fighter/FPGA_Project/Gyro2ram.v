`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 08:52:55
// Design Name: 
// Module Name: Gyro2ram
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


module Gyro2ram(
    input clk,
    input rst_n,
    //Gyro
    input [15:0]Temp_Data,
    input [15:0]Gyro_Data_X,
    input [15:0]Gyro_Data_Y,
    input [15:0]Gyro_Data_Z,
    input [15:0]Mag_Data_X,
    input [15:0]Mag_Data_Y,
    input [15:0]Mag_Data_Z,
    //RAM 
    output reg [7:0] addr,
    input [7:0]data_in,
    output reg [7:0] data_out,
    output reg wen,
    output reg HDMI=1'b0
    );
    parameter  MAX_D_value_T = 16'b0100000000000000;
    parameter  MAX_D_value_F = 16'b0111111111111111;
    reg [15:0] count=0;
    wire [14:0] GDX;
    reg [15:0] last_data;
    assign GDX={Gyro_Data_X[7:1],Gyro_Data_X[15:8]};
    reg [7:0] mem [0:15];
    integer i;
    always @(*)
    begin
        wen <= 1;
    end
    
    always @(*)
    begin
        data_out <= mem[addr];
    end
    always @(*)
    begin
        if(data_in>23)
        begin
            HDMI<=1'b1;
        end
    end
    always @(posedge clk,negedge rst_n)
    begin
        if (!rst_n)
        begin
            addr <= 0;
        end
        else
        begin
            if (addr < 15)
                addr <= addr + 1;
            else
                addr <= 0;
        end
    end
  /*  always @(posedge clk,negedge rst_n)
    begin
        if(!rst_n)
        begin
            
        end
        else
        begin
            if(Gyro_Data_X[15]==1'b1)
            begin
                if(Gyro_Data_X<MAX_D_value_T&&last_data[15]!=1'b0)
                begin
                    count<=count+1'b1;
                    last_data<=Gyro_Data_X;
                end
            end
            else
            begin
                 if(Gyro_Data_X>MAX_D_value_F&&last_data[15]!=1'b1)
                 begin
                    count<=count+1'b1;
                    last_data<=Gyro_Data_X;
                 end
            end
        end
    end*/
    always @(posedge clk,negedge rst_n)
    begin
        if (!rst_n)
        begin
            for (i=0;i<=15;i=i+1)
                mem[i] <= 8'd0;
        end
        else
        begin
            if (addr >= 15)
            begin
                mem[0] <= Temp_Data[7:0];
                mem[1] <= Temp_Data[15:8];
                
                mem[2] <= Gyro_Data_X[7:0];
                mem[3] <= Gyro_Data_X[15:8];
                mem[4] <= Gyro_Data_Y[7:0];
                mem[5] <= Gyro_Data_Y[15:8];
                mem[6] <= Gyro_Data_Z[7:0];
                mem[7] <= Gyro_Data_Z[15:8];
                
                mem[8] <= Mag_Data_X[7:0];
                mem[9] <= Mag_Data_X[15:8];
                mem[10] <= Mag_Data_Y[7:0];
                mem[11] <= Mag_Data_Y[15:8];
                mem[12] <= Mag_Data_Z[7:0];
                mem[13] <= Mag_Data_Z[15:8];
                mem[14] <= 8'h00;
                mem[15] <= 8'h00;
            end
        end
    end

endmodule
