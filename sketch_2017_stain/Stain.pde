class Stain 
{
    
  private int x, y, diameter; 
  
  public color bgColor; 
  
  Stain(int diameter, int x, int y)
  {
    this.diameter = diameter;
    this.x = x; 
    this.y = y; 
    this.bgColor = color(#654321); 
  }
  
  public int getX()
  {
    return this.x; 
  }
  
  public int getY()
  {
    return this.y; 
  }
  
  public int getDiameter()
  {
    return this.diameter; 
  }
  
  Stain(int diameter, int x, int y, color c)
  {
    this.diameter = diameter;
    this.x = x; 
    this.y = y; 
    this.bgColor = c; 
  } 
 
  private void randomYmove()
  {
    this.y += (int)random(5);   
  }
 
  private void randomXmove()
  {
    this.x += (int)random(-2, 2); 
  }
 
  public void run() 
  {
    noStroke(); 
    fill(this.bgColor);
    circle(this.x, this.y, this.diameter); 
    
    this.randomYmove(); 
    this.randomXmove(); 
  }
}
