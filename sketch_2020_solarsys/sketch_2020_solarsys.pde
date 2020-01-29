
PImage  sun, 
        mercury, 
        venus, 
        earth, 
        moon, 
        mars, 
        jupyter, 
        saturn, 
        uranus, 
        neptune, 
        pluto;  
import com.hamoid.*;

// VideoExport videoExport;

float sunAngle = 0; 
float sunSpeed = 0.04;

float mercuryAngle = 0; 
float mercurySpeed = 0.035;

float venusAngle = 0; 
float venusSpeed = 0.03;  

float earthAngle = 0; 
float earthSpeed = 0.025; 

float marsAngle = 0; 
float marsSpeed = 0.02;

float moonAngle = 0; 
float moonSpeed = 0.04; 

float jupyterAngle = 0; 
float jupyterSpeed = 0.015; 

float saturnAngle = 0; 
float saturnSpeed = 0.01;

float uranusAngle = 0; 
float uranusSpeed = 0.0055;

float neptuneAngle = 0; 
float neptuneSpeed = 0.005;

float plutoAngle = 0; 
float plutoSpeed = 0.0025;

void setup()
{
  
  size(2000, 2100); 
  background(color(#010e18));
  
  imageMode(CENTER); 
  sun = loadImage("sun.png"); 
  sun.resize(200, 200); 

  mercury = loadImage("mercury.png"); 
  mercury.resize(50, 50); 
  
  venus = loadImage("venus.png"); 
  venus.resize(75, 75); 

  earth = loadImage("earth.png"); 
  earth.resize(65, 65); 

  moon = loadImage("moon.png"); 
  moon.resize(20, 20); 

  mars = loadImage("mars.png"); 
  mars.resize(80, 80); 
  
  jupyter = loadImage("jupyter.png"); 
  jupyter.resize(100, 100); 
  
  saturn = loadImage("saturn.png"); 
  saturn.resize(100, 100); 
  
  uranus = loadImage("uranus.png"); 
  uranus.resize(80, 80);
  
  neptune = loadImage("neptune.png"); 
  neptune.resize(85, 85);

  pluto = loadImage("pluto.png"); 
  pluto.resize(40, 40);
  
  // videoExport = new VideoExport(this);
  // videoExport.startMovie();
}

void draw() 
{
    
  for (int i = 0; i < 20; i++) {
    float randomX = random(width);
    float randomY = random(height);
    float randomSize = random(10); 
    ellipse(randomX, randomY, randomSize, randomSize); 
  }
  
  fill(color(#010e18), 30); 
  rect(0, 0, width, height);   
  fill(255);   
    
  translate(width/2, height/2); 

  pushMatrix(); 
  rotate(sunAngle); 
  image(sun, 0, 0); 
  popMatrix(); 

  pushMatrix(); 
  rotate(mercuryAngle);
  image(mercury, 150, 150); 
  popMatrix(); 
  
  pushMatrix(); 
  rotate(venusAngle);
  image(venus, 230, 230); 
  popMatrix(); 

  pushMatrix();
  rotate(earthAngle);
  image(earth, 290, 290);
  
    pushMatrix();
    translate(290, 290); 
    rotate(moonAngle); 
    image(moon, 40, 40); 
    popMatrix(); 
  
  popMatrix(); 

  pushMatrix(); 
  rotate(marsAngle);
  image(mars, 360, 360); 
  popMatrix(); 
  
  pushMatrix(); 
  rotate(jupyterAngle);
  image(jupyter, 430, 430); 
  popMatrix();  
  
  pushMatrix(); 
  rotate(saturnAngle);
  image(saturn, 510, 510);     
  popMatrix(); 
  
  pushMatrix(); 
  rotate(uranusAngle);
  image(uranus, 590, 590); 
  popMatrix();  
  
  pushMatrix(); 
  rotate(neptuneAngle);
  image(neptune, 670, 670); 
  popMatrix();  
  
  pushMatrix(); 
  rotate(plutoAngle);
  image(pluto, 750, 750); 
  popMatrix();  
    
  sunAngle      += sunSpeed; 
  mercuryAngle  += mercurySpeed;  
  venusAngle    += venusSpeed; 
  earthAngle    += earthSpeed;
  marsAngle     += marsSpeed; 
  moonAngle     += moonSpeed; 
  jupyterAngle  += jupyterSpeed; 
  saturnAngle   += saturnSpeed; 
  uranusAngle   += uranusSpeed; 
  neptuneAngle  += neptuneSpeed; 
  plutoAngle    += plutoSpeed; 
  
  //videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    // videoExport.endMovie();
    exit();
  }
}
