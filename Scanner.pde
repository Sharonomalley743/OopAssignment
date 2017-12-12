class Scanner
{
  int x, y, yl;
  int boxx, boxy;
  int size1, size2;
  int cicx,cicy,cicsize,cicsize1;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;

  Scanner( ) {
    x = 800;
    y = 760;
    size1 = 45;
    size2 = 10;
    boxx = x - size1/2;//x axis
    boxy = y - size2/2; //yaxis
    yl = 0;
  }
  
  void update() {
    boxx = x-size1;
    boxy = y-size2/2;
    
 
    if (overRect2(boxx, boxy, size1, size2)) {
      over = true;
    } else {
      over = false;
    }
    
    if (mousePressed && over || locked) {
     locked=true;
    }
    if(!mousePressed)
    {
      locked=false;
      scanner.pause();
      scanner.rewind();
    }
     if (locked) {
      boxy = lock2(mouseY-1, 700, 760);//change to height not width
      scanner.play();
   if(boxy >= 704 && boxy < 710)
       {
         scanner.play();
        stroke(0,255,0);
        line(0,yl+4,1200,yl+4);
       }
      if(boxy >= 710 && boxy < 720)
       {
        stroke(0,255,0);
        line(0,yl+60,1200,yl+60);
       }
      if(boxy >= 720 && boxy < 735)
       {
        stroke(0,255,0);
        line(0,yl+180,1200,yl+180);
       }
       if(boxy >= 725 && boxy < 730)
       {
        stroke(0,255,0);
        line(0,yl+230,1200,yl+230);
       }
        if(boxy >= 730 && boxy < 735)
       {
        stroke(0,255,0);
        line(0,yl+300,1200,yl+300);
       }
       if(boxy >= 735 && boxy < 740)
       {
        stroke(0,255,0);
        line(0,yl+330,1200,yl+330);
       }
        if(boxy >= 740 && boxy < 750)
       {
        stroke(0,255,0);
        line(0,yl+380,1200,yl+380);
       }
        if(boxy >= 750 && boxy < 760)
       {
        stroke(0,255,0);
        line(0,yl+425,1200,yl+425);
       }
    }
  }
    
  void display() {
    stroke(0);
    rectMode(CENTER);
    fill(0);
    rect(boxx, boxy, size1, size2);
  }
}

boolean overRect2(int boxx, int boxy, int size1, int size2) {
  if (mouseX >= boxx-size1/2 && mouseX <= boxx+size1 && 
      mouseY >= boxy && mouseY <= boxy+size2) {
    return true;
  } else {
    return false;
      }
}

int lock2(int val, int minv, int maxv) { 
  return  min(max(val, minv), maxv); 
} 