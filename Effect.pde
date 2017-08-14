interface Effect {
  void processLayer(PGraphics g);
}

class Holizontalrandom implements Effect {
  char triggerButton_ = 'a';
  
  
  //ここが再帰で死んでます。
  /*boolean isInOperation(){
    if(isInOperation() == true) return false;
    if(key != pastPressedKey) return false;
    pastPressedKey = key;
    return true;
  }*/
  
  void processLayer(PGraphics g) {
    g.loadPixels();
    for (int i = 0; i < g.pixels.length; i++) {
      int s = (int)random(100)==0 ? (int)random(10):0;
      g.pixels[i] = g.pixels[(i+s)%g.pixels.length];
      s = (int)random(100)==0 ? (int)random(10):0;
      g.pixels[i] = g.pixels[abs((i-s)%g.pixels.length)];
    }
    g.updatePixels();
  }
}

class Varticalrandom implements Effect {
  char triggerButton = 's';

  void processLayer(PGraphics g) {
    g.loadPixels();
    for (int i = 0; i < g.pixels.length; i++) {
      int s = (int)random(100)==0 ? (int)random(10):0;
      g.pixels[i] = g.pixels[(i+s*g.width)%g.pixels.length];
      s = (int)random(100)==0 ? (int)random(10):0;
      g.pixels[i] = g.pixels[abs((i+(-s)*g.width))%g.pixels.length];
    }
    g.updatePixels();
  }
}

class Holizontalnoise implements Effect {
  char triggerButton = 'd';

  void processLayer(PGraphics g) {
    g.loadPixels();
    for (int i = 0; i < g.pixels.length; i++) {
      int s = (int)(noise(i)*5);
      g.pixels[i] = g.pixels[(i+s)%g.pixels.length];
    }
    g.updatePixels();
  }
}

class Varticalnoise implements Effect {
  char triggerButton = 'f';

  void processLayer(PGraphics g) {
    g.loadPixels();
    for (int i = 0; i < g.pixels.length; i++) {
      int s = (int)(noise(i)*5);
      g.pixels[i] = g.pixels[(i+s+g.width)%g.pixels.length];
    }
    g.updatePixels();
  }
}