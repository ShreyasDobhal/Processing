
import processing.serial.*;
import processing.video.*;

Serial Port;
Capture vid;
color detect;
int index=0;
boolean show=false;

void setup() 
{
  size(640,480);
  vid = new Capture(this,640,480,30);
  Port = new Serial(this,Serial.list()[0], 9600);
  vid.start();
}

void draw()
{
  if (vid.available())
    vid.read();
  image(vid,0,0);
  if (show)
  {
    vid.loadPixels();
    detect = vid.pixels[index];
    int R = (int)red(detect);
    int G = (int)green(detect);
    int B = (int)blue(detect);
    Port.write("!");
    Port.write(R+"");
    Port.write("!");
    Port.write(G+"");
    Port.write("!");
    Port.write(B+"");
    Port.write("!");
    show=false;
  }
}

void mousePressed()
{
  index = mouseY*width+mouseX;
  show=true;
}
