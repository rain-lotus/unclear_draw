void rightMenue() {
  int menuewidth = 200;
  fill(250);
  rect(width - menuewidth, 100, menuewidth, height);

  for (int i = 0; i < Layers.size(); i++) {
    Layer l = (Layer)Layers.get(Layers.size() - 1 - i);
    l.disp_vew(width - menuewidth + 20, 100+20+i*(l.viewSizeY+20));
  }
}

ResetButton resetButton = new ResetButton(530, 10);
void headerMenue() {
  float menueheight = 100;

  noStroke();
  fill(240, 240, 200);
  rect(0, 0, width, menueheight);
  resetButton.disp();
}

interface button {
  void disp();
  void execution();
  boolean IsUnderCursor();
}

public class ResetButton implements button {
  int posX, posY;
  int sizeX = 80, sizeY = 80;

  public ResetButton(int X, int Y) {   
    posX = X;
    posY = Y;
  }

  void disp() {
    fill(250, 200, 200);
    rect(this.posX, this.posY, this.sizeX, this.sizeY);
    buttonPressd();
  }

  void execution() {
    //仮
    reset();
  }

  void buttonPressd() {
    if (this.IsUnderCursor() && mousePressed) {
      this.execution();
      mousePressed = false;
    }
  }

  boolean IsUnderCursor() {
    if (mouseY < posY) return false;
    if (mouseY > posY + sizeY) return false;
    if (mouseX < posX) return false;
    if (mouseX > posX + sizeX) return false;
    return true;
  }
}