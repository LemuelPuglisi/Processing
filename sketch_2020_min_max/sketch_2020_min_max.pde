PImage im; 

void setup()
{
  size(512, 512); 
  
  im = loadImage("lena.png");
  im.filter(GRAY); 
  image(im, 0, 0); 
}

void draw()
{
   image(im, 0, 0);      
}

PImage minimo(PImage im, int n)
{
  if (n % 2 == 0) 
    println("Errore: il kernel del filtro deve avere dimensione dispari"); 

  int span = floor(n/2); 

  int wdim = im.width  + span * 2; 
  int hdim = im.height + span * 2; 

  PImage tmp = createImage(wdim, hdim, RGB);   
  
  tmp.loadPixels(); 
  for (int i = 0; i < tmp.pixels.length; i ++) 
    tmp.pixels[i] = color(255);
  tmp.updatePixels(); 
  
  
  tmp.set(span, span, im);  
  PImage tmp_ = tmp.copy(); 
  
  for (int i = span; i < tmp.width - span; i++) {
    for (int j = span; j < tmp.height - span; j++) {
      
      int shiftedX = i - floor(n/2); 
      int shiftedY = j - floor(n/2); 
      
      PImage subImage = tmp.get(shiftedX, shiftedY, n, n); 

      subImage.loadPixels(); 
      
      float min = 255; 
      
      for (int c = 0; c < subImage.pixels.length; c++)
        min = red(subImage.pixels[c]) < min ? red(subImage.pixels[c]) : min; 
        
      tmp_.set(i, j, color(min)); 
    }
  }
  
  return tmp_.get(span, span, im.width, im.height); 
}

PImage massimo(PImage im, int n)
{
  if (n % 2 == 0) 
    println("Errore: il kernel del filtro deve avere dimensione dispari"); 

  PImage tmp = im.copy(); 
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.height; j++) {
      
      int shiftedX = i - floor(n/2); 
      int shiftedY = j - floor(n/2); 
      
      PImage subImage = im.get(shiftedX, shiftedY, n, n); 

      subImage.loadPixels(); 
      
      float max = 0; 
      
      for (int c = 0; c < subImage.pixels.length; c++)
        max = red(subImage.pixels[c]) > max ? red(subImage.pixels[c]) : max; 
        
      tmp.set(i, j, color(max)); 
    }
  }
  
  return tmp; 
}

void keyPressed()
{
  if (key == 'm') im = minimo(im, 7);
  if (key == 'M') im = massimo(im, 7); 
  if (key == ' ') setup(); 
}
