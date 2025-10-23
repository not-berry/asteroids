class gif {
  PImage[] gifs;
  int currentPic;
  String before, after;
  int max;
  float x,y, w,h;
  
  gif(float _x, float _y, float _w, float _h, String b, int n, String a) {
    gifs = new PImage[n];
    for(int i = 0; i < n; i++) {
      gifs[i] = loadImage(b + i + a);
    }
    max = n;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  
  void show() {
    image(gifs[currentPic], x-w/2,y-h/2, w,h);
  }
  
  void act() {
    currentPic++;
    if(currentPic > max-1) {
      currentPic = 0;
    }
  }
}
