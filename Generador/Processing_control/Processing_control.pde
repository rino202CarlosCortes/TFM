/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;
import controlP5.*;

PImage img;
Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port
ControlP5 cp5;
int myColor = color(0,0,0);
String trama = "H100K001M000"; 
int envio = 0;
int MHz = 0;
int kHz = 0;
int Hz = 0;
void setup() 
{
   size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
   // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  cp5.addSlider("Hz")
     .setPosition(100,50)
     .setRange(0,999)
     ;
       cp5.addSlider("kHz")
     .setPosition(100,200)
     .setRange(0,999)
     ;
       cp5.addSlider("MHz")
     .setPosition(100,350)
     .setRange(0,5)
     ;
       cp5.addButton("OK")
     .setPosition(100,140)
     .setSize(200,19)
     .setValue(0)
     ;
     img = loadImage("laDefense.png");
}

void draw() {
  image(img, width/2, 0,width*2/3,height*2/3);
  if(envio == 1){
    envio = 0;
    trama = "H" + str(Hz) + "K" +str(kHz) + "M" + str(MHz)+ "\n";
    println(trama);
    myPort.write(trama);              // send an H to indicate mouse is over square
 delay(1000);
  }
   delay(300);
}


public void OK(int theValue) {
  envio = 1;
}

/*
  // Wiring/Arduino code:
 // Read data from the serial and turn ON or OFF a light depending on the value
 
 char val; // Data received from the serial port
 int ledPin = 4; // Set the pin to digital I/O 4
 
 void setup() {
 pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
 Serial.begin(9600); // Start serial communication at 9600 bps
 size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("Hz")
     .setPosition(100,50)
     .setRange(0,255)
     ;
       cp5.addSlider("kHz")
     .setPosition(100,200)
     .setRange(0,255)
     ;
       cp5.addSlider("MHz")
     .setPosition(100,350)
     .setRange(0,255)
     ;
 }
 
 void loop() {
 while (Serial.available()) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
 }
 if (val == 'H') { // If H was received
 digitalWrite(ledPin, HIGH); // turn the LED on
 } else {
 digitalWrite(ledPin, LOW); // Otherwise turn it OFF
 }
 delay(100); // Wait 100 milliseconds for next reading
 }
 
 */