class Enemy2 extends GameObject{
  
  Enemy2() {
    super(random(width),random(height), 1,1, 1);
    if(round(random(1)) == 0) loc.x = -100 + random(-10,10);
    else loc.y = -100 + random(-10,10);
    
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(vel.heading());
    noFill();
    
    //ship
    stroke(red);
    strokeWeight(5);
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
  }
  
  void act() {
    wrapAround(100);
    
    vel.setMag(3);
    if(atan2(myShip.loc.y-loc.y,myShip.loc.x-loc.x) - vel.heading() > 0) vel.rotate(radians(2));
    else vel.rotate(radians(-2));
    loc.add(vel);

    for(int i = 0; i < objects.size();i++) {
      GameObject obj = objects.get(i);
      if(obj instanceof Bullet) {
        if(dist(loc.x,loc.y, obj.loc.x,obj.loc.y) < 40 + obj.d/2) {
          lives = 0;
          for(int d = 0; d < 20; d++) particle.add(new Dust(loc.x,loc.y, 50, 2, red));
        }
      }
    }
    if(dist(loc.x,loc.y, myShip.loc.x,myShip.loc.y) < 60 && myShip.shieldTime <= 0) {
      lives = 0;
      myShip.lives--;
      myShip.shieldTime = 300;
      for(int d = 0; d < 20; d++) particle.add(new Dust(loc.x,loc.y, 50, 2, red));
    }
  }
}
