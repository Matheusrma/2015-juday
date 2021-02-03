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

String base_word = "covid19";
int[] dist = new int[] {1,0,0,0,1,0,1,0};  

void setup () {
  size (1000, 1000);
 
  ca = new CellularAutomata(100, 100, 3, new int [] {0, 1}, strToBinary(base_word));
 
  frameRate (30);
  colorMode (HSB, 360, 100, 100);
  smooth();
}
 
void draw () {
  background(0, 0, 100);
  
  //add border
  translate((width - width * scaleVal) * 0.5, (height - height * scaleVal) * 0.5);
  scale(scaleVal);

  ca.draw();
}

void keyPressed() {
  if (key == 'h'){
    ca = new CellularAutomata(100, 100, 3, new int [] {0, 1}, strToBinary(base_word));
  }
}

String strToBinary(String base_word){
  int sum = 0;
  
  for (int i = 0; i < base_word.length(); ++i){
     sum += int(base_word.charAt(i));
  }
  
  println(sum);
  sum = sum % 255;
  println(sum);
  
  String binary = binary(sum);
  binary = binary.substring(binary.length() - 8);
  
  println(binary);
  return binary;
}
