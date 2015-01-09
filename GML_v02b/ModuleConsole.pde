class ModuleConsole{
  
  int module;
  float consoleWidth;
  PVector origin;
  
  Button remove;
  Button loop;
  Button freeze;
  
  Fader gravity;
  Fader loopSpeed;
  
  ModuleConsole(PVector setOrigin, float setConsoleWidth, int setModule){
    consoleWidth = setConsoleWidth;
    origin = setOrigin;
    module = setModule;
    remove = new Button(module,origin.x+10,origin.y+10,"Remove");
    loop = new Button(module,origin.x+10,origin.y+30,"Loop");
    freeze = new Button(module,origin.x+10,origin.y+50,"Freeze");
    gravity = new Fader("Gravity",origin.x+(consoleWidth/2),origin.y+10+5,100);
    loopSpeed = new Fader("Loop Speed",origin.x+(consoleWidth/2),origin.y+50+5,100);
    
  }
  
  void display(){
    pushStyle();
    noStroke();
    fill(50,128);
    rect(origin.x,origin.y,consoleWidth,90);
    displayButtons();
    dislayFaders();
    popStyle();
  }
  
  void displayButtons(){
    remove.displayClick();
    loop.displayToggle();
    freeze.displayToggle();
  }
  
  void dislayFaders(){
    gravity.display();
    loopSpeed.display();
  }
  
}
