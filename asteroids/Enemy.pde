class Enemy extends GameObject{
  
  Enemy() {
    super(random(width),random(height), 1,1, 1);
    if(round(random(1)) == 0) loc.x = -100;
    else loc.y = -100;
    vel.setMag(random(2,5));
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
  }
  
  void act() {
    
  }
}
