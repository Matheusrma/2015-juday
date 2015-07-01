/*----------------------------------
   
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
   
 Versions:
 12.12.2014 : running version
 17.12.2014 : code optimation, correction + multi neighbors
   
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
   
 -----------------------------------*/
 
CellularAutomata ca;
float scaleVal = 0.95;
int drawMode = 0;
boolean autoMode = true;
 
void setup () {
  size (1200, 600);
 
  ca = new CellularAutomata(120, 100, 1, new int [] {0, 1});
  ca.updateFull();
 
  frameRate (30);
  colorMode (HSB, 360, 100, 100);
  smooth();
}
 
void draw () {
  background(0, 0, 100);
  
  translate((width -width * scaleVal) * 0.5, (height - height * scaleVal) * 0.5);
  scale(scaleVal);

  if (!autoMode) ca.update();
  ca.draw(drawMode);
}

void keyPressed() {
  if (key == 'h'){
    ca = new CellularAutomata(120, 100, 1, new int [] {0, 1});
    ca.updateFull();
  }
  else if (key == 'r'){
    ca.newRuleset();
    ca.updateFull();
  }
  else if (key == 'c'){
    ca.setNewColors();
  }
}

