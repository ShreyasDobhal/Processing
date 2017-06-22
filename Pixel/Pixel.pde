int thickness=25;
int r=0,g=0,b=0;
PImage img;
void setup()
{
  img = loadImage("example.png");
  //size(img.width,img.height);
  size(400,400);
  background(45,96,100);
  //image(img,0,0);
  loadPixels();
  for (int i=0;i<pixels.length;i++)
  {
    
    pixels[i]=color(r,g,b);
  }
  
  updatePixels();
}
void draw()
{
  //for (int i=0;i<thickness;i++)
    //for (int j=0;j<thickness;j++)
      //set(mouseX-thickness/2+i,mouseY-thickness/2+j,color(0,0,200));
  //println(blue(get(200,120)));
  
  loadPixels();
  for (int i=0;i<width;i++)
  {
    for (int j=0;j<height;j++)
    {
      int k=i*width+j;
      float d = dist(i,j,mouseY,mouseX);
      pixels[k]=color(d);
    }
  }
  updatePixels();
  
  int k=mouseY*img.width+mouseX;
  println(red(pixels[k]),green(pixels[k]),blue(pixels[k]));
  //for (int i=0;i<img.width;i++)
    //img.pixels[(img.height/2)*img.width+i]=color(0,0,0);
}
