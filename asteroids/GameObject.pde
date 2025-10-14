class GameObject {
  
  float lives, bulletCooldown, d;
  PVector loc, vel;
  
  GameObject(float lx, float ly, float vx, float vy, float life) {
    loc = new PVector(lx,ly);
    vel = new PVector(vx,vy);
    lives = life;
  }
  
  GameObject(PVector l, PVector v, float life) {
    loc = l;
    vel = v;
    lives = life;
  }
  
  void act() {
    
  }
  
  void show() {
    
  }
  
  void wrapAround(float num) {
    if(loc.y < -num) loc.y = height+num;
    if(loc.y > height+num) loc.y = -num;
    if(loc.x < -num) loc.x = width+num;
    if(loc.x > width+num) loc.x = -num;
  }
}
