/*
   Contrast stretching
*/

PImage im, sim; 

void setup()
{
  size(1024, 512); 
  
  im = loadImage("lena.png");
  im.filter(GRAY); 
  image(im, 0, 0); 
  
  sim = stretch(im);
  image(sim, 512, 0); 
}


void draw(){}

PImage stretch(PImage im) 
{
  PImage tmp = im.copy(); 
  tmp.loadPixels(); 
  
  float min = red(tmp.pixels[0]); 
  float max = red(tmp.pixels[0]); 
 
  for (int i = 0; i < tmp.pixels.length; i++) {
    min = min > red(tmp.pixels[i]) ? red(tmp.pixels[i]) : min;
    max = max < red(tmp.pixels[i]) ? red(tmp.pixels[i]) : max;
  }
 
  for (int i = 0; i < tmp.pixels.length; i++) {
    
    float range = max - min; 
    float value = red(tmp.pixels[i]) - min; 
    
    float newValue = (value * 255) / range; 
    tmp.pixels[i] = color(newValue); 
  }
  
  return tmp; 
}
