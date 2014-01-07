class Button{
  
  int module;
  float x;
  float y;
  boolean inUse = false;
  private boolean state = true;
  String tag;
  
  
  Button(int setModule,float setX, float setY, String setTag){
    module = setModule;
    x = setX;
    y = setY;
    tag = setTag;
  }
    
  void toggle(){
    if(mouseX >= x && mouseX <=x+10 && mouseY >= y && mouseY <=y+10)state = !state;
  }
  
  void click(){
    if(myModules[module].population.size() > 0){
    if(mouseX >= x && mouseX <=x+10 && mouseY >= y && mouseY <=y+10)myModules[module].population.remove(myModules[module].population.size()-1);
    }
  }
  
  
  void displayToggle(){
    pushStyle();
    strokeWeight(1);
    stroke(255);
    noFill();
    if(state == false) fill(255);
    rect(x,y,10,10);
    fill(255);
    textSize(10);
    textAlign(LEFT,TOP);
    text(tag,x+20,y);
    popStyle();
  }
   
  void displayClick(){
     pushStyle();
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x,y,10,10);
    line(x,y,x+10,y+10);
    line(x+10,y,x,y+10);
    fill(255);
    textSize(10);
    textAlign(LEFT,TOP);
    text(tag,x+20,y);
    popStyle();
   }
  
}
