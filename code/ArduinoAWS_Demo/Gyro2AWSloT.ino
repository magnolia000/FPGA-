// include the library:
#include <spartan-edge-esp32-boot.h>
#include "ESP32IniFile.h"
#include "sea_esp32_qspi.h"
#include "SimpleDHT.h"
#include "string.h"
#include "fpga.h"
#include "AWS_IOT.h"
#include "WiFi.h"

const size_t bufferLen = 80;
char buffer[bufferLen];
char buffer1[bufferLen];

// initialize the spartan_edge_esp32_boot library
spartan_edge_esp32_boot esp32Cla;

AWS_IOT hornbill;

char WIFI_SSID[]="CMCC-pKca";
char WIFI_PASSWORD[]="e9u2d3s5";
char HOST_ADDRESS[]="a1wp6ysazw8q3k-ats.iot.us-east-1.amazonaws.com";
char CLIENT_ID[]= "ESP32client";
char TOPIC_NAME[]= "1`";

GyroData Wavecount;
int status = WL_IDLE_STATUS;
int tick=0,msgCount=0,msgReceived = 0,tick1=0;
char payload[512];
char rcvdPayload[512];
uint8_t data1[4] = {41,42,43,44};
uint8_t data2[32];
void mySubCallBackHandler (char *topicName, int payloadLen, char *payLoad)
{
    strncpy(rcvdPayload,payLoad,payloadLen);
    rcvdPayload[payloadLen] = 0;
    msgReceived = 1;
}


void setup()
{
   // initialization 
  esp32Cla.begin();

  // check the .ini file exist or not
  const char *filename = "/board_config.ini";
  IniFile ini(filename);
  if (!ini.open()) {
    Serial.print("Ini file ");
    Serial.print(filename);
    Serial.println(" does not exist");
    return;
  }
  Serial.println("Ini file exists");

  // check the .ini file valid or not
  if (!ini.validate(buffer, bufferLen)) {
    Serial.print("ini file ");
    Serial.print(ini.getFilename());
    Serial.print(" not valid: ");
    return;
  }

  // Fetch a value from a key which is present
  if (ini.getValue("Overlay_List_Info", "Overlay_Dir", buffer, bufferLen)) {
    Serial.print("section 'Overlay_List_Info' has an entry 'Overlay_Dir' with value ");
    Serial.println(buffer);
  }
  else {
    Serial.print("Could not read 'Overlay_List_Info' from section 'Overlay_Dir', error was ");
  }

  // Fetch a value from a key which is present
  if (ini.getValue("Board_Setup", "overlay_on_boot", buffer1, bufferLen)) {
    Serial.print("section 'Board_Setup' has an entry 'overlay_on_boot' with value ");
    Serial.println(buffer1);
  }
  else {
    Serial.print("Could not read 'Board_Setup' from section 'overlay_on_boot', error was ");
  }

  // Splicing characters
  strcat(buffer,buffer1);
  
  // XFPGA pin Initialize
  esp32Cla.xfpgaGPIOInit();

  // loading the bitstream
  esp32Cla.xlibsSstream(buffer);
  Serial.begin(115200);
  SeaTrans.begin();
  //SeaTrans.write(0, data1, 4);
  //SeaTrans.read(0, data2, 4);
  //Serial.printf("%d %d %d %d\r\n",data2[0],data2[1],data2[2],data2[3]);
  delay(2000);

    while (status != WL_CONNECTED)
    {
        Serial.print("Attempting to connect to SSID: ");
        Serial.println(WIFI_SSID);
        // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
        status = WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

        // wait 5 seconds for connection:
        delay(5000);
    }

    Serial.println("Connected to wifi");

    if(hornbill.connect(HOST_ADDRESS,CLIENT_ID)== 0)
    {
        Serial.println("Connected to AWS");
        delay(1000);

        if(0==hornbill.subscribe(TOPIC_NAME,mySubCallBackHandler))
        {
            Serial.println("Subscribe Successfully");
        }
        else
        {
            Serial.println("Subscribe Failed, Check the Thing Name and Certificates");
            while(1);
        }
    }
    else
    {
        Serial.println("AWS connection failed, Check the HOST Address");
        while(1);
    }

    delay(2000);
  
}

void loop()
{
    uint8_t i;
    int countx,county,countz;
    int16_t data00;
    uint8_t data11[2];
    //Wavecount.begin();
    countx=Wavecount.Wavecount(2);
    //data11[0]=(uint8_t)countx;
    //SeaTrans.write(0,data11,1);
    //county=Wavecount.Wavecount(4);
   // Serial.println(county);
    //countz=Wavecount.Wavecount(6);
    //Serial.println(countz);
   //data00= Wavecount.Wave(2);
   //SeaTrans.read(0, data11, 2);
   if(countx>20)
    { sprintf(payload," 5S内摇了%d次,速度真快!",countx);}
   else
   {sprintf(payload," 5S内摇了%d次,继续加油鸭",countx);}
    
    //Serial.println(payload);
  
    if(hornbill.publish(TOPIC_NAME,payload) == 0)
        {        
            Serial.println("Publish successfully!");
           Serial.println(payload);
        }
        else
        {
            Serial.println("Publish failed!");
        }
    //SeaTrans.write(0, data1, 4);
    
    //result in uart
    //SeaTrans.read(0, data2, 32);
    /*for (i=0;i<=31;i=i+2)
    {
      Serial.printf("data2[%d:%d] = %2x%2x \r\n",i+1,i,data2[i+1],data2[i]);
    }
    */
   /* if(msgReceived == 1)
    {
        msgReceived = 0;
        Serial.print("Received Message:");
        Serial.println(rcvdPayload);
    }
    
    /*if(tick >= 5)   // publish to topic every 5seconds
    {
        tick=0;
        //result in lot
        SeaTrans.read(0, data2, 16);
        //UART
        
       /* for (i=0;i<=16;i=i+1)
        {
          Serial.printf("%02x ",data2[i]);
        }
        
        Serial.print("\r\n");
        */
        //sprintf(payload,"Hello from hornbill ESP32 : %d",msgCount++);
        //sprintf(payload,"data2[%d:%d] = %2x %2x \r\n",i+1,i,data2[i+1],data2[i]);
        //sprintf(payload," ");
        
       /* for (i=0;i<16;i=i+1)
        {
          payload[i] = data1[i];
        }
        
        sprintf(payload," %.2b %.2b - %.2b %.2b %.2b %.2b %.2b %.2b - %.2x %.2x %.2x %.2x %.2x %.2x",data2[2],data2[3],data2[4],data2[5],data2[6],data2[7],data2[8],data2[9],data2[10],data2[11],data2[12],data2[13],data2[14],data2[15]);
        if(hornbill.publish(TOPIC_NAME,payload) == 0)
        {        
            Serial.println("Publish successfully!");
            Serial.println(payload);
        }
        else
        {
            Serial.println("Publish failed!");
        }
    }  
    msgReceived = 0;
    vTaskDelay(1000 / portTICK_RATE_MS); 
    //msgReceived = 0;
    tick++;*/
}
