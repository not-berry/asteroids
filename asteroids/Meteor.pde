class Meteor extends GameObject{
  
  PShape s;
  float rotation;
  boolean add;
  Meteor() {
    super(random(width),random(height), 1,1, 3);
    if(round(random(1)) == 0) loc.x = -100;
    else loc.y = -100;
    vel.setMag(random(1,3));
    vel.rotate(random(radians(360)));
    d = lives*50;
    numOfAst += 1;
    leftorright();
    shaped();
  }
  
  Meteor(float x, float y, float l) {
    super(x,y, 1,1, l);
    vel.setMag(random(1,3));
    vel.rotate(random(radians(360)));
    d = lives*50;
    leftorright();
    shaped();
  }
  
  void show() {
    c(white,black,5);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(radians(rotation));
    //circle(0, 0, d);
    //line(0, 0, d/2, 0);
    shape(s, 0,0);
    popMatrix();
    
  }
  
  void act() {
    loc.add(vel);
    
    wrapAround(100);
    
    checkForCollisions();
    
    if(add) rotation += abs(vel.x)+abs(vel.y);
    else rotation -= abs(vel.x)+abs(vel.y);
  }
  
  void checkForCollisions() {
    for(int i = 0; i < objects.size();i++) {
      GameObject obj = objects.get(i);
      if(obj instanceof Bullet) {
        if(dist(loc.x,loc.y, obj.loc.x,obj.loc.y) < d/2 + obj.d/2) {
          score++;
          if(lives > 1) {
            objects.add(new Meteor(loc.x, loc.y, lives-1));
            objects.add(new Meteor(loc.x, loc.y, lives-1));
          } else numOfAst -= 0.25;
          lives = obj.lives = 0;
        }
      }
    }
    if(dist(loc.x,loc.y, myShip.loc.x,myShip.loc.y) < d/2+20 && myShip.shieldTime <= 0) {
      myShip.lives -= 1;
      if(lives > 1) {
        objects.add(new Meteor(loc.x, loc.y, lives-1));
        objects.add(new Meteor(loc.x, loc.y, lives-1));
      } else numOfAst -= 0.25;
      lives = 0;
      myShip.shieldTime = 300;
    }
  }
  
  void leftorright() {
    add = true;
    if(round(random(1)) == 0) add = false;
  }
  void shaped() {
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(white);
    float r = 10;
    float rx = random(-r,r); float ry = random(-r,r);
    s.vertex((-17+ry)*lives, (17+ry)*lives);
    s.vertex(0,(25+random(-r,r))*lives);
    s.vertex((17+random(-r,r))*lives, (17+random(-r,r))*lives);
    s.vertex((25+random(-r,r))*lives,0);
    s.vertex((17+random(-r,r))*lives, (-17+random(-r,r))*lives);
    s.vertex(0,(-25+random(-r,r))*lives);
    s.vertex((-17+random(-r,r))*lives, (-17+random(-r,r))*lives);
    s.vertex((-25+random(-r,r))*lives,0);
    s.vertex((-17+ry)*lives, (17+ry)*lives);
    s.endShape();
  }
}
