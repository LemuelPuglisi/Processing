class Tagliaerba
{
  
  int lato = 90; 
  
  int diametro = 30; 
  
  Tagliaerba()
  {
    // 
  }
  
  public void printShape()
  {
    rectMode(CENTER); 
    fill(125, 125, 125); 
    square(mouseX, mouseY, lato);
    
    fill(0); 
    ellipse(mouseX, mouseY, diametro, diametro); 
  }
  
  public void run()
  {
    this.printShape(); 
  }
  
}
