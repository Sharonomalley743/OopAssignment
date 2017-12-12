class Zoom
{
  int x, y;
  int boxx, boxy;
  int size1, size2;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;

  Zoom( ) 
  {
    x = 400;
    y = 705;
    size1 = 45;
    size2 = 10;
    boxx = x - size1/2;//x axis
    boxy = y - size2/2; //yaxis
  }
  
  void update() {
    boxx = x-size1;
    boxy = y-size2/2;
    
    if (locked == false) {
      overEvent();
      pressEvent();
    }
    
    if (press) {
     boxy = lock(mouseY-1, 700, 760);//change to height not width
    }
  }
  void overEvent() {
    if (overRect1(boxx, boxy, size1, size2)) {
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
    stroke(0);
    rectMode(CENTER);
    fill(0);
    rect(boxx, boxy, size1, size2);
    fill(180);
  }
}

boolean overRect1(int boxx, int boxy, int size1, int size2) {
  if (mouseX >= boxx-size1/2 && mouseX <= boxx+size1 && 
      mouseY >= boxy && mouseY <= boxy+size2) {
    return true;
  } else {
    return false;
      }
}

int lock(int val, int minv, int maxv) { 
  return  min(max(val, minv), maxv); 
} 