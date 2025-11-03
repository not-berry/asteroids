class Particles {
  
  PVector loc, dir;
  float t;
  
  Particles(float lx, float ly, float dx, float dy, float time) {
    loc = new PVector(lx,ly);
    dir = new PVector(dx,dy);
    t = time;
  }
  
  void show() {
    
  }
  
  void act() {
    
  }
}

class ShipThrust extends Particles{
  
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
    translate(loc.x - dir.x*38, loc.y - dir.y*38);
    
    rotate(dir.heading());
    translate(0,random(-5,5));
    circle(0,0,10);
    popMatrix();
  }
  
  void act() {
    t--;
  }
}

class Dust extends Particles {
  
  color col;
  float tmax, dist;
  
  Dust(float x, float y, float time, float _dist, color _col) {
    super(x, y, random(-1,1), random(-1,1), time);
    dir.rotate(random(radians(360)));
    col = _col;
    dist = _dist;
    tmax = time;
  }
  
  void show() {
    noStroke();
    fill(col, map(t, 0,tmax, 0,255));
    pushMatrix();
    translate(loc.x, loc.y);
    circle(0,0,10);
    popMatrix();
  }
  
  void act() {
    loc.add(dir.x*dist, dir.y*dist);
    t--;
  }
}
