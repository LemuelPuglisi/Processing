
Tagliaerba t; 

color bgcolor; 

void setup()
{
  bgcolor = color(0, 255, 100, 10); 
  
  size(1000, 1000); 
  background(bgcolor); 

  t = new Tagliaerba(); 
}

void draw()
{
  background(bgcolor); 
  t.run(); 
}
