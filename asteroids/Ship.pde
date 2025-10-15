class Ship extends GameObject{
  PVector dir;
  float px,py;
  float v;
  
  Ship() {
    super(width/2,height/2, 0,0, 3);
    bulletCooldown = 20;
    dir = new PVector(0,-0.1);
    px = width/2;
    py = width/2;
    v = 0;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    noFill();
    stroke(white);
    triangle(-15,-18, -15,18, 25,0);
    circle(7,0, 10);
    rect(-15,-7, -3,14);
    triangle(-12,-17, 0,-14, -10,-22);
    triangle(-12,17, 0,14, -10,22);
    
    popMatrix();
  }
  
  void act() {
    loc.add(dir.x*v, dir.y*v);
    bulletCooldown--;
    //if(!upkey && !downkey && vel.x != 0) vel.x *= 0.99;
    //if(!upkey && !downkey && vel.y != 0) vel.y *= 0.99;
    if(!upkey && !downkey) v *= 0.99;
    
    //if(upkey && dist(px,py, loc.x,loc.y) < 3 || upkey && vel.x/abs(vel.x) != dir.x/abs(dir.x)) vel.x += dir.x;
    //if(downkey && dist(px,py, loc.x,loc.y) < 3 || downkey && vel.x/abs(vel.x) != dir.x/abs(dir.x)) vel.x -= dir.x;
    //if(upkey && dist(px,py, loc.x,loc.y) < 3 || upkey && vel.y/abs(vel.y) != dir.y/abs(dir.y)) vel.y += dir.y;
    //if(downkey && dist(px,py, loc.x,loc.y) < 3 || downkey && vel.y/abs(vel.y) != dir.y/abs(dir.y)) vel.y -= dir.y;
    //if(upkey) vel.add(dir);
    //if(downkey) vel.sub(dir);
    if(upkey && v < 30) v+=0.2;
    if(downkey && v > -30) v-=0.2;
    if(leftkey) dir.rotate(radians(-2));
    if(rightkey) dir.rotate(radians(2));
    
    //px = loc.x; py = loc.y;
    
    if(upkey && abs(bulletCooldown) % 5 == 0) partical.add(new ShipThrust());
    
    wrapAround(50);
    
    shoot();
  }
  
  void shoot() {
    if(spacekey && bulletCooldown <=0) {
      objects.add(new Bullet() );
      bulletCooldown = 60;
    }
  }
}
