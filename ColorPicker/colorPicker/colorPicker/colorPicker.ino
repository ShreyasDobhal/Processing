// 8 9 10 11
int green = 8;
int blue = 9;
int red = 11;
int gnd =10;
int R=0,G=0,B=0;
int val=0;
int pins[3]={11,8,9};
int pin=0;
void setup()
{
  
  for (int i=0;i<4;i++)
  {
    pinMode(i+8,OUTPUT);
    digitalWrite(i+8,HIGH);
  }
  Serial.begin(9600);
}
void loop()
{
  if (Serial.available()>0)
  {
    int dump=0;
    while (Serial.available()>0)
    {
      dump=Serial.read();
      if (dump=='!')
      {
        // Color Value Changed
        dump=0;
        if (pin>0&&pin<4)
          analogWrite(pins[pin-1],255-val);
        pin++;
        if (pin>=4)
          pin=0;
        val=0;
      }
      else
      {
        val=val*10+(dump-48);
      }
    }
  }
}
