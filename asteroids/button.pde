class Button {
  float x,y, w,h, r, sw, ts;
  color s,f,hf;
  String str;
  boolean clicked, isImg;
  PImage img;
  
  Button(color _s, color _f, color _hf, float _x,float _y, float _w,float _h, float _r, float _sw, String _str, float _ts, boolean _isImg, String _img) {
    s = _s;
    f = _f;
    hf = _hf;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r = _r;
    sw = _sw;
    str = _str;
    ts = _ts;
    if(_isImg) img = loadImage(_img);
    isImg = _isImg;
    clicked = false;
  }
  
  void show() {
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    stroke(s);
    fill(f);
    if(mouseX < x+w/2 && mouseX > x-w/2 && mouseY < y+h/2 && mouseY > y-h/2) fill(hf);
    strokeWeight(sw);
    rect(x,y, w,h, r);
    fill(hf);
    if(mouseX < x+w/2 && mouseX > x-w/2 && mouseY < y+h/2 && mouseY > y-h/2) fill(f);
    textSize(ts);
    text(str, x,y);
    
    if(isImg) image(img, x-w/2,y-h/2, w,h);
  }
  
  void act() {
    if(mouseReleased && mouseX < x+w/2 && mouseX > x-w/2 && mouseY < y+h/2 && mouseY > y-h/2) {
      clicked = true;
    }else {
      clicked = false;
    }
  }
}
