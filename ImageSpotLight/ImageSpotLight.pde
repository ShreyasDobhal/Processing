PImage img;

void setup()
{
  img = loadImage("example.png");
  size(img.width,img.height);
  println(img.width,img.height);
  //image(img,0,0);
}
void draw()
{
  flash();
}
void flash()
{
  loadPixels();
  img.loadPixels();
  for (int i=0;i<img.height;i++)
  {
    for (int j=0;j<img.width;j++)
    {
      int k=i*img.width+j;
      float r = red(img.pixels[k]);
      float g = green(img.pixels[k]);
      float b = blue(img.pixels[k]);
      float d = dist(mouseX,mouseY,j,i);
      float a = map(d,0,200,2,0);
      pixels[k] = color(r*a,g*a,b*a);
    }
  }
  updatePixels();
}
