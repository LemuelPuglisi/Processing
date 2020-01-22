
Orologio w; 

int fps = 1; 

void settings()
{
 size(1000, 1000);
}

void setup()
{ 
  background(255); 
  frameRate(fps);
  
  int s = (int)random(0, 59);
  int m = (int)random(0, 59); 
  int h = (int)random(0, 11); 

  println("starting time: " + h + ":" + m + ":" + s);

  w = new Orologio(width/2, height/2, h, m, s); 

  w.print();   
}

void draw()
{
  w.run(); 
}

void keyPressed()
{
  
  if (key == '+' && fps < 60) {
    fps ++; 
    frameRate(fps); 
  }
  
  if (key == '-' && fps > 1) {
    fps --; 
    frameRate(fps); 
  }
  
}
