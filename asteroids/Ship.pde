class Ship extends GameObject{
  PVector dir;
  
  Ship() {
    super(width/2,height/2, 0,0, 3);
    bulletCooldown = 20;
    dir = new PVector(0,-0.1);
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    noFill();
    stroke(blue);
    triangle(-15,-18, -15,18, 25,0);
    circle(7,0, 10);
    rect(-15,-7, -6,14);
    triangle(-12,-17, 0,-14, -10,-22);
    triangle(-12,17, 0,14, -10,22);
    
    popMatrix();
  }
  
  void act() {
    loc.add(vel.x/3, vel.y/3);
    bulletCooldown--;
    if(!upkey && !downkey && vel.x != 0) vel.x *= 0.99;
    if(!upkey && !downkey && vel.y != 0) vel.y *= 0.99;
    
    if(upkey) vel.add(dir);
    if(downkey) vel.sub(dir);
    if(leftkey) dir.rotate(radians(-3));
    if(rightkey) dir.rotate(radians(3));
    
    //if(vel.x >= 1) vel.x = 1;
    //if(vel.y >= 1) vel.y = 1;
    
    
    wrapAround(50);
    
    shoot();
  }
  
  void shoot() {
    if(spacekey && bulletCooldown <=0) {
      objects.add(new Bullet() );
      bulletCooldown = 20;
    }
  }
}
