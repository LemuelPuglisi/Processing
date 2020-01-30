PImage im, tmp; 

int level = 7; 

void settings() 
{
  size(1024, 1024); 
}

void setup()
{
  
  im = loadImage("lena.png");
  im.filter(GRAY); 
  im.resize(1024, 1024);
  tmp = bitplane(im, level); 
  image(im, 0, 0); 

}  


PImage bitplane(PImage im, int level)
{
  PImage tmp = im; 
  tmp.loadPixels(); 
  
  for (int i = 0; i < tmp.pixels.length; i++) {
    int value = (int) red(tmp.pixels[i]);    
    int newValue = (value >> level) & 1; 
    tmp.pixels[i] = color(newValue == 0 ? 0 : 255); 
  }
 
  tmp.updatePixels(); 
  return tmp; 
}



void draw(){}

void keyPressed()
{
  if (key == '+' && level < 7) {
    level++; 
    setup(); 
  }  
  
  if (key == '-' && level > 0) {
    level --; 
    setup(); 
  }
}
