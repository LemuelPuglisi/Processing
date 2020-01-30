/*
   Contrast stretching
*/

PImage im, sim, eim; 

void setup()
{
  size(1536, 512); 
  
  im = loadImage("lena.png");
  im.filter(GRAY); 
  image(im, 0, 0); 
  
  sim = stretch(im);
  image(sim, 512, 0); 

  eim = equalize(im); 
  image(eim, 1024, 0); 
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

PImage equalize(PImage im) 
{
  PImage tmp = im.copy();   
  tmp.loadPixels(); 
  
  float[] probability = new float[256];
  float[] newValues   = new float[256]; 
  
  for (int i = 0; i < tmp.pixels.length; i++) 
    probability[ (int)red(tmp.pixels[i])] ++;
  
  for (int i = 0; i < 256; i++) {
    float sum = 0; 
    for (int j = 0; j <= i; j++) 
        sum += probability[j] / tmp.pixels.length; 
    sum *= 256; 
    newValues[i] = sum; 
  }
  
  for (int i = 0; i < tmp.pixels.length; i++) {
   int currentColor = (int)red(tmp.pixels[i]);
   tmp.pixels[i] = color(newValues[currentColor]); 
  }
  
  return tmp; 
}
