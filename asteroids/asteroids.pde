import java.util.ArrayList;

color black = 0;
color white = 255;
color noStroke = #644949;
color noFill = #5F4444;
color blue = #23A8CB;

String mode = "game";


boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;


float bulletCooldown = 10;

ArrayList<GameObject> objects;

void setup() {
  size(800,800);
  imageMode(CENTER);
  strokeWeight(5);
  objects = new ArrayList();
  myShip = new Ship();
  objects.add(myShip);
  objects.add(new Meteor());
  objects.add(new Meteor());
  objects.add(new Meteor());
}

void draw() {
  if(mode == "intro") intro();
  else if(mode == "game") game();
  else if(mode == "gameover") gameover();
  else if(mode == "pause") pause();
}

void keyPressed() {
  if(keyCode == UP || keyCode == 'w' || keyCode == 'W') upkey = true;
  if(keyCode == DOWN || keyCode == 's' || keyCode == 'S') downkey = true;
  if(keyCode == LEFT || keyCode == 'a' || keyCode == 'A') leftkey = true;
  if(keyCode == RIGHT || keyCode == 'd' || keyCode == 'D') rightkey = true;
  if(keyCode == ' ') spacekey = true;
}

void keyReleased() {
  if(keyCode == UP || keyCode == 'w' || keyCode == 'W') upkey = false;
  if(keyCode == DOWN || keyCode == 's' || keyCode == 'S') downkey = false;
  if(keyCode == LEFT || keyCode == 'a' || keyCode == 'A') leftkey = false;
  if(keyCode == RIGHT || keyCode == 'd' || keyCode == 'D') rightkey = false;
  if(keyCode == ' ') spacekey = false;
}
