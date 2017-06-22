import processing.video.*;

PImage img;
Capture vid;
boolean flag=false;
float threshold=50;

void setup()
{
  size(640,480);
  vid = new Capture(this,640,480,30);
  img = createImage(640,480,RGB);
  vid.start();
}
void draw()
{
  
  if (vid.available())
    vid.read();
  if (flag)
  {
    vid.loadPixels();
    img.loadPixels();
    loadPixels();
    // remove background
    for (int i=0;i<480;i++)
    {
      for (int j=0;j<640;j++)
      {
        int k=i*640+j;
        color cur = vid.pixels[k];
        color pre = img.pixels[k];
        float d = dist(red(cur),green(cur),blue(cur),red(pre),green(pre),blue(pre));
        if (d<threshold)
          pixels[k]=color(255,255,255);
        else
          pixels[k]=cur;
      }
    }
    updatePixels();
  }
  else
  {
    // show default video
    image(vid,0,0);
  }
}
void mousePressed()
{
  img.loadPixels();
  img.copy(vid,0,0,640,480,0,0,640,480);
  img.updatePixels();
  vid.read();
  flag=true;
}
