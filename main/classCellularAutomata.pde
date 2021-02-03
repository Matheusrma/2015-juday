class CellularAutomata {
  int neighborsNum;
  Generation[] gen;
  Ruleset lib;
  int[] stats;
  float minHue = 70, maxHue = 0;
 
  CellularAutomata (int rows, int colums, int neighborsNum, int[] stats, String distribution) {
    this.stats = stats;
    this.neighborsNum = neighborsNum;
     
    gen = new Generation[rows + 1];
    lib = new Ruleset(distribution, neighborsNum, stats);
    lib.printValues();

    gen[0] = new Generation(colums);
    gen[0].setCells(stats);
    //println();
    //gen[0].print();
    updateFull();
    setNewColors();
  }
  
  void setNewColors () {
    minHue = random(360);
    maxHue = random(360);
  }
 
  void updateFull() {
    for (int i = 1; i < gen.length; i++) {
      gen[i] = gen[i - 1].get(stats);
      gen[i].updateCells(lib);
      //gen[i].print();
    }
  }

  void draw () {
    drawPixels();
  }
 
  void drawPixels () {
    // println("drawing pixels");
    float ySpan = (float) height / gen.length;
    noStroke();
    for (int i = 1; i < gen.length; i++) {
      float xSpan = (float) width / gen[i].cells.length;
      for (int j = 0; j < gen[i].cells.length; j++) {
        float h = map ((int) gen[i].cells[j].stat, 0, stats.length-1, maxHue, minHue);
        float s = map ((int) gen[i].cells[j].stat, 0, stats.length-1, stats.length < 3 ? 0 : 50, stats.length < 3 ? 0 : 95);
        float b = map ((int) gen[i].cells[j].stat, 0, stats.length-1, 100, 0);
 
        //if (i == 0) println ((int) gen[i].cells[j].stat);
        fill(h, s, b, 220);
        //strokeWeight(1);
        // stroke(h, s, b);
        rect (j*xSpan, i*ySpan, xSpan, ySpan);
      }
    }
  }
}
