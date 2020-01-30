ArrayList<Stain> stains;

Sponge bob; 

void setup()
{
  size(700, 700); 
  
  stains = new ArrayList<Stain>();   
  bob    = new Sponge(30); 
}

void draw()
{
  background(0, 200, 255); 
  
  bob.move(mouseX, mouseY); 
  bob.run(); 
   
  for (int i = 0; i < stains.size(); i++) {
    stains.get(i).run(); 
    if (bob.adsorb(stains.get(i))) 
      stains.remove(i); 
  } 
  
}

void keyPressed() 
{
  if (key == 'R' || key == 'r')
    bob.reset(); 
    
  if (key == 'S' || key == 's')
    stains.add(new Stain(
      (int)random(10, 51), 
      (int)random(50, 651), 
      -30
    )); 
}
