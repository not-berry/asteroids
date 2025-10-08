class Bullet extends GameObject{
  
  int time;
  
  Bullet() {
    super(myShip.loc.copy(), myShip.dir.copy(), 1);
    time = 50;
    //loc = new PVector(myShip.loc.x, myShip.loc.y);
    //vel = myShip.dir.copy();
    vel.setMag(10);
    
    loc.add(vel.x*3.5, vel.y*3);
  }
  
  void show() {
    c(white, noFill, 5);
    circle(loc.x, loc.y, 5);
  }
  
  void act() {
    loc.add(vel);
    
    time--;
    if(time == 0) lives = 0;
    
    if(loc.y < -50) loc.y = height+50;
    if(loc.y > height+50) loc.y = -50;
    if(loc.x < -50) loc.x = width+50;
    if(loc.x > width+50) loc.x = -50;
  }
  
}
