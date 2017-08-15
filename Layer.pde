public static class LayerConst {
  static int number = -1;
  public LayerConst() {
    LayerConst.number++;
  }
  
}

class Layer {
  ArrayList blocks;
  int number = 0;
  int layerPosX = width/4, layerPosY = height/4; 
  float viewSizeX = 0, viewSizeY = 0; //サムネのサイズ
  float viewPosX = 0, viewPosY = 0;
  PGraphics layer;
  boolean clicked = false;
  color c;
  LayerConst lc = new LayerConst();
  
  Layer() {
    viewSizeX = 160;
    viewSizeY = height*(160.0/width);
    number = LayerConst.number;
    this.layer=createGraphics(int(width*0.5), int(height*0.5), JAVA2D);
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
    viewPosX = x;
    viewPosY = y;
    //サムネイル表示
    noFill();
    if (chosen == this.number) strokeWeight(5);
    else strokeWeight(1);
    stroke(c);
    rect(viewPosX, viewPosY, viewSizeX, viewSizeY);
    image(this.layer, viewPosX, viewPosY, viewSizeX, viewSizeY);
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
    if (mouseY < viewPosY) return false;
    if (mouseY > viewPosY + viewSizeY) return false;
    if (mouseX < viewPosX) return false;
    if (mouseX > viewPosX + viewSizeX) return false;
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