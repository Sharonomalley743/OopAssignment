class Zoom
{
  int x, y, xphoto, yphoto;
  int boxx, boxy;
  int size1, size2;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;

  Zoom( ) {
    x = 400;
    y = 705;
    xphoto =500;
    yphoto =280;
    size1 = 45;
    size2 = 10;
    boxx = x - size1/2;//x axis
    boxy = y - size2/2; //yaxis
    //cicx= width/2-200;
    //cicy = 840-25; 
    //cicsize=35-14*2;
    //cicsize1 =35-14 * 2;
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
     if(boxy >= 690 && boxy < 704)
       {
        xphoto = 500;
        yphoto =280;
       }
     if(boxy >= 704 && boxy < 710)
       {
        xphoto = 520;
        yphoto =300;
       }
      if(boxy >= 710 && boxy < 720)
       {
        xphoto = 540;
        yphoto =320;
       }
      if(boxy >= 720 && boxy < 730)
       {
        xphoto = 560;
        yphoto =340;
       }
        if(boxy >= 730 && boxy < 740)
       {
        xphoto = 580;
        yphoto =360;
       }
        if(boxy >= 740 && boxy < 750)
       {
        xphoto = 600;
        yphoto =380;
       }
        if(boxy >= 760 && boxy < 760)
       {
        xphoto = 620;
        yphoto =400;
       }
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
    if(boxy >= 690 && boxy < 704)
     {
       xphoto =500;
       yphoto =280;
     }
        
    imageMode(CENTER);
    image(photo, width/2,200, xphoto, yphoto);
    image(backgroundimage, width/2,-35);
    image(backgroundimage, width/2,385,300, 117);
    image(backgroundimage, width/2+200,385,300, 117);
    image(backgroundimage, width/2-200,385,300, 117);
    image(backgroundimage, width/2-300,200);
    image(backgroundimage, width/2+300,200);
    image(backgroundimage, width/2-300,100);
    image(backgroundimage, width/2+300,100);
    image(backgroundimage, width/2-300,300);
    image(backgroundimage, width/2+300,300);
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