//Import Libraries;
import oscP5.*;
import netP5.*;
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;

LeapMotionP5 leap;


//Global Variables;
float increment = 0;
float maxIncrement = 20;
int totalModules = 4; // How many modules are we going to use?; <<-----------------------------------| NÚMERO DE MÓDULOS;
int totalPolygons = 10;
OscP5 oscP5;
NetAddress myRemoteLocation;
Module[] myModules; //Name the place to store the gamelan's modules;
Polygon[] myPolygons;
float[] moduleSync = { // Module sync with robot (px);
    100, // Mais à esquerda!
    50, //
    100, //
    0 // Mais à direita!
  };//<---------------// Delay de cada módulo! 

void setup(){
  
  //leap 
  leap = new LeapMotionP5(this);
  
  //OSC Values;
  oscP5 = new OscP5(this, 12000);  
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  
  oscP5.plug(this,"test","/test");

  
  //Declare local variables;
  int moduleWidth;
  int moduleHeight;
  int moduleHabitants;
  
  //Call PApplet functions;
  size(displayWidth,displayHeight);
  background(255);
  smooth();
  
  //Assign;
  moduleWidth = floor(width/totalModules);
  moduleHeight = height;
  moduleHabitants = totalPolygons;
  myModules = new Module[totalModules]; //Create the place to store the gamelan's modules;
  for(int i=0; i<=myModules.length-1; i++){
    myModules[i] = new Module(i,i*moduleWidth,0,moduleWidth,moduleHeight,moduleHabitants,moduleSync[i]);//Create modules;
  } 
  myPolygons = new Polygon[totalPolygons];
  for(int i=0; i<=myPolygons.length-1; i++){
    myPolygons[i] = new Polygon(i);
  }
  
  
}

void draw(){
  

  background(255);
  for(int i=0; i<=myModules.length-1; i++){
    myModules[i].displayConsole();
    myModules[i].boundingBox();
    myModules[i].manageParticles();
  } 
  
  for(int i=0; i<=myPolygons.length-1; i++){ 
    
    int checkVertex = 0;
    for (int j=0; j<=myModules.length-1; j++) {
      if (myModules[j].population.size()-1>=i) {
        checkVertex++;
      }
    }
    
    if(checkVertex!=0)myPolygons[i].display(i);
  }
  
  if (mousePressed) {
    increment++;
    if (increment>maxIncrement)increment=maxIncrement; 
    displayIncrementation(floor(increment));
  }
   fill(0);
   //draw leap finger points
   for (Finger finger : leap.getFingerList()) {
    PVector fingerPos = leap.getTip(finger);
    ellipse(fingerPos.x, fingerPos.y, 25, 25);
  }
  
}

//Set Application to full screen;
boolean sketchFullScreen() {
  return true;
}


void mouseReleased(){
  for(int i=0; i<=myModules.length-1; i++){
    myModules[i].addParticle(floor(increment));
    myModules[i].console.remove.click();
    myModules[i].console.loop.toggle();
    myModules[i].console.freeze.toggle();
  } 
  increment = 0;
}

//void test(int index, int posX, int posY, int sync, int life){
//  population.add(new Particle(index,population.size(),mouseX,mouseY,sync,life));   
//    print ("a receber");
//}


void displayIncrementation(int realIncrement) {
  pushStyle();
  stroke(0,128);
  strokeWeight(4);
  noFill();
  arc(mouseX, mouseY, 50, 50, 0, radians(increment*(360./maxIncrement)));
  popStyle();
}

public void stop() {
  leap.stop();
}


