import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture vid;
OpenCV opencv;
Rectangle[] faces;

void setup() {
  size(640,480);
  vid = new Capture(this,640,480,30);
  vid.start();
  opencv = new OpenCV(this,vid);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
  

  
}

void draw() {
  if (vid.available())
  {
    vid.read();
    opencv = new OpenCV(this,vid);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
    faces = opencv.detect();
  }
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

