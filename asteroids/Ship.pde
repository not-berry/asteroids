class Ship extends GameObject{
  PVector dir;
  float px,py;
  float v;
  float shieldTime, shieldRotate;
  
  Ship() {
    super(width/2,height/2, 0,0, 3);
    bulletCooldown = 20;
    dir = new PVector(0,-0.1);
    px = width/2;
    py = width/2;
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
    //triangle(-15,-18, -15,18, 25,0);
    //circle(7,0, 10);
    //rect(-15,-7, -3,14);
    //triangle(-12,-17, 0,-14, -10,-22);
    //triangle(-12,17, 0,14, -10,22);
    
    rect(-25,-25, 50,50, 20);
    rect(-10,-25, 20,-7, 20,20,0,0);
    rect(-10,25, 20,7, 0,0,20,20);
    
    rotate(-dir.heading());
    shield();
    popMatrix();
  }
  
  void act() {
    loc.add(dir.x*v, dir.y*v);
    bulletCooldown--;
    shieldRotate+=5;
    shieldTime--;
    //if(!upkey && !downkey && vel.x != 0) vel.x *= 0.99;
    //if(!upkey && !downkey && vel.y != 0) vel.y *= 0.99;
    if(!upkey && !downkey) v *= 0.98;
    
    //if(upkey && dist(px,py, loc.x,loc.y) < 3 || upkey && vel.x/abs(vel.x) != dir.x/abs(dir.x)) vel.x += dir.x;
    //if(downkey && dist(px,py, loc.x,loc.y) < 3 || downkey && vel.x/abs(vel.x) != dir.x/abs(dir.x)) vel.x -= dir.x;
    //if(upkey && dist(px,py, loc.x,loc.y) < 3 || upkey && vel.y/abs(vel.y) != dir.y/abs(dir.y)) vel.y += dir.y;
    //if(downkey && dist(px,py, loc.x,loc.y) < 3 || downkey && vel.y/abs(vel.y) != dir.y/abs(dir.y)) vel.y -= dir.y;
    //if(upkey) vel.add(dir);
    //if(downkey) vel.sub(dir);
    if(upkey && v < 60) v+=1;
    if(downkey && v > -60) v-=1;
    if(leftkey) dir.rotate(radians(-4));
    if(rightkey) dir.rotate(radians(4));
    
    //px = loc.x; py = loc.y;
    
    //if(upkey && abs(bulletCooldown) % 2 == 0) partical.add(new ShipThrust());
    if(upkey) partical.add(new ShipThrust());
    
    wrapAround(50);
    
    shoot();
    
    
  }
  
  void shoot() {
    if(spacekey && bulletCooldown <=0) {
      objects.add(new Bullet() );
      bulletCooldown = 60;
    }
  }
    
  void shield() {
    stroke(white, map(shieldTime, 0,300, 0,255));
    rotate(radians(shieldRotate));
    for(int i = 0; i < 4; i++) {
      square(-50,-50, 100);
      rotate(radians(22.5));
    }
  }
}
