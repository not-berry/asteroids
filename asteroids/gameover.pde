void gameover() {
  background(black);
  
  fill(red);
  textSize(130);
  text("GAME OVER", width/2,height/2);
  
  fill(white);
  textSize(50);
  text("high score: " + round(highscore), width/2,height/2+100);
  
  myButtons[1].show();
  myButtons[1].act();
  if(myButtons[1].clicked && mouseButton == LEFT) {
    dun.stop();
    clack.play();
    music.play();
    score = 0;
    ts = 150;
    gs = 1;
    numofe = 0;
    numOfAst = 0;
    for(int i = objects.size(); i > 0; i--) objects.remove(i-1);
    for(int i = partical.size(); i > 0; i--) partical.remove(i-1);
    myShip = new Ship();
    objects.add(myShip);
    mode = "intro";
  }
}
