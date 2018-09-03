#include <AD9850.h>
#include <SPI.h>

const int W_CLK_PIN = 7;
const int FQ_UD_PIN = 8;
const int DATA_PIN = 9;
const int RESET_PIN = 5;

int contador_string = 0; 
double freq = 10000;
double trimFreq = 124999500;
String inString = ""; 

String Hz = "Nan";
String kHz = "Nan";
String MHz = "Nan"; 
int phase = 0;

void setup(){
  delay(10000);
  DDS.begin(W_CLK_PIN, FQ_UD_PIN, DATA_PIN, RESET_PIN);
  DDS.calibrate(trimFreq);
  pinMode(10,OUTPUT);
    Serial.begin(9600);
    SPI.begin();
    SPI.beginTransaction(SPISettings(14000000, MSBFIRST, SPI_MODE0)); 
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  DDS.up();
}

void loop(){
 // Read serial input:
 int inChar='0';
  while (Serial.available() > 0) {
    int inChar = Serial.read();
      // convert the incoming byte to a char and add it to the string:
      inString += (char)inChar;
    
    // if you get a newline, print the string, then the string's value:
    if (inChar == '\n') {
      contador_string = inString.indexOf('H');
      Hz = inString.substring(contador_string+1,contador_string+4);
      contador_string = inString.indexOf('K');
      kHz = inString.substring(contador_string+1,contador_string+4);
      contador_string = inString.indexOf('M');
      MHz = inString.substring(contador_string+1,contador_string+4);
      Serial.print("Hz:");
      Serial.println(Hz.toInt());
      Serial.print("kHz:");
      Serial.println(kHz.toInt());
      Serial.print("MHz:");
      Serial.println(MHz.toInt());
      SPI.transfer('t');
      SPI.transfer('l');      
      SPI.transfer('c');




      freq = MHz.toInt()*1000000 + kHz.toInt()*1000 + Hz.toInt();
      // clear the string for new input:
      
      inString = "";
    }
  }
       DDS.setfreq(freq,phase);
       delay(1000);
  }
  

