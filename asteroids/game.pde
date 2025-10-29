void game() {
  background(0);
  rectMode(CORNER);
  
  for(int i = 0; i < partical.size(); i++) {
    Particals currentObject = partical.get(i);
    currentObject.show();
    currentObject.act();
    if(currentObject.t <= 0) partical.remove(i);
  }
  
  for(int i = 0; i < objects.size(); i++) {
    GameObject currentObject = objects.get(i);
    currentObject.show();
    currentObject.act();
    if(currentObject.lives <= 0 && currentObject instanceof Meteor) score ++;
    if(currentObject.lives <= 0 && currentObject instanceof Enemy || currentObject.lives <= 0 && currentObject instanceof Enemy2) {
      score += 5;
      numofe--;
    }
    if(currentObject.lives <= 0) objects.remove(i);
  }
  
  if(myShip.lives == 0) {
    textAlign(CENTER, CENTER);
    dun.play();
    if(score > highscore) highscore = score;
    mode = "gameover";
  }
  
  if(shiftkey && ts > 30) {
    gs = 0.1;
    ts -= 1;
  } else {
    gs = 1;
    if(ts < 150) ts += 0.1;
  }
  
  if(numOfAst <= 4 && int(random(80)) == 0) objects.add(new Meteor());
  
  //if(numofe < 1 && (int)random(500) == 0) {
  //  if((int)random(2) == 0) objects.add(new Enemy() );
  //  else objects.add(new Enemy2() );
  //  numofe++;
  //}
  
  if(numofe < 1 && (int)random(10) == 0) {
    objects.add(new Enemy2() );
    numofe++;
  }
  
  textSize(100);
  fill(white);
  textAlign(CENTER,CENTER);
  text(round(score), width/2,40);
  
  if(myShip.lives >= 1)heart(40,40);
  if(myShip.lives >= 2)heart(90,40);
  if(myShip.lives >= 3) heart(140,40);
  
  rect(width-165,15, 150,50, 20);
  c(white,white, 5);
  rect(width-165,17.5, ts,45, 20);
  
}

void heart(float x, float y) {
  pushMatrix();
  translate(x,y);
  scale(1);
  c(white,noFill, 5);
  arc(-10,-10, 20,20, radians(150), radians(360));
  arc(10,-10, 20,20, radians(180), radians(390));
  line(-20,-7, 0,20);
  line(19,-7, 0,20);
  popMatrix();
}
