void c(color s, color f, float sw) {
  stroke(s);
  if(s == noStroke) noStroke();
  fill(f);
  if(f == noFill) noFill();
  strokeWeight(sw);
}



void click() {
  mouseReleased = false;
  if(mousePressed) wasPressed = true;
  if(wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
