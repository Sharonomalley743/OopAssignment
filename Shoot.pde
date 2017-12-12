class Shoot{
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  boolean over1;           // is the mouse over the slider?
  boolean locked1;
  float ratio;
  int x,y,size1,size2;
  
  Shoot (float xp, float yp, int sw, int sh, int l) 
  {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
    x=1200/2-10;
    y=640;
    size1=80;
    size2=50;
   }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      spos = constrain(mouseX-1, 560, 620);
    }
  }
  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }
    boolean overEvent1() {
    if (mouseX > 550 && mouseX < x+35 &&
       mouseY > 610 && mouseY < y+30) {
      return true;
    } else {
      //pauses and rewinds the sound
      blast.pause();
      blast.rewind();
      return false;
    }
    }
  void display() {
     if (spos >= 615 && spos <= 620.0 ) 
    {
      fill(0,225,0);
      rect(x, y, size1, size2);
      image(img1, width/2-10, 640);
     if (overEvent1()) {
      over1 = true;
    } else {
      over1 = false;
    }
    if (mousePressed && over1) {
      locked1 = true;
    }
    if (!mousePressed) {
      locked1 = false;
    }
    float d=random(-450, 150);
    if (locked1) 
    {
      //plays the blast sound
        blast.play();
      stroke(0,255,0);
      strokeWeight(2);
      line(1200/2+50,189,1200/2+50,160);
      line(1200/2+45,135,1200/2+50,160);
      line(1200/2+75,160,1200/2+50,160);
      line(1200/2+22,160,1200/2+50,160);
      strokeWeight(5);
      line(1200/2+50,160,1200,d);
    }

    }
    noStroke();
    fill(0);
    rect(spos, ypos, sheight, sheight);
  }
}