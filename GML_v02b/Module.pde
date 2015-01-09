class Module {

  int index;
  int maximumPopulation;
  float sync;
  float modWidth;
  float modHeight;
  float maxWidth;
  float maxHeight;
  PVector modOrigin;
  ArrayList population;
  ModuleConsole console;


  Module(int setIndex, float setOriginX, float setOriginY, float setWidth, float setHeight, int setPopulation, float setSync) {
    index = setIndex;
    maximumPopulation = setPopulation;
    sync = setSync;
    modWidth = setWidth;
    modHeight = setHeight; 
    modOrigin = new PVector(setOriginX, setOriginY);
    population = new ArrayList();
    maxWidth = modOrigin.x + modWidth;
    maxHeight = modOrigin.y + modHeight;
    console = new ModuleConsole(modOrigin, modWidth, index);
  }

  void update() {
    
  }

  void addParticle(int life) {
    if (population.size() < maximumPopulation) {
      if (mouseX >= modOrigin.x && mouseX <=maxWidth && mouseY >= modOrigin.y+100 && mouseY <=maxHeight/2)population.add(new Particle(index,population.size(),mouseX,mouseY,sync,life));
    }
  }

  void manageParticles() {
    for(int i=0; i<=population.size()-1; i++){
      Particle thisParticle = (Particle)population.get(i);
      if(console.freeze.state == true){
      if(console.loop.state == true){
        if(thisParticle.counter >= thisParticle.life)population.remove(i);
        thisParticle.gravity();
      }
      else{
        thisParticle.noGravity();
      }
      }
      thisParticle.display();
    }
  }

  void displayConsole() {
    console.display();
  }

  void boundingBox() {
    pushStyle();
    strokeWeight(1);
    stroke(50,128);
    noFill();
    rect(modOrigin.x, modOrigin.y, modWidth, modHeight);
    popStyle();
  }
  
  void eraseParticle() {
        for(int i=0; i<=population.size()-1; i++){
           Particle thisParticle = (Particle)population.get(i);  
         population.clear();
           
     
          }

    {
  }
  }
  }




