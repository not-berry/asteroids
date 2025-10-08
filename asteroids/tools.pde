void c(color s, color f, float sw) {
  stroke(s);
  if(s == noStroke) noStroke();
  fill(f);
  if(f == noFill) noFill();
  strokeWeight(sw);
}
