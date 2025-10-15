void game() {
  background(0);
  
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
    if(currentObject.lives <= 0) objects.remove(i);
  }
  
    
  
  if(numOfAst <= 3 && int(random(200)) == 0) objects.add(new Meteor());
  
  textSize(100);
  fill(white);
  text(round(score), 5,40);
  
  //myShip.show();
  myShip.act();
}
