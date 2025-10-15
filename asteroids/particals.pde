class Particals {
  
  PVector loc;
  
  Particals(float lx, float ly) {
    loc = new PVector(lx,ly);
  }
  
  void show() {
    
  }
  
  void act() {
    
  }
}

class ShipThrust extends Particals{
  
  color f;
  
  ShipThrust() {
    super(myShip.loc.x, myShip.loc.y);
    if(int(random(3)) == 0) f = red;
    else if(int(random(2)) == 0) f = orange;
    else f = yellow;
  }
  
  void show() {
    noStroke();
    fill(f);
    pushMatrix();
    translate(loc.x, loc.y);
    triangle(-7,-10, 7,-10, 0,1);
    popMatrix();
  }
  
  void act() {
    
  }
}
