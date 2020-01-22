
class Orologio
{
  
  int x, y; 
  
  int h, m, s; 
  
  int moduloLancettaSecondi = 50 * 2;   
  int moduloLancettaMinuti  = 40 * 2; 
  int moduloLancettaOre     = 30 * 2; 
  
  int spessoreLancettaSecondi = 1; 
  int spessoreLancettaMinuti  = 2; 
  int spessoreLancettaOre     = 3; 
  
  color coloreLancettaSecondi = color(0, 0, 0);
  color coloreLancettaMinuti  = color(255, 0, 0);
  color coloreLancettaOre     = color(0, 0, 255);
  
  float faseLancettaSecondi = PI / 2;  
  float faseLancettaMinuti  = PI / 2; 
  float faseLancettaOre     = PI / 2; 
  
  float incrementoFaseSecondi = 2 * PI / 60;  // secondi in 12 ore 
  float incrementoFaseMinuti  = 2 * PI / 60;    // minuti in 12 ore
  float incrementoFaseOre     = 2 * PI / 12; 
  
  color bordo = color(0, 255, 0); 
  
  Orologio(int x, int y, int h, int m, int s)
  {
    this.x = x; 
    this.y = y; 
    this.h = h; 
    this.m = m; 
    this.s = s; 
    
    this.faseLancettaSecondi -= s * incrementoFaseSecondi; 
    this.faseLancettaMinuti  -= m * incrementoFaseMinuti; 
    this.faseLancettaOre     -= h * incrementoFaseOre; 
  }
  
  private int getXfromPolarCords(float modulo, float fase)
  {
    int x = int(modulo * cos(fase));      
    return x + this.x; 
  }
  
  private int getYfromPolarCords(float modulo, float fase)
  {
    int y = int(modulo * sin(fase)); 
    return this.y - y; 
  }
  
  private void drawShape()
  {
    strokeWeight(20); 
    stroke(bordo);
   
    ellipse(this.x, this.y, 120 * 2, 120 * 2); 
  
    stroke(coloreLancettaSecondi); 
    strokeWeight(spessoreLancettaSecondi);
    line(
      this.x, this.y,
      this.getXfromPolarCords(moduloLancettaSecondi, faseLancettaSecondi), 
      this.getYfromPolarCords(moduloLancettaSecondi, faseLancettaSecondi)
    ); 
    
    stroke(coloreLancettaMinuti); 
    strokeWeight(spessoreLancettaMinuti);
    line(
      this.x, this.y,
      this.getXfromPolarCords(moduloLancettaMinuti, faseLancettaMinuti), 
      this.getYfromPolarCords(moduloLancettaMinuti, faseLancettaMinuti)
    ); 
    
    stroke(coloreLancettaOre); 
    strokeWeight(spessoreLancettaOre);
    line(
      this.x, this.y,
      this.getXfromPolarCords(moduloLancettaOre, faseLancettaOre), 
      this.getYfromPolarCords(moduloLancettaOre, faseLancettaOre)
    ); 
    
  }
  
  public void print()
  {
    this.drawShape();   
  }
  
  public void run()
  {
    this.s = (this.s + 1) % 60; 
    this.faseLancettaSecondi -= incrementoFaseSecondi;
    
    if (this.s == 0) {
      this.m = (this.m + 1) % 60; 
      this.faseLancettaMinuti -= incrementoFaseMinuti; 
      
      if (this.m == 0) {
        this.h = (this.h + 1) % 12; 
        this.faseLancettaOre -= this.incrementoFaseOre; 
      }
    
    }
    
    println("current time: " + h + ":" + m + ":" + s);
    this.print(); 
  }
}
