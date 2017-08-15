public class effectConst { 
  char exeKey = ' ';
  boolean isExecute = false;
  effectConst() {
  }
  boolean isPressed() {
    //絶対不完全
    if (key == exeKey) {
      if (isExecute) return false;  
      else return true;
    }
    return !isExecute;
  }
}


public class Effects {
  Holizontalrandom hl;
  Varticalrandom vl;
  PGraphics layer;

  Effects() {
    effectsInit();
    this.layer=createGraphics(int(width*0.5), int(height*0.5), JAVA2D);
  }

  void effectsInit() {
    hl = new Holizontalrandom('a');
    vl = new Varticalrandom('s');
  }

  void standby() {
    if (hl.isExecute) hl.process(layer);
    if (vl.isExecute) vl.process(layer);
  }

  void keyJudg() {
    //keyPressedにレイヤー単位で突っ込むため
    hl.isExecute = hl.isPressed();
    vl.isExecute = vl.isPressed();
  }

  class Holizontalrandom extends effectConst {
    Holizontalrandom(char k) {
      exeKey = k;
    }
    void process(PGraphics g) {
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

  class Varticalrandom extends effectConst {
    Varticalrandom(char k) {
      exeKey = k;
    }
    void process(PGraphics g) {
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

  /*
  void Holizontalnoise(PGraphics g) {
   g.loadPixels();
   for (int i = 0; i < g.pixels.length; i++) {
   int s = (int)(noise(i)*5);
   g.pixels[i] = g.pixels[(i+s)%g.pixels.length];
   }
   g.updatePixels();
   }
   
   void Varticalnoise(PGraphics g) {
   g.loadPixels();
   for (int i = 0; i < g.pixels.length; i++) {
   int s = (int)(noise(i)*5);
   g.pixels[i] = g.pixels[(i+s+g.width)%g.pixels.length];
   }
   g.updatePixels();
   }*/
}