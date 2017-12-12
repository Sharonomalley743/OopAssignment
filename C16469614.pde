//declaring datatype and variable for image
PImage backgroundimage;
PImage photo;
//declaring 2 variables to repeat the background image
int cols;
int rows;
//declare and construct objects for classes
Zoom h1 = new Zoom();
Radar radar1 = new Radar(width/2+350, 840, 35, 0.5, color(0, 255, 0));

void setup()
{
  //size of window screen, p3d render mode allows me to use 3d objects
  size(1200, 900, P3D);
}

void pics()
{
  //background image
  backgroundimage = loadImage("star.jpg");
  //setting cols rows to the number of images needed to cover the a column and a row of the display screen
  cols = width/backgroundimage.width;
  rows = height/backgroundimage.height;
  if ( width%backgroundimage.width> 0) {
    cols++;
  }
  if ( height%backgroundimage.height > 0) {
    rows++;
  }
  //setting image to variable
  photo = loadImage("deathstar.jpg");
  //for loop to print the image repeatedly to the background 
  image(backgroundimage, 0, 0);
  for (int y=-600; y<rows; y++)
  {
    for (int x=-250; x<cols; x++)
    {
      image(backgroundimage, x*backgroundimage.width, y*backgroundimage.height);
    }
  }
}

void drawPanell()
{
  //drawing panell
  noStroke();
  fill(150);
  arc(width/2, 900, 1300, 800, PI, TWO_PI);
  fill(210);
  arc(width/2, 900, 1100, 700, PI, TWO_PI);

  fill(100);
  arc(width/2, 900, 900, 600, PI, TWO_PI);
  strokeWeight(1);
  fill(0);
  stroke(225,0,0);
  //set the x and y axis to the center of the rectangle
  rectMode(CENTER);
  rect(width/2-10, 640, 80, 50);
  
    rectMode(CENTER);
  // rectangle design for speakers
  fill(100);
  rect(width/2+20, 570, 5, 25);
  rect(width/2+10, 570, 5, 25);
  rect(width/2, 570, 5, 25);
  rect(width/2-10, 570, 5, 25);
  rect(width/2-20, 570, 5, 25);
  rect(width/2-30, 570, 5, 25);
  rect(width/2-40, 570, 5, 25);
  
  fill(0);
  stroke(225,0,0);
  rectMode(CENTER);
  rect(width/2-10, 840, 500, 90);
  noStroke();
  
  //handle
  fill(255);
  rect(355, 730, 23, 65);
  stroke(0);
  line(355, 700, 355, 760);
  
  //handle
  fill(255);
  rect(755, 730, 23, 65);
  stroke(0);
  line(755, 700, 755, 760);
  
  //handle
  fill(0, 0, 255);
  rect(590, 730, 90, 25);
  stroke(0);
  line(555, 730, 625, 730);
}

void draw() 
{
  //calling function to display background
  pics();
  //calling function to display the control panel
  drawPanell();
  //calling class to draw radars into a program
  radar1.render();
  radar1.update();
  //calling class to zoom in to image
  h1.update();
  h1.display();
}

void mouseReleased()
{
  h1.releaseEvent();
}