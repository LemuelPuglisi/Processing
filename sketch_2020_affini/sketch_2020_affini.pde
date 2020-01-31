PImage im, imx2; 

void setup()
{
  size(1536, 1024); 
  background(0); 

  im = loadImage("lena.png"); 
  image(im, 0, 0); 
  
  imx2 = zoomx2(im); 
  image(imx2, 512, 0); 
}

void draw()
{
  //  
}


PImage zoomx2(PImage im)
{
  PImage imx2 = createImage(im.width * 2, im.height * 2, RGB);
  
  for (int i = 0; i < im.width; i++) {
    for (int j = 0; j < im.height; j++) {
      
      int posx = i * 2; 
      int posy = j * 2; 
      
      imx2.set(posx, posy, im.get(i, j)); 
      imx2.set(posx + 1, posy, im.get(i, j)); 
      imx2.set(posx, posy + 1, im.get(i, j)); 
      imx2.set(posx + 1, posy + 1, im.get(i, j)); 
      
    }
  }
  
  return imx2; 
}
