void rightMenue() {
  int menuewidth = 200;
  fill(250);
  rect(width - menuewidth, 0, menuewidth, height);

  for (int i = 0; i < Layers.size(); i++) {
    Layer l = (Layer)Layers.get(i);
    l.disp_vew(width - menuewidth + 20, 20+i*(l.sizey+20));
  }
}

void headerMenue() {
  float menueheight = 100;

  noStroke();
  fill(240, 240, 200);
  rect(0, 0, width, menueheight);
}


interface button{
  void disp();
  void execution();
  boolean IsUnderCursor();
}

public class ResetButton implements button{
  int x,y;
  public ResetButton(int X, int Y){   
    x = X;
    y = Y;
  }
 
  void disp(){
  }
  
  void execution(){
  }
  
  boolean IsUnderCursor(){
    
    return true;
  }
}