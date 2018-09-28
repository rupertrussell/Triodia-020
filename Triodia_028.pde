// Triodia 027
// Display phot of a transect with scale 
// 1) Click on top corner of transect scale in photo
// 2) click on oposite corner of transect scale eg 1 meter from first click on photo
// 3) move the mouse to the first point you eant to measure press 1
// 4) move the mouse to the second point you want to measure press 2
// 5) read the distance releative to the scape of the transct in meters
// move mouse to a new point press 1 move to another point and press 2 
// sread new distance between points


// uses arrays to store the x  & y coordinates of up to 200 measursemetn points
int[] x = new int[200];
int[] y = new int[200];


// set up global variables

int imgX = 0;
int imgY = 0;
int imgSize = 1920;

String f = "";
float textOffset = 1.01;


int gridSize = 0;
boolean scaleSet = false;
boolean scale1 = false;
boolean scale2 = false;
boolean point1 = false;
boolean point2 = false;

int saveCounter = 0;
float distance  = 0;
float measuredDistance = 0;
float sumOfMeasuredDistance = 0;

float roundedMeasuredDistance = 0;

PImage img;  // holder for the photogaph

void setup() {
  size(1920, 1080);
  fill(255, 255, 0);

  // load and display a photo  not I have ediete the photo in photo shop to rotate the photo 
  // so that the edges of the scale are horozintal and vertical   

  //  img = loadImage("800x600.png");
  img = loadImage("4000x3000.jpg");
  img.resize(0, 1920);
  image(img, imgX, imgY); // display the image on the screen
}

void draw() {

  PFont f = createFont("Arial", 20);
  textFont(f);
  textSize(20);
  distance = dist(x[1], y[1], x[2], y[2]);  // calculate the distance in pixels between the first 2 clicks
} // end of void draw()



// each time the mouse is clicked do the following
void mouseClicked() {

  // Used to set the scale from the square meter in the phot
  if ((scale1 == true) && (scale2 == false)) {
    x[2] = mouseX;
    y[2] = mouseY;
    scale2 = true;
    scaleSet = true;
    fill(0, 255, 0); // Green
    ellipse(x[2], y[2], 10, 10);
    fill(255, 255, 0); // Yelow
    distance = dist(x[1], y[1], x[2], y[2]);  // calculate the distance in pixels between the first 2 clicks
    grid();
  }

  if (scale1 == false) {
    x[1] = mouseX;
    y[1] = mouseY;
    fill(0, 255, 0); // Green
    ellipse(x[1], y[1], 10, 10);
    fill(255, 255, 0); // Yelow
    scale1 = true;
  }
} // end void mouseClicked()


// used to measure the size of Triodia clumps in the photo
void keyPressed() {

  if (key == '1' || key == '!') {
    if ((scaleSet == true) && (point1 == false)) {
      x[3] = mouseX;
      y[3] = mouseY;
      point1 = true;
      fill(255, 0, 255);
      ellipse(x[3], y[3], 10, 10);
      fill(255, 255, 0);
    } else {
      if (point1 == true) {
        x[4] = mouseX;
        y[4] = mouseY;
        point2 = true;
        point1 = false;
        fill(255, 0, 255);
        ellipse(x[4], y[4], 10, 10);
        stroke(255, 0, 255);
        strokeWeight(2);
        line(x[3], y[3], x[4], y[4]);
        strokeWeight(1);
        stroke(0);
        fill(255, 255, 0);
        measuredDistance = dist(x[3], y[3], x[4], y[4]);
        saveRoundedMeasuredDistance(measuredDistance);

        f = str(roundedMeasuredDistance);
        text(f, x[4] * textOffset, y[4] * textOffset);
      }
    }
  }

  if (key == '2' || key == '@') {
    if (point1 == true) {
      x[4] = mouseX;
      y[4] = mouseY;
      point2 = true;
      point1 = false;
      fill(255, 0, 255);
      ellipse(x[4], y[4], 10, 10);
      stroke(255, 0, 255);
      strokeWeight(2);
      line(x[3], y[3], x[4], y[4]);
      strokeWeight(1);
      stroke(0);
      fill(255, 255, 0);
      measuredDistance = dist(x[3], y[3], x[4], y[4]);
      saveRoundedMeasuredDistance(measuredDistance);

      println("distance in meters = " + roundedMeasuredDistance);
      f = str(roundedMeasuredDistance);
      text(f, x[4] * textOffset, y[4] * textOffset);
    } else {

      println("Please set point 1 first");
    }
  }
  saveCounter ++;
  if (key == 'z' || key == 'Z') {

    save("triodia_015_" + saveCounter + ".png");
  }

  if (key == 'c' || key == 'C') {

    image(img, imgX, imgY); // display the image on the screen
    fill(0, 255, 0); // Green
    ellipse(x[1], y[1], 10, 10);
    ellipse(x[2], y[2], 10, 10);
    fill(255, 255, 0); // Yelow
    scale1 = true;
    grid();
  }
  strokeWeight(1);

  // WSAD movement of lmage on screen WSAD WSAD WSAD WSAD WSAD WSAD WSAD WSAD 
  if (key == 'w' || key == 'W') {
    imgY = imgY - 100;
    y[1] = y[1] - 100;
    y[2] = y[2] - 100;

    image(img, imgX, imgY); // display the image on the screen
        fill(0, 255, 0); // Green
    ellipse(x[1], y[1], 10, 10);
    ellipse(x[2], y[2], 10, 10);
    fill(255, 255, 0); // Yelow
  }

  if (key == 's' || key == 'S') {
    imgY = imgY + 100;
    y[1] = y[1] + 100;
    y[2] = y[2] + 100;
    image(img, imgX, imgY); // display the image on the screen
        fill(0, 255, 0); // Green
    ellipse(x[1], y[1], 10, 10);
    ellipse(x[2], y[2], 10, 10);
    fill(255, 255, 0); // Yelow
  }


  if (key == 'a' || key == 'A') {
    imgX = imgX - 100;
    x[1] = x[1] - 100;
    x[2] = x[2] - 100;

    image(img, imgX, imgY); // display the image on the screen
        fill(0, 255, 0); // Green
    ellipse(x[1], y[1], 10, 10);
    ellipse(x[2], y[2], 10, 10);
    fill(255, 255, 0); // Yelow
  }

  if (key == 'd' || key == 'D') {
    imgX = imgX + 100;
    x[1] = x[1] + 100;
    x[2] = x[2] + 100;
    image(img, imgX, imgY); // display the image on the screen
        fill(0, 255, 0); // Green
    ellipse(x[1], y[1], 10, 10);
    ellipse(x[2], y[2], 10, 10);
    fill(255, 255, 0); // Yelow
  }
} // end void keyPressed()

void saveRoundedMeasuredDistance(float measuredDistance) {
  roundedMeasuredDistance = float(nf((measuredDistance / distance), 0, 2));
  println("distance in meters = " + roundedMeasuredDistance);
}

// draw a grid of dots on the screen 
void grid() {
  for (float i = 0; i < width; i = i + distance) {
    for (float j = 0; j < height; j = j + distance) {
      if (scaleSet == true) {
        ellipse(i, j, 4, 4);
      }
    }
  }
}
