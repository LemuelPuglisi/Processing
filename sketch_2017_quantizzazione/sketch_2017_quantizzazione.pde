PImage im, imq; 
int k = 2;

float mseInfo[]; 

void setup() 
{
  background(0); 
  
  size(768, 256); 
  im = loadImage("lena.png");   
  
  im.resize(256, 256); 
  image(im, 0, 0); 
 
  imq = rgbQuant(im, k); 
  image(imq, 256, 0); 

  mseInfo = mse(im, imq); 
  
  float oc = pow(k, 3); 
  
  textSize(16); 
  text("quantization costant: " + k,          520, 20);
  text("#obtainable colors: "   + oc,         520, 50); 
  text("red mse ratio: "        + mseInfo[0], 520, 80);
  text("green mse ratio: "      + mseInfo[1], 520, 110);
  text("blue mse ratio: "       + mseInfo[2], 520, 140);
  text("average mse ratio: "    + mseInfo[3], 520, 170);
  
}

void draw()
{
    
}


// quantizzazione 

PImage rgbQuant(PImage im, int n) 
{
  PImage tmp = im.copy();
    
  for (int i = 0; i < tmp.width; i++) {
    for (int j = 0; j < tmp.height; j++) {
      
      color pixel = tmp.get(i, j);
      
      float r = (red(pixel)   * n) / 256;
      float g = (green(pixel) * n) / 256; 
      float b = (blue(pixel)  * n) / 256;
      
      r = map(r, 0, n, 0, 255); 
      g = map(g, 0, n, 0, 255); 
      b = map(b, 0, n, 0, 255);
      
      color newPixel = color(r, g, b); 
      
      tmp.set(i, j, newPixel); 
    }
  }
  return tmp; 
}

// Calcolo dell'MSE 

float[] mse(PImage a, PImage b)
{
  float result[] = new float[4]; 

  for (int i = 0; i < 4; i ++)
    result[i] = 0; 

  result[0] = 0;
  result[1] = 0;  
  result[2] = 0;
  result[3] = 0;
 
  for (int i = 0; i < a.width; i++) {
    for (int j = 0; j < a.height; j++) {
    
      color ap = a.get(i, j); 
      color bp = b.get(i, j); 
      
      result[0] += pow((red(ap) - red(bp)), 2);
      result[1] += pow((green(ap) - green(bp)), 2);
      result[2] += pow((blue(ap) - blue(bp)), 2);
      
    }
  }
 
  for (int i = 0; i < 3; i ++)
    result[i] /= (a.width * a.height);  
 
  result[3] = (result[0] + result[1] + result[2]) / 3; 
  
  return result; 
}

void keyPressed()
{
  if (key == '+' && k < 256) {
    k++; 
    setup(); 
  }
  if (key == '-' && k > 2) {
    k--; 
    setup(); 
  }
  if (key == 'q') {
    k = 2; 
    setup(); 
  }
  if (key == 'w') {
    k = 256; 
    setup(); 
  }
}
