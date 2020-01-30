PImage im; 

int s = 70; 

boolean lock = false;

int x_lock; 
int y_lock; 

int x_call; 
int y_call; 


void setup()
{
  background(0); 
  
  size(1024, 1024); 
  
  im = loadImage("lena.png"); 

  im.resize(1024, 1024); 
  
  image(im, 0, 0); 
}

void draw()
{
  image(im, 0, 0); 
  if (!lock) {
     
    stroke(0, 255, 0); 
    strokeWeight(10); 
    noFill(); 
    square(mouseX - s/2, mouseY - s/2, s); 
    
  }
  else {
    
    strokeWeight(10); 
    noFill(); 
    
    stroke(255, 165, 0); 
    square(x_lock, y_lock, s); 
    
    stroke(0, 255, 0);    
    square(mouseX - s/2, mouseY - s/2, s); 
  }
}

PImage swap(PImage im, int x1, int y1, int x2, int y2, int s) 
{
  PImage cp = im.copy(); 
  
  PImage subimage_1 = cp.get(x1, y1, s, s);
  PImage subimage_2 = cp.get(x2, y2, s, s);
  
  for (int i = 0; i < s; i++) {
    for (int j = 0; j < s; j++) {

      color tmp = subimage_1.get(i, j); 
      subimage_1.set(i, j, subimage_2.get(i, j));
      subimage_2.set(i, j, tmp); 
      
    }
  }
  
  cp.set(x1, y1, subimage_1); 
  cp.set(x2, y2, subimage_2); 
  
  return cp; 
}

void mousePressed()
{
  if (!lock) {
    lock = true; 
    x_lock = mouseX - s/2;
    y_lock = mouseY - s/2;
  }
  else {
    x_call = mouseX - s/2;
    y_call = mouseY - s/2;
    im = swap(im, x_lock, y_lock, x_call, y_call, s); 
    lock = false; 
  }
}

void keyPressed()
{
  if (key == '-' && s > 39 && !lock) {
    s -= 10; 
  }
  
  if (key == '+' && s < 139 && !lock) {
    s += 10; 
  }
  
  
}
