import java.util.ArrayList;
import processing.sound.*;

color black = 0;
color white = 255;
color noStroke = #644949;
color noFill = #5F4444;
color yellow = #E3BA35;
color orange = #E37835;
color red = #E34335;
color blue = #A0F8FF;

PFont f;

String mode = "intro";

Button[] myButtons;
boolean mouseReleased = false;
boolean wasPressed = false;

gif astgif;

SoundFile pew, dun, clack, music;

boolean held;

boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;

float numOfAst = 0;
float score = 0;
float highscore = 0;

float numofe = 0;

float ts = 150;

float bulletCooldown = 10;

ArrayList<GameObject> objects;

ArrayList<Particles> particle;

void setup() {
  size(800,800);
  imageMode(CENTER);
  textAlign(LEFT, CENTER);
  colorMode(HSB);
  strokeWeight(5);
  objects = new ArrayList();
  myShip = new Ship();
  objects.add(myShip);
  
  
  particle = new ArrayList();
  
  myButtons = new Button[2];
  myButtons[0] = new Button(white,black, white, width/2,height-200, 200,100, 10, 5, "PLAY", 75, false, "plus.jpg");
  myButtons[1] = new Button(white,black, white, width/2,height-200, 460,100, 10, 5, "CONTINUE?", 75, false, "plus.jpg");
  
  astgif = new gif(width/2+400, height/2+400, 800, 800, "frame_", 20, "_delay-0.06s.gif");
  
  pew = new SoundFile(this, "pew.mp3");
  dun = new SoundFile(this, "dun.mp3");
  clack = new SoundFile(this, "clack.mp3");
  music = new SoundFile(this, "music.mp3");
  music.play();
  
  f = createFont("font.ttf", 150);
  textFont(f);
}

void draw() {
  if(mode == "intro") intro();
  else if(mode == "game") game();
  else if(mode == "gameover") gameover();
  else if(mode == "pause") pause();
  
  click();
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

void mousePressed() {
  held = true;
  for(int i = 0; i < objects.size(); i++) {
    GameObject currentObject = objects.get(i);
    if(currentObject instanceof Meteor && dist(mouseX,mouseY, currentObject.loc.x,currentObject.loc.y) < 25*currentObject.lives || currentObject instanceof Enemy && dist(mouseX,mouseY, currentObject.loc.x,currentObject.loc.y) < 40 || currentObject instanceof Enemy2 && dist(mouseX,mouseY, currentObject.loc.x,currentObject.loc.y) < 40) {
      currentObject.held = true;
    }
  }
  
  if(mode == "game" &&  mouseButton == RIGHT) mode = "pause";
  else if(mode == "pause" &&  mouseButton == RIGHT) mode = "game";
  if(mode == "game" && mouseButton == RIGHT || mode == "pause" && mouseButton == RIGHT) {
    clack.stop();
    clack.play();
  }
}

void mouseReleased() {
  held = false;
  for(int i = 0; i < objects.size(); i++) {
    objects.get(i).held = false;
  }
}
