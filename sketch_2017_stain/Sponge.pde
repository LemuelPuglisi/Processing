class Sponge
{
  private int dim, sdim, x, y; 
  
  private color starting_color = color(200, 200, 100); 
  
  private color current_color; 
  
  
  Sponge(int dim)
  {
    this.x = 0; 
    this.y = 0;
    this.dim  = dim; 
    this.sdim = dim; 
    this.current_color = this.starting_color;
  }
  
  private color colorAvg(color c)
  {
    float r = (red(current_color)   + red(c))   / 2; 
    float g = (green(current_color) + green(c)) / 2; 
    float b = (blue(current_color)  + blue(c))  / 2; 
    
    return color(r, g, b); 
  }
  
  public void move(int x, int y)
  {
    this.x = x; 
    this.y = y; 
  }
  
  public void run()
  {
    noStroke(); 
    fill(this.current_color);
    square(this.x - this.dim / 2, this.y - this.dim / 2, dim); 
  }
  
  
  public boolean adsorb(Stain stain)
  {
    if (this.dim < stain.getDiameter()) 
      return false ;
 
    int halfSide = this.dim / 2; 
    int radius   = stain.getDiameter() / 2;  
    
    float xq = sq(this.x - stain.getX());
    float yq = sq(this.y - stain.getY());
    float de = sqrt(xq + yq); 
    
    if (de <= halfSide && radius <= de) { 
      this.dim += radius; 
      this.current_color = colorAvg(stain.bgColor); 
      return true; 
    }
    return false; 
  }
  
  public void reset()
  {
    this.dim = sdim; 
    this.current_color = starting_color; 
  }
  
}
