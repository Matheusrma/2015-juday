class CellularAutomata {
  int neighborsNum;
  Generation[] gen;
  Ruleset lib;
  int[] stats;
  float minHue = 70, maxHue = 0;
 
  CellularAutomata (int rows, int colums, int neighborsNum, int[] stats) {
    this.stats = stats;
    this.neighborsNum = neighborsNum;
     
    gen = new Generation[rows];
    lib = new Ruleset(1 + neighborsNum * 2, stats);

    for (int i = 0; i < gen.length; i++) {
      gen[i] = new Generation(colums);
      gen[i].setCells(stats);
    }
 
    setNewColors();
  }
 
  void setNewColors () {
    minHue = random(360);
    maxHue = random(360);
  }
 
  void newRuleset() {
    gen[gen.length - 1].setCells(stats);
    lib.setRulset(stats);
  }
 
  void updateFull() {
    for (int i = 0; i < gen.length; i++) {
      update();
    }
  }
 
  void update() {
    for (int i = 0; i < gen.length - 1; i++) {
      gen[i] = gen[i + 1].get(stats);
    }
 
    gen[gen.length - 1].updateCells(lib);
  }
 
  void drawLines () {
    float ySpan = (float) height / gen.length;
    float x = 0, y = 0;
    
    noStroke();
    for (int i = 0; i < gen.length; i++) {
      float xSpan = (float) width / gen[i].cells.length;
      
      for (int j = 0; j < gen[i].cells.length; j++) {
        float h = map (gen[i].cells[j].stat, 0, stats.length-1, minHue, maxHue);
        float s = map (gen[i].cells[j].stat, 0, stats.length-1, stats.length < 3 ? 0 : 50, stats.length < 3 ? 0 : 95);
        float b = map (gen[i].cells[j].stat, 0, stats.length-1, 95, 0);
        float d = map (b, 0, 98, xSpan, xSpan* 4);
 
        x  = xSpan/2 + j * xSpan;
        y  = ySpan/2 + i * ySpan;
 
        stroke(h, s, b, 120);
        strokeWeight (map (gen[i].cells[j].stat, 0, stats.length-1, xSpan/4, xSpan/2) );
        line (x, y, x + cos (map (gen[i].cells[j].stat, 0, stats.length, 0, stats.length < 3 ? PI : TWO_PI)) * d, y + sin (map (gen[i].cells[j].stat, 0, stats.length, 0, stats.length < 3 ? PI : TWO_PI)) * d);
      }
    }
  }
 
  void draw (int mode) {
    if (mode == 0) drawPixels();
    else if (mode == 1) drawEllipses();
    else if (mode == 2) drawLines();
    else if (mode == 3) {
      drawEllipses();
      drawLines();
    }
    else if (mode == 4) {
      drawPixels();
      drawLines();
    }
  }
 
  void drawPixels () {
    // println("drawing pixels");
    float ySpan = (float) height / gen.length;
    noStroke();
    for (int i = 0; i < gen.length; i++) {
      float xSpan = (float) width / gen[i].cells.length;
      for (int j = 0; j < gen[i].cells.length; j++) {
        float h = map ((int) gen[i].cells[j].stat, 0, stats.length-1, minHue, maxHue);
        float s = map ((int) gen[i].cells[j].stat, 0, stats.length-1, stats.length < 3 ? 0 : 95, stats.length < 3 ? 0 : 50);
        float b = map ((int) gen[i].cells[j].stat, 0, stats.length-1, 0, 95);
 
        //if (i == 0) println ((int) gen[i].cells[j].stat);
        fill(h, s, b, 220);
        //strokeWeight(1);
        // stroke(h, s, b);
        rect (j*xSpan, i*ySpan, xSpan, ySpan);
      }
    }
  }
 
  void drawEllipses () {
    float ySpan = (float) height / gen.length;
    noStroke();
    for (int i = 0; i < gen.length; i++) {
      float xSpan = (float) width / gen[i].cells.length;
      for (int j = 0; j < gen[i].cells.length; j++) {
        float h = map (gen[i].cells[j].stat, 0, stats.length-1, minHue, maxHue);
        float s = map (gen[i].cells[j].stat, 0, stats.length-1, stats.length < 3 ? 0 : 95, stats.length < 3 ? 0 : 50);
        float b = map (gen[i].cells[j].stat, 0, stats.length-1, 0, 95);
        float d = map (b, 0, 98, xSpan * 2, xSpan);
        //if (i == 0) println (f);
        fill(h, s, b, 180);
        ellipse (xSpan/2 + j*xSpan, ySpan/2 + i*ySpan, d, d);
      }
    }
  }
}

