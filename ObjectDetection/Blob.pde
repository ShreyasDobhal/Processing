class Blob
{
  int minx,miny,maxx,maxy;
  int size;
  int id=0;
  public Blob(int x,int y,int i)
  {
    minx=maxx=x;
    miny=maxy=y;
    size=1;
    id=i;
  }
  public boolean isNear(int x,int y)
  {
    int cx=max(min(x,maxx),minx);
    int cy=max(min(y,maxy),miny);
    if (dist(cx,cy,x,y)<maxDist)
      return true;
    return false;
  }
  public void add(int x,int y)
  {
    minx=min(x,minx);
    maxx=max(x,maxx);
    miny=min(y,miny);
    maxy=max(y,maxy);
    size++;
  }
  public void show()
  {
    //rectMode(CORNER);
    rect(minx,miny,maxx-minx,maxy-miny);
    text(id,minx,miny);
  }
}
