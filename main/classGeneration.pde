class Generation {
  Cell[] cells;
   
  Generation (int num) {
    cells = new Cell[num];
  }
   
  void setCells(int[] stats) {
    for(int i = 0; i < cells.length; i++) { 
      cells[i] = new Cell(stats);
    }
  }
   
  Generation get (int[] stats) {
    Generation newGen = new Generation (this.cells.length);
    newGen.setCells(stats);
    
    for (int i = 0; i < newGen.cells.length; i++) {
      newGen.cells[i] = new Cell(this.cells[i].stat);
    }
    
    return newGen;
  }
   
  void updateCells(Ruleset lib) {
    for (int i = 0; i < cells.length; i++) {
      cells[i].update(lib, cells, i);
    }
  }
  
  void print(){
    for (int i = 0; i < cells.length; i++) {
      cells[i].printValue();
    }
    println();
  }
}
