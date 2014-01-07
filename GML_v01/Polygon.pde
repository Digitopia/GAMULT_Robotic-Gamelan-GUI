class Polygon {

  int index;
  ArrayList addedVertexes;

  Polygon(int setIndex) {
    index = setIndex; 
    addedVertexes = new ArrayList();
  }

  void addVertex(float vX, float vY) {
    PVector newVertex = new PVector(vX, vY);
    addedVertexes.add(newVertex);
  }

  void display(int i) {
        
    pushStyle();
    beginShape();
    noFill();
    strokeWeight(1);
    stroke(0,128);
    curveVertex(0, height/2);
    curveVertex(0, height/2);
    for (int j=0; j<=myModules.length-1; j++) {
      if (myModules[j].population.size()-1>=i) {
        Particle thisParticle = (Particle)myModules[j].population.get(i);
        curveVertex(thisParticle.center.x, thisParticle.center.y);
      }
    }
  curveVertex(width, height/2);
  curveVertex(width, height/2);
  endShape();
  popStyle();
}
}
