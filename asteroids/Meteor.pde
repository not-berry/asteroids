class Meteor extends GameObject{
  
  Meteor() {
    super(random(width),random(height), 1,1, 3);
    if(round(random(1)) == 0) loc.x = -75;
    else loc.y = -75;
    vel.setMag(random(1,3));
    vel.rotate(random(radians(360)));
    d = lives*50;
  }
  
  Meteor(float x, float y, float l) {
    super(x,y, 1,1, l);
    vel.setMag(random(1,3));
    vel.rotate(random(radians(360)));
    d = lives*50;
  }
  
  void show() {
    c(white,black,5);
    circle(loc.x, loc.y, d);
    line(loc.x, loc.y, loc.x+d/2, loc.y);
  }
  
  void act() {
    loc.add(vel);
    
    wrapAround(75);
    
    checkForCollisions();
  }
  
  void checkForCollisions() {
    for(int i = 0; i < objects.size();i++) {
      GameObject obj = objects.get(i);
      if(obj instanceof Bullet) {
        if(dist(loc.x,loc.y, obj.loc.x,obj.loc.y) < d/2 + obj.d/2) {
          if(lives > 1) {
            objects.add(new Meteor(loc.x, loc.y, lives-1));
            objects.add(new Meteor(loc.x, loc.y, lives-1));
          }
          lives = obj.lives = 0;
        }
      }
    }
  }
}
