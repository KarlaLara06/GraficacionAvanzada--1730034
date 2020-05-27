import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

OpenCV opencv;
Capture video;
Rectangle[] faces;
PImage imagen;

void setup() {
  size(640, 480);
  frameRate(30);
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  background(0);
 
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video = new Capture(this, 640, 480);
  video.start();
  faces = opencv.detect();
  imagen = loadImage("caraGraciosa.png");
}

void draw() {
  if (video.available() == true) {
    video.read();
  }

  image (video, 0, 0);
  opencv.loadImage(video);
  opencv.useColor();
  faces = opencv.detect();
  
  //strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    imagen = loadImage("caraGraciosa.png");
   image(imagen,faces[i].x-75, faces[i].y-20, faces[i].width+120, faces[i].height+20);
  }

}
