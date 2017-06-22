import processing.video.*;

Capture vid;
PImage prev;
int threshold = 80;
void setup()
{
  size(640,480);
  vid = new Capture(this,640,480,30);
  vid.start();
  prev = createImage(640,480,RGB);
}
void draw()
{
  if (vid.available())
  {
    prev.copy(vid,0,0,vid.width,vid.height,0,0,prev.width,prev.height);
    prev.updatePixels();
    vid.read();
  }
  vid.loadPixels();
  prev.loadPixels();
  loadPixels();
  for (int i=0;i<vid.height;i++)
  {
    for (int j=0;j<vid.width;j++)
    {
      int k=i*vid.width+j;
      color currC = vid.pixels[k];
      float r1 = red(currC);
      float g1 = green(currC);
      float b1 = blue(currC);
      color prevC = prev.pixels[k];
      float r2 = red(prevC);
      float g2 = green(prevC);
      float b2 = blue(prevC);
      
      float d = dist(r1,g1,b1,r2,g2,b2);
      if (d<threshold)
        pixels[k] = color(255);
      else
        pixels[k] = color(0);
    }
  }
  updatePixels();
}
