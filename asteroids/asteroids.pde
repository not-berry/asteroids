import java.util.ArrayList;
import processing.sound.*;

color black = 0;
color white = 255;
color noStroke = #644949;
color noFill = #5F4444;
color blue = #3576E3;
color yellow = #E3BA35;
color orange = #E37835;
color red = #E34335;

PFont f;

String mode = "intro";

Button[] myButtons;
boolean mouseReleased = false;
boolean wasPressed = false;

gif astgif;

SoundFile pew, dun, clack, music;


boolean upkey, downkey, leftkey, rightkey, spacekey, shiftkey;
Ship myShip;

float numOfAst = 0;
float score = 0;

float gs = 1;

float ts = 150;

float bulletCooldown = 10;

ArrayList<GameObject> objects;

ArrayList<Particals> partical;

void setup() {
  size(800,800);
  imageMode(CENTER);
  textAlign(LEFT, CENTER);
  colorMode(HSB);
  strokeWeight(5);
  objects = new ArrayList();
  myShip = new Ship();
  objects.add(myShip);
  
  partical = new ArrayList();
  
  myButtons = new Button[1];
  myButtons[0] = new Button(white,black, white, width/2,height-200, 200,100, 10, 5, "PLAY", 75, false, "plus.jpg");
  
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
  if(keyCode == SHIFT) shiftkey = true;
}

void keyReleased() {
  if(keyCode == UP || keyCode == 'w' || keyCode == 'W') upkey = false;
  if(keyCode == DOWN || keyCode == 's' || keyCode == 'S') downkey = false;
  if(keyCode == LEFT || keyCode == 'a' || keyCode == 'A') leftkey = false;
  if(keyCode == RIGHT || keyCode == 'd' || keyCode == 'D') rightkey = false;
  if(keyCode == ' ') spacekey = false;
  if(keyCode == SHIFT) shiftkey = false;
}

void mousePressed() {
  if(mode == "game") mode = "pause";
  else if(mode == "pause") mode = "game";
  if(mode == "game" || mode == "pause") {
    clack.stop();
    clack.play();
  }
}
