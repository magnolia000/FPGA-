#ifndef FPGA_H
#define FPGA_H
#define Delay 5
#define END 10000
class GyroData
{
    private:
        uint8_t data[2];
        int16_t *gyrodata;
        int16_t temp;
        int Wave(int Addr)
        {
           float a;
             SeaTrans.read(Addr,data,2);
              gyrodata=(int16_t*)data;//转换为有符号整数
              temp=*gyrodata;
              a=temp/2048.0;//网上查阅到该陀螺仪加速度数据的最大限度为16g，所以将读出的16位数据整数转换为单位为g的加速度。
              
            if(a>12)//设置阈值为12g，超过阈值则设置一个状态。
                return 1;
            else if(a<-12)
                return -1;
            else
                return a;
        }
    public:
        int Wavecount(int Addr)
        {
            int count=0,lastdata=0,nowdata=0;
            unsigned long timeend=millis()+END;
            Serial.println("开始摇摇乐咯~");
            while(millis()<timeend)
            {
                delay(Delay);
                nowdata=Wave(Addr);
                if((nowdata!=0)&&(lastdata!=nowdata))//若此时状态不为0且与上一个状态不相同则视为运动一次
                {
                    lastdata=nowdata;
                    count++;
                }
                
            }
            return count/2;//调试过程中发现向一个方向运动时，会经历加速和减速两个过程，即向一个方向摇动则count+2，但实际只摇动了一次，所以需要count/2
        }
        void begin()
        {
            SeaTrans.begin();
        }
};
extern GyroData Wavecount;
#endif
