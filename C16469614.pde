//declaring datatype and variable for image
PImage backgroundimage;
//declaring 2 variables to repeat the background image
int cols;
int rows;
void setup()
{
  //size of window screen, p3d render mode allows me to use 3d objects
  size(1200, 900, P3D);
}

void pics()
{
  //background image
  backgroundimage = loadImage("star.jpg");
  cols = width/backgroundimage.width;
  rows = height/backgroundimage.height;
  if ( width%backgroundimage.width> 0) {
    cols++;
  }
  if ( height%backgroundimage.height > 0) {
    rows++;
  }
  image(backgroundimage, 0, 0);
  for (int y=-600; y<rows; y++)
  {
    for (int x=-250; x<cols; x++)
    {
      image(backgroundimage, x*backgroundimage.width, y*backgroundimage.height);
    }
  }
}

void draw() 
{
  pics();
}