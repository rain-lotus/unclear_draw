public interface Effect {
  public void process(PGraphics g);
  public void standby();
  public void keyJudg();
}

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
    return false;
  }
  void keyJudg() {
    this.isExecute = this.isPressed();
  }
}


public class Effects {
  ArrayList<Effect> effects;
  Holizontalrandom hl;
  Varticalrandom vl;
  Holizontalnoise hn;
  Varticalnoise vn;

  PGraphics layer;

  Effects() {
    effects = new ArrayList<Effect>();
    effectsInit();
    this.layer=createGraphics(int(width*0.5), int(height*0.5), JAVA2D);
  }

  void effectsInit() {
    hl = new Holizontalrandom('a');
    effects.add(hl);
    vl = new Varticalrandom('s');
    effects.add(vl);
    hn = new Holizontalnoise('d');
    effects.add(hn);
    vn = new Varticalnoise('f');
    effects.add(vn);
  }

  void standby() {
    for (int i = 0; i < effects.size(); i++) {
      Effect effect = effects.get(i);
      effect.standby();
    }
  }

  void keyJudg() {
    for (int i = 0; i < effects.size(); i++) {
      Effect effect = effects.get(i);
      effect.keyJudg();
    }
  }

  class Holizontalrandom extends effectConst implements Effect {
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
    void standby() {
      if (this.isExecute) this.process(layer);
    }
  }

  class Varticalrandom extends effectConst implements Effect {
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
    void standby() {
      if (this.isExecute) this.process(layer);
    }
  }

  class Holizontalnoise extends effectConst implements Effect {
    Holizontalnoise(char k) {
      exeKey = k;
    }
    void process(PGraphics g) {
      g.loadPixels();
      for (int i = 0; i < g.pixels.length; i++) {
        int s = (int)(noise(i)*5);
        g.pixels[i] = g.pixels[(i+s)%g.pixels.length];
      }
      g.updatePixels();
    }
    void standby() {
      if (this.isExecute) this.process(layer);
    }
  }

  class Varticalnoise extends effectConst implements Effect {
    Varticalnoise(char k) {
      exeKey = k;
    }
    void process(PGraphics g) {
      g.loadPixels();
      for (int i = 0; i < g.pixels.length; i++) {
        int s = (int)(noise(i)*5);
        g.pixels[i] = g.pixels[(i+s+g.width)%g.pixels.length];
      }
      g.updatePixels();
    }
    void standby() {
      if (this.isExecute) this.process(layer);
    }
  }
}