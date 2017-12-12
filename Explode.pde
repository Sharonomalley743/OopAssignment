/*class Explode
{
  int x, y;
  int boxx, boxy;
  int size;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  int cellsize = 40; // Dimensions of each cell in the grid
  int columns = 500 / cellsize;  // Calculate # of columns
  int rows = 280 / cellsize;  // Calculate # of rows

  Explode( ) {
    x = 800;
    y = 730;
    size = 50;
    }
  
  void update() {
    if (locked == false) {
      overEvent();
      pressEvent();
    }
    
    if (press) {
      // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*backgroundimage.width;  // Pixel array location
      color c = backgroundimage.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (40097/ float(width)) * brightness(backgroundimage.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }}}
  }
  void overEvent() {
    if (overCirc2(boxx, boxy, size)) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void pressEvent() {
    if (over && mousePressed || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }
  
  void releaseEvent() {
    locked = false;
  }
  
  void display() {
    stroke(225,0,0);
    fill(0,0,255);
    rect(boxx, boxy, size, size);
  }
}

boolean overCirc2(int boxx, int boxy, int size) {
  if (mouseX >= boxx-size/2 && mouseX <= boxx+size && 
      mouseY >= boxy && mouseY <= boxy+size) {
    return true;
  } else {
    return false;
      }
}


/*
void draw() {
  background(0);
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*backgroundimage.width;  // Pixel array location
      color c = backgroundimage.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (40097/ float(width)) * brightness(backgroundimage.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
      println(mouseX);
    }
  }
}*/