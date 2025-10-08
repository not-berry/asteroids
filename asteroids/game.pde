void game() {
  background(0);
  
  for(int i = 0; i < objects.size(); i++) {
    GameObject currentObject = objects.get(i);
    currentObject.show();
    currentObject.act();
    if(currentObject.lives <= 0) objects.remove(i);
  }
  
  myShip.show();
  myShip.act();
}
