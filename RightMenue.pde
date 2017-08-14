void rightMenue() {
  int menuewidth = 200;
  fill(250);
  rect(width - menuewidth, 0, menuewidth, height);

  for (int i = 0; i < Layers.size(); i++) {
    Layer l = (Layer)Layers.get(i);
    l.disp_vew(width - menuewidth + 20, 20+i*(l.sizey+20));
  }
}


public class Canvas {
  public int Width = 500, Height = height;
  void disp() {
  }
}

public class RightMenue {
  public int Width = 150, Height = height;

  void disp() {
    fill(200);
    rect(width-Width, 0, this.Width, height);
  }
}

public class LeftMenue {
  public int Width = 150, Height = height;

  void disp() {
    fill(200);
    rect(0, 0, this.Width, height);
  }
}