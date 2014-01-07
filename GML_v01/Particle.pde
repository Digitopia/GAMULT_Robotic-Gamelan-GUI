class Particle {

  boolean sendReport;
  int myModule;
  int index;
  float sync;
  float floor;
  float speed; 
  float gravity;
  float loopGravity;
  float diameter;
  PVector center;
  float initialPos;
  int counter = 0;
  int life; 

  Particle(int setModule, int setIndex, float setX, float setY, float setSync, int setLife) {
    sendReport = true;
    myModule = setModule;
    index = setIndex;
    sync = setSync;
    floor = height;//myModules[myModule].maxHeight;
    speed = 0;
    gravity = myModules[myModule].console.gravity.getValue()*0.1+0.1;
    loopGravity = myModules[myModule].console.loopSpeed.getValue()*5;
    diameter = 5;
    center = new PVector(setX, setY);
    initialPos = center.y;
    life = setLife;
  }
  

  void noGravity() {
    center.y+=loopGravity;    
    if (center.y > floor)loopGravity = (myModules[myModule].console.loopSpeed.getValue()*5)*-1;
    if(center.y < initialPos) loopGravity = (myModules[myModule].console.loopSpeed.getValue()*5);
    if (center.y > floor-sync && sendReport == true) {
      report(center.x);
      sendReport = false;
    }
    if (center.y < floor-sync)sendReport = true;
  }

  void gravity() {
    gravity = myModules[myModule].console.gravity.getValue()*0.1+0.1;
    speed+=gravity;
    center.y+=speed;
    if (center.y > floor-sync && sendReport == true) {
      report(center.x);
      sendReport = false;
    }
    if (center.y < floor-sync)sendReport = true;
    if (center.y > floor) {
      speed = speed * -0.95;
      sync = sync * 0.95;
      counter++;
      center.y=floor;
    }
  }

  void display() {
    //displaySync();
    displayLifeCircle();
    displayParticleProgress();
  }

  void displayParticle() {
    pushStyle();
    noStroke();
    fill(0);
    ellipse(center.x, center.y, diameter, diameter);
    popStyle();
  }
  
  void displayParticleProgress(){
    pushStyle();
    noStroke();
    fill(0);
    ellipse(center.x, center.y, life, life);
    popStyle();
  }
  
  void displayLifeDiameter(){
    /*pushStyle();
    stroke(255, 128);
    strokeWeight(2);
    noFill();
    arc(center.x, center.y, 20, 20, 0, radians(360.-(counter*(360./life))));
    popStyle();*/
  }
  
  void displayLifeCircle() {
    pushStyle();
    stroke(0, 128);
    strokeWeight(2);
    noFill();
    arc(center.x, center.y, life*2, life*2, 0, radians(360.-(counter*(360./life))));
    popStyle();
  }

  void displaySync() {
    pushStyle();
    noFill();
    strokeWeight(1);
    stroke(128);
    line(myModules[myModule].modOrigin.x, floor-sync, myModules[myModule].maxWidth, floor-sync);
    popStyle();
  }

  void report(float collision) {
    OscMessage myOscMessage = new OscMessage("/GML");
    String messageFormat = myModule+" "+int(collision)+" "+int(myModules[myModule].modOrigin.x)+" "+int(myModules[myModule].maxWidth)+" "+int(life);
    myOscMessage.add(messageFormat);
    oscP5.send(myOscMessage, myRemoteLocation);
    
  }
}

