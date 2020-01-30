/*
  Operatori puntuali: 
    * Negativo
    * Gamma
    * logaritmo

  credits @ Lemuel Puglisi
*/

PImage im, imNeg, imLog, imGam; 

void settings()
{
  size(2048, 600);  
}

void setup()
{
  background(color(#212121));
  
  im = loadImage("lena.png");
  imNeg = negative(im); 
  imLog = logarithmic(im); 
  imGam = gamma(im, 5); 
  
  image(im, 0, 0);
  image(imNeg, 512, 0);
  image(imLog, 1024, 0);
  image(imGam, 1536, 0);
}

void draw() {
  
  textSize(48); 
  text("Original", 150, 570); 
  text("Negative", 662, 570); 
  text("Logarithm", 1174, 570); 
  text("Gamma", 1686, 570); 

}


PImage negative(PImage im)
{
  PImage tmp = im.copy(); 
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.width; j++) {
      
      color pixel = tmp.get(i, j); 
      
      float r = 255 - red(pixel); 
      float g = 255 - green(pixel); 
      float b = 255 - blue(pixel); 
      
      tmp.set(i, j, color(r, g, b)); 
    }
  }
  
  return tmp; 
}


PImage logarithmic(PImage im)
{
  PImage tmp = im.copy(); 
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.width; j++) {
      
      color pixel = tmp.get(i, j); 
      
      float c = 255 / log(256);  
      
      float r = c * log(1 + red(pixel)); ; 
      float g = c * log(1 + green(pixel)); 
      float b = c * log(1 + blue(pixel)); 
      
      tmp.set(i, j, color(r, g, b)); 
    }
  }
  
  return tmp; 
}

PImage gamma(PImage im, int gamma)
{
  PImage tmp = im.copy(); 
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.width; j++) {
      
      color pixel = tmp.get(i, j); 
      
      float c = 255 / pow(255, gamma);  
      
      float r = c * pow(red(pixel), gamma);  
      float g = c * pow(green(pixel), gamma); 
      float b = c * pow(blue(pixel), gamma);
      
      tmp.set(i, j, color(r, g, b)); 
    }
  }
  
  return tmp; 
}
