class Fader {
  float zeroX, zeroY, leng;
  float low = 0.;
  float high = 1.;
  int fadeRadius = 10;
  float fadePos;
  float faderVal=0.1;
  String myTitle;
  boolean usage = false;

  Fader(String title, float initX, float initY, int extend) {
    zeroX = initX;
    zeroY = initY;
    leng = extend;
    fadePos = initX;
    myTitle = title;
  } 

  float getValue() {
        usage = false;
    if (dist(mouseX, mouseY, fadePos, zeroY)<fadeRadius*3) {
      if (mousePressed) {
        usage = true;
        faderVal = map(mouseX, zeroX, zeroX+leng, low, high) ;
        if (faderVal<low) faderVal=low;
        if (faderVal>high) faderVal =high;
      }
    }
    return(faderVal);
  }

  void display() {
    stroke(255);
    line(zeroX, zeroY, zeroX+leng, zeroY);
    fadePos = map(getValue(), low, high, zeroX, zeroX+leng);
    noStroke();
    fill(255);
    rect(fadePos-5,zeroY-5,10,10);
    textAlign(LEFT,TOP);
    textSize(10);
    text(myTitle, zeroX, zeroY+10);
  }
}
