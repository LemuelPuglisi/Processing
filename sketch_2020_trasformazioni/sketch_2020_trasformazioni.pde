

float theta = 0; 

int scale = 1; 

PImage im; 

void setup()
{
  size(1024, 1024);
  
  background(#212121); 
  
  im = loadImage("lena.png"); 
  
  im = inverseRotateImage(im, theta); 
  
  im = inverseScaleImage(im, scale); 
  
  image(im, 256 - (256 * (scale - 1)), 256 - (256 * (scale - 1))); 
}

void draw()
{

}

PImage forwardRotateImage(PImage im, float theta)
{
  PImage rim = createImage(im.width, im.height, RGB);
  
  for (int i = 0; i < im.width; i++) {
    for (int j = 0; j < im.height; j++) {
    
          int x = i - im.width/2; 
          int y = j - im.height/2; 
      
          int xRot = floor(x * cos(theta) - y * sin(theta)) + im.width/2; 
          int yRot = floor(x * sin(theta) + y * cos(theta)) + im.height/2; 
         
          rim.set(xRot, yRot, im.get(i, j)); 
    }
  }
  
  return rim; 
}

PImage inverseRotateImage(PImage im, float theta)
{
  PImage rim = createImage(im.width, im.height, RGB);
  
  for (int x = 0; x < rim.width; x++) {
    for (int y = 0; y < rim.height; y++) {
    
      // traslate to center 
      
      int currentx = x - rim.width/2; 
      int currenty = y - rim.height/2; 
      
      int inversePosX = floor(currentx * cos(theta)  + currenty * sin(theta)) + rim.width/2; 
      int inversePosY = floor(currentx * -sin(theta) + currenty * cos(theta)) + rim.height/2; 
      
      rim.set(x, y, im.get(inversePosX, inversePosY)); 
    }
  }

  return rim; 
}


PImage forwardScaleImage(PImage im, int n)
{
  PImage tmp = createImage(im.width * n, im.height * n, RGB);
  
  for (int i = 0; i < im.width; i++) {
    for (int j = 0; j < im.height; j++) {
      
      int x = i * n; 
      int y = j * n; 
      
      tmp.set(x, y, im.get(i, j)); 
    }
  }
  
  return tmp; 
}


PImage inverseScaleImage(PImage im, int n)
{
  PImage tmp = createImage(im.width * n, im.height * n, RGB);
  
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.height; j++) {
      
      int x = floor(i / n); 
      int y = floor(j / n); 
      
      tmp.set(i, j, im.get(x, y)); 
    }
  }
  
  return tmp; 
}

void keyPressed() 
{
  if (key == 'r') {
    theta += HALF_PI / 2; 
    setup(); 
  }
  
  if (key == 's') {
    scale ++; 
    setup(); 
  }
}
