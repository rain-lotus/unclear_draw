/*操作は一旦ボタン固定にして保存とかについては後で考える。
 ストロークを数式にするのは頑張って考える。*/

/*今
 エフェクトは消えた
 
 学び：pgに背景とかweightとかやるときはbegindrawしてから
 */

/*
 todo
 ノイズで何がしたいの私は？
 もっと色々いじって研究する
 目的を別物にして左手を何かにしたいんだろうなぁ多分 
 他を動かしながら描けない問題
 */

ArrayList Layers;
int chosen = 0;//選択されているレイヤー

boolean flag = false;
Holizontalrandom holi = new Holizontalrandom();

void setup() {
  size(1000, 800);
  surface.setResizable(true);

  Layers = new ArrayList();
  for (int i = 0; i < 5; i++) {
    Layers.add(new Layer());
  }
}

void draw() {
  background(200);

  fill(255);
  noStroke();
  //最終的にレイヤーの位置と合わせる
  rect(width/4, height/4, width/2, height/2);

  for (int i = 0; i < Layers.size(); i++) {
    Layer l = (Layer)Layers.get(i);
    l.disp_layer();
  }

  rightMenue();
  headerMenue();

  if (key == ' ') {
    Layer l = (Layer)Layers.get(chosen);
    processLayer(l.layer);
  }
}

void reset() {
  int size = Layers.size();
  Layers = new ArrayList();
  for (int i = 0; i < size; i++) {
    Layers.add(new Layer());
  }
}

void mouseDragged() {
  Layer l = (Layer)Layers.get(chosen);
  l.drawing();
}

char pastPressedKey = ' ';
void keyPressed() {
  if (key == 'r') reset();
}

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