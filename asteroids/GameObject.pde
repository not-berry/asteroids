class GameObject {
  
  float lives, bulletCooldown;
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
}
