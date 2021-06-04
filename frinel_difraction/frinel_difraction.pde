// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
import peasy.*;

color c;
modeling m;

public void setup() {
  size(480, 400, P2D);
  createGUI();
  customGUI();

  m = new modeling(100, 100, 50, 10, 5, 1, 100);
}

public void draw() {
  background(230);
  m.fi=m.fi-10*m.v/frameRate;
  m.calc();
  m.draw_picture();
}



// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}
