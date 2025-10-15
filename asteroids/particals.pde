class Particals {
  
  PVector loc, dir;
  float t;
  
  Particals(float lx, float ly, float dx, float dy, float time) {
    loc = new PVector(lx,ly);
    dir = new PVector(dx,dy);
    t = time;
  }
  
  void show() {
    
  }
  
  void act() {
    
  }
}

class ShipThrust extends Particals{
  
  color f;
  
  ShipThrust() {
    super(myShip.loc.x, myShip.loc.y, myShip.dir.x, myShip.dir.y, 5);
    if(int(random(3)) == 0) f = red;
    else if(int(random(2)) == 0) f = orange;
    else f = yellow;
  }
  
  void show() {
    noStroke();
    fill(f, map(t, 0,5, 0,255));
    pushMatrix();
    translate(loc.x - dir.x*200, loc.y - dir.y*250);
    //rotate(dir.heading());
    //triangle(-7,-10, 7,-10, 0,1);
    circle(0,0,10);
    popMatrix();
  }
  
  void act() {
    t--;
  }
}
