class Bullet extends GameObject{
  
  int time;
  
  Bullet(float x) {
    super(myShip.loc.copy(), myShip.dir.copy(), 1);
    time = 20;
    vel.setMag(10);
    
    loc.add(vel.x*2.7, vel.y*2.7);
    loc.x += vel.y*x;
    loc.y -= vel.x*x;
    
    d = 5;
  }
  
  void show() {
    c(white, noFill, 5);
    circle(loc.x, loc.y, d);
  }
  
  void act() {
    loc.add(vel.x*2, vel.y*2);
    
    time--;
    if(time == 0) lives = 0;
    
    wrapAround(50);
  }
  
}
