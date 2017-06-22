import processing.video.*;

Capture vid;
color detect;
boolean flag=false;
float colorDiff=11;
float maxDist=14;
int pixelPopulation=25;
ArrayList<Blob> blobs = new ArrayList<Blob>();

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
    vid.loadPixels();
    for (int i=0;i<480;i++)
    {
      for (int j=0;j<640;j++)
      {
        int k=i*640+j;
        color cur = vid.pixels[k];
        float d = dist(red(cur),green(cur),blue(cur),red(detect),green(detect),blue(detect));
        if (d<colorDiff)
        {
          boolean found=false;
          int id=0;
          for (Blob b:blobs)
          {
            if (b.isNear(j,i))
            {
              b.add(j,i);
              found=true;
              break;
            }
            id++;
            
          }
          if (!found)
          {
            Blob b = new Blob(j,i,id);
            blobs.add(b);
          }
        }
      }
    }
    for (Blob b:blobs)
    {
      if (b.size>pixelPopulation)
        b.show();
    }
    blobs.clear();
  }
}
void mousePressed()
{
  flag=true;
  vid.loadPixels();
  detect=vid.pixels[mouseY*640+mouseX];
}
void keyPressed()
{
  if (key=='w')
    maxDist++;
  else if (key=='s')
    maxDist--;
    
  if (key=='a')
    colorDiff++;
  else if (key=='d')
    colorDiff--;
    
  if (key=='q')
    pixelPopulation++;
  else if (key=='e')
    pixelPopulation--;
  
  if (key=='p')
    println(maxDist,colorDiff,pixelPopulation);  
}
