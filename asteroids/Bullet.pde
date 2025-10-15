class Bullet extends GameObject{
  
  int time;
  
  Bullet() {
    super(myShip.loc.copy(), myShip.dir.copy(), 1);
    time = 40;
    //loc = new PVector(myShip.loc.x, myShip.loc.y);
    //vel = myShip.dir.copy();
    vel.setMag(10);
    
    loc.add(vel.x*3.5, vel.y*3.5);
    
    d = 5;
  }
  
  void show() {
    c(white, noFill, 5);
    circle(loc.x, loc.y, d);
  }
  
  void act() {
    loc.add(vel);
    
    time--;
    if(time == 0) lives = 0;
    
    wrapAround(50);
  }
  
}
