import processing.video.*;

Capture vid;

void setup()
{
  size(640,480);
  //printArray(Capture.list());
  vid = new Capture(this,640,480,30);
  vid.start();
}
/*
void captureEvent(Capture vid) 
{
  // either use this or use vid.available()
  vid.read();
}
*/
void draw()
{
  if (vid.available())
    vid.read();
  background(0);
  image(vid,0,0);
}
