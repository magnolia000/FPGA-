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
              gyrodata=(int16_t*)data;
              temp=*gyrodata;
              a=temp/2048.0;
              
            if(a>12)
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
                if((nowdata!=0)&&(lastdata!=nowdata))
                {
                    lastdata=nowdata;
                    count++;
                }
                
            }
            return count/2;
        }
        void begin()
        {
            SeaTrans.begin();
        }
};
extern GyroData Wavecount;
#endif
