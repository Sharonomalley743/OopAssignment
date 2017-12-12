class Radar
{
  float cx, cy;
  float radius;
  float theta;
  float speed;
  float frequency;
  color c;

 Radar(float cx, float cy, float radius, float frequency, color c)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 130.0) * frequency;
    this.theta = 0;
    this.c = c;
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    fill(180);
    //ellipse(cx, cy-20, radius-14*2, radius-14 * 2);
    stroke(255,0,0);
    noFill();
    ellipse(cx, cy, radius * 2, radius * 2);
    ellipse(cx, cy, 50, 50);
    ellipse(cx, cy, radius-1 * 2, radius-1 * 2);
    ellipse(cx, cy, radius-8 * 2, radius-8 * 2);
    line(cx, cy, cx, cy+35);
    line(cx, cy, cx, cy-35);
    line(cx, cy, cx+35, cy);
    line(cx, cy, cx-35, cy);
    int trailLength = 15;
    float greenIntensity = 255 / (float)trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {
      stroke(0, i * greenIntensity, 0);
      float x = cx + sin(theta + i * speed) * radius;
      float y = cy -cos(theta + i * speed) * radius;
      line(cx, cy, x, y);
    }
    
    stroke(255,0,0);
    rect(cx+350, cy-10, 25, 60);
    for(int i=-30; i< 30;i++)
    {
    line(cx+340, cy+i, cx+360, cy+i);
    i=i+11;
    }
    for(int i = 0 ; i < 10 ; i ++)
    {
      stroke(0, i * greenIntensity, 0);
      float y = cy -cos(theta + i * speed) * 28;
      line(cx+340, y-10, cx+360, y-10);
    }
    
  }
}