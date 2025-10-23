void intro() {
  background(black);
  
  astgif.show();
  astgif.act();
  
  textSize(120);
  fill(white);
  text("ASTEROIDS", width/2,height/2 - 100);
  
  myButtons[0].show();
  myButtons[0].act();
  if(myButtons[0].clicked) {
    music.stop();
    clack.play();
    mode = "game";
  }
}
