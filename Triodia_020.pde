// Triodia 015
// Display phot of a transect with scale 
// 1) Click on top corner of transect scale in photo
// 2) click on oposite corner of transect scale eg 1 meter from first click on photo
// 3) move the mouse to the first point you eant to measure press 1
// 4) move the mouse to the second point you want to measure press 2
// 5) read the distance releative to the scape of the transct in meters
// move mouse to a new point press 1 move to another point and press 2 
// sread new distance between points


// set up global variables
String s = "";


int gridSize = 0;
boolean scaleSet = false;
boolean scale1 = false;
boolean scale2 = false;
boolean point1 = false;
boolean point2 = false;

// used for the scale first 2 clicks on phot
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 0;

// used for all other pairs of clicks when measuring triodia
int x3 = 0;
int y3 = 0;
int x4 = 0;
int y4 = 0;

int saveCounter = 0;
float distance  = 0;
float measuredDistance = 0;
PImage img;

void setup() {
  size(800, 761);
  fill(255, 255, 0);

  // load and display a photo  not I have ediete the photo in photo shop to rotate the photo 
  // so that the edges of the scale are horozintal and vertical   

  img = loadImage("800x761.png");
  image(img, 0, 0); // display the image on the screen
}

void draw() {
  distance = dist(x1, y1, x2, y2);  // calculate the distance in pixels between the first 2 clicks


  // draw a gris of dots on the screen 
  if (distance > 0) {
    for (float i = 0; i < width; i = i + distance) {

      for (float j = 0; j < height; j = j + distance) {
        if (scaleSet == true) {
          ellipse(i, j, 5, 5);
        }
      }
    }
  }
} // end of void draw()



// each time the mouse is clicked do the following
void mouseClicked() {

  // Used to set the scale from the square meter in the phot
  if ((scale1 == true) && (scale2 == false)) {
    x2 = mouseX;
    y2 = mouseY;
    scale2 = true;
    scaleSet = true;
    fill(0, 255, 0); // Green
    ellipse(x2, y2, 10, 10);
    fill(255, 255, 0); // Yelow
  }

  if (scale1 == false) {
    x1 = mouseX;
    y1 = mouseY;
    fill(0, 255, 0); // Green
    ellipse(x1, y1, 10, 10);
    fill(255, 255, 0); // Yelow
    scale1 = true;
  }
} // end void mouseClicked()


// used to measure the size of Triodia clumps in the photo
void keyPressed() {

  if (key == '1' || key == '!') {
    if ((scaleSet == true) && (point1 == false)) {
      x3 = mouseX;
      y3 = mouseY;
      point1 = true;
      fill(255, 0, 255);
      ellipse(x3, y3, 10, 10);
      fill(255, 255, 0);
    } else {
      if (point1 == true) {
        x4 = mouseX;
        y4 = mouseY;
        point2 = true;
        point1 = false;
        fill(255, 0, 255);
        ellipse(x4, y4, 10, 10);
        stroke(255, 0, 255);
        strokeWeight(2);
        line(x3, y3, x4, y4);
        strokeWeight(1);
        stroke(0);
        fill(255, 255, 0);
        measuredDistance = dist(x3, y3, x4, y4);
        //      println("measured Distance = " + measuredDistance);
        println("distance in meters = " + measuredDistance / distance);

        s = str(measuredDistance / distance);
        text(s, x4, y4);
      }
    }
  }

  if (key == '2' || key == '@') {
    if (point1 == true) {
      x4 = mouseX;
      y4 = mouseY;
      point2 = true;
      point1 = false;
      fill(255, 0, 255);
      ellipse(x4, y4, 10, 10);
      stroke(255, 0, 255);
      strokeWeight(2);
      line(x3, y3, x4, y4);
      strokeWeight(1);
      stroke(0);
      fill(255, 255, 0);
      measuredDistance = dist(x3, y3, x4, y4);
      //      println("measured Distance = " + measuredDistance);
      println("distance in meters = " + measuredDistance / distance);
        s = str(measuredDistance / distance);
        text(s, x4, y4);    
  
} else {

      println("Please set point 1 first");
    }
  }
  if (key == 's' || key == 'S') {

    save("triodia_015_" + saveCounter + ".png");
  }

  if (key == 'c' || key == 'C') {

    image(img, 0, 0); // display the image on the screen
    fill(0, 255, 0); // Green
    ellipse(x1, y1, 10, 10);
    ellipse(x2, y2, 10, 10);
    fill(255, 255, 0); // Yelow
    scale1 = true;
  }
  strokeWeight(1);
} // end void keyPressed()
