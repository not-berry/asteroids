class Ship extends GameObject{
  PVector dir;
  float v;
  float shieldTime, shieldRotate;
  
  Ship() {
    super(width/2,height/2, 0,0, 3);
    bulletCooldown = 20;
    dir = new PVector(1,0);
    v = 0;
    shieldTime = 0;
    shieldRotate = 0;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    noFill();
    stroke(white);
    
    translate(10,0);
    line(30,-7, -18,-7);
    line(30,7, -18,7);
    line(30,7, -10,20);
    line(30,-7, -10,-20);
    arc(-18,0, 14,14, radians(90),radians(270));
    arc(-18,0, 43,43, radians(70),radians(290));
    line(-42,-5, -42,5);
    
    line(10,-15, 10,-22);
    line(10,-22, -7,-20);
    
    line(10,15, 10,22);
    line(10,22, -7,20);
    
    popMatrix();
    
    pushMatrix();
    translate(loc.x,loc.y);
    shield();
    popMatrix();
  }
  
  void act() {
    loc.add(dir.x*v, dir.y*v);
    bulletCooldown--;
    shieldRotate+=5;
    shieldTime--;
    if(!upkey && !downkey) v *= 0.94;
    
    if(upkey && v < 10) v+=0.1;
    if(downkey && v > -10) v-=0.05;
    if(leftkey) dir.rotate(radians(-4));
    if(rightkey) dir.rotate(radians(4));
    
    
    if(upkey) particle.add(new ShipThrust());
    
    wrapAround(50);
    
    shoot();
  }
  
  void shoot() {
    if(spacekey && bulletCooldown <=0) {
      objects.add(new Bullet(-1.9) );
      objects.add(new Bullet(1.9) );
      pew.stop();
      pew.play();
      bulletCooldown = 30;
    }
  }
    
  void shield() {
    rotate(dir.heading());
    translate(5,0);
    rotate(-dir.heading());
    stroke(white, map(shieldTime, 0,300, 0,255));
    rotate(radians(shieldRotate));
    for(int i = 0; i < 4; i++) {
      square(-50,-50, 100);
      rotate(radians(22.5));
    }
  }
}
