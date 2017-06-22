import processing.video.*;

Capture vid;
boolean flag=false;
float r1=0,g1=0,b1=0;
int x=0,y=0;
float d=1000;

void setup()
{
  size(640,480);
  vid = new Capture(this,640,480,30);
  vid.start();
}
void draw()
{
  if (vid.available())
    vid.read();
  image(vid,0,0);
  
  if (flag)
  {
    d=1000;
    for (int i=0;i<480;i++)
    {
      for (int j=0;j<640;j++)
      {
        int k=i*640+j;
        float r2=red(vid.pixels[k]);
        float g2=green(vid.pixels[k]);
        float b2=blue(vid.pixels[k]);
        float tmp=dist(r1,g1,b1,r2,g2,b2);
        if (tmp<d)
        {
          d=tmp;
          x=j;
          y=i;
        }
      }
    }
    ellipse(x,y,20,20);
  }
}
void mousePressed()
{
  flag=true;
  int k= mouseY*640+mouseX;
  r1=red(vid.pixels[k]);
  g1=green(vid.pixels[k]);
  b1=blue(vid.pixels[k]);
}
