PImage im; 
int N = 101; 

void setup() 
{  
  size(512, 512); 
  background(0);
  
  N = 101; 
  im = loadImage("lena.png"); 
  image(im, 0, 0); 
}

void draw() {
    
    image(im, 0, 0); 
    
    rectMode(CENTER); 
    noFill(); 
    stroke(color(0, 255, 0)); 
    strokeWeight(2); 
    square(mouseX, mouseY, N); 
  
}

PImage lemonFilter(PImage im) 
{
  PImage tmp = im.copy(); 
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.height; j++) {
      color old_c = tmp.get(i, j); 
      
      float r = red(old_c) - (blue(old_c) / 8); 
      float g = green(old_c) + blue(old_c); 
      float b = 0; 
       
      tmp.set(i, j, color(r, g, b)); 
    }
  }
 
  return tmp; 
}

PImage orangeFilter(PImage im) 
{
  PImage tmp = im.copy(); 
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.height; j++) {
      color old_c = tmp.get(i, j); 
      
      float r = red(old_c) + blue(old_c);
      float g = green(old_c); 
      float b = 0; 
       
      tmp.set(i, j, color(r, g, b)); 
    }
  }
 
  return tmp; 
}

PImage applyArea(PImage im, int x, int y, int d, int f) 
{
  PImage imt = im.copy(); 
  PImage tmp = im.get(x - d/2, y - d/2, d, d); 
  
  tmp = f == 0 ? lemonFilter(tmp) : orangeFilter(tmp); 
  
  imt.set(x - d/2, y - d/2, tmp);   
  return imt; 
}

void mousePressed() 
{  
  int f = mouseButton == LEFT ? 1 : 0; 
  im = applyArea(im, mouseX, mouseY, N, f);  
}

void keyPressed()
{
  if (key == 'r' || key == 'R') 
    setup(); 
    
  if (key == '-' && N > 51)  N-=2; 
  if (key == '+' && N < 151) N+=2; 
}
