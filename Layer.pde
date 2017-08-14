class Layer {
  ArrayList blocks;
  public int number = -1;
  public int layerPosX = 20, layerPosY = 20; 
  public float sizex = 0, sizey = 0; //サムネのサイズ
  public float posx = 0, posy = 0;
  public PGraphics layer;
  public boolean clicked = false;
  color c;

  Layer() {
  }

  Layer(int n) {
    sizex = 160;
    sizey = height*(160.0/width);
    number = n;//インデックスつけ？？
    this.layer=createGraphics(width, height, JAVA2D);
    c = color((int)random(255), (int)random(255), (int)random(255));
  }

  void disp_layer() {
    image(this.layer, layerPosX, layerPosY);
  }

  void setlayerPos(int x, int y) {
    layerPosX = x;
    layerPosY = y;
  }

  void disp_vew(float x, float y) {
    posx = x;
    posy = y;
    //サムネイル表示
    noFill();
    if (chosen == this.number) stroke(c);
    else stroke(200);
    rect(posx, posy, sizex, sizey);
    image(this.layer, posx, posy, sizex, sizey);
    this.mouse();
  }

  void drawing() {
    this.layer.noStroke();
    this.layer.beginDraw();
    this.layer.stroke(c);
    this.layer.strokeWeight(10);
    this.layer.line(pmouseX-layerPosX, pmouseY-layerPosY, mouseX-layerPosX, mouseY-layerPosY);
    //this.layer.ellipse(mouseX-layerPosX, mouseY-layerPosY, 10, 10);
    this.layer.endDraw();
  }

  boolean isMouseOn() {
    //マウス判定
    if (mouseY < posy) return false;
    if (mouseY > posy + sizey) return false;
    if (mouseX < posx) return false;
    if (mouseX > posx + sizex) return false;
    return true;
  }

  private void mouse() {
    if (isMouseOn() && mousePressed) {
      chosen = number;
      this.clicked = true;
      flag = false;
      mousePressed = false;
    }
  }
}