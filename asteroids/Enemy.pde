class Enemy extends GameObject{
  
  float timer;
  boolean switched;
  
  Enemy() {
    super(random(width),random(height), 1,1, 1);
    if(round(random(1)) == 0) loc.x = -100 + random(-10,10);
    else loc.y = -100 + random(-10,10);
    
    timer = 400;
    switched = false;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(atan2(myShip.loc.y-loc.y,myShip.loc.x-loc.x));
    noFill();
    
    //pointer
    strokeWeight(2);
    stroke(white, map(timer, 400,0, 0,255));
    if(timer < 0 && switched) stroke(red);
    if(timer >= -100 && vel.x == 0 && vel.y == 0)line(-25,0, 2000,0);
    
    //laser
    c(blue, noFill, 11, 200);
    if(timer < -100) line(-20,0, 2000,0);
    
    
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
    
    
    vel.x = 5;vel.y = 0;
    if(loc.x > 50 && loc.x < width-50 && loc.y > 50 && loc.y < height-50) vel.setMag(0);
    vel.rotate(atan2(myShip.loc.y-loc.y,myShip.loc.x-loc.x));
    loc.add(vel);
    
    
    
    if(vel.x == 0 && vel.y == 0) timer--;
    if(timer % 10 == 0 && switched) switched = false;
    else if(timer % 10 == 0 && !switched) switched = true;
    
    for(int i = 0; i < objects.size();i++) {
      GameObject obj = objects.get(i);
      if(obj instanceof Bullet) {
        if(dist(loc.x,loc.y, obj.loc.x,obj.loc.y) < 40 + obj.d/2) {
          lives = 0;
          for(int d = 0; d < 20; d++) partical.add(new Dust(loc.x,loc.y, 50, 2, red));
        }
      }
    }
    if(dist(loc.x,loc.y, myShip.loc.x,myShip.loc.y) < 60 && myShip.shieldTime <= 0) {
      lives = 0;
      myShip.lives--;
      myShip.shieldTime = 300;
      for(int d = 0; d < 20; d++) partical.add(new Dust(loc.x,loc.y, 50, 2, red));
    }
    
    if(myShip.shieldTime <= 0 && timer < -100) {
      myShip.lives--;
      myShip.shieldTime = 300;
    }
  }
}
