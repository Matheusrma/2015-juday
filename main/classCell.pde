class Cell {
 
  int stat;
  Cell (int[] stats) {
    stat = stats[(int) random (stats.length)];
  }
 
  Cell (int stat) {
    this.stat = stat;
  }
 
  int[] getLeftIndexes (Cell[] c, int index, int num) {
    if (index < 0) {
      index = c.length-1;
    }
 
    int[] ids = new int[num];
    int i = 0;
    while (i < num) {
      ids[i] = index;
      index--;
      if (index < 0) {
        index = c.length-1;
      }
      i++;
    }
 
    return ids;
  }
 
  int[] getRightIndexes (Cell[] c, int index, int num) {
    if (index > c.length-1) {
      index = 0;
    }
 
    int[] ids = new int[num];
    int i = 0;
    while (i < num) {
      ids[i] = index;
      index++;
      if (index > c.length-1) {
        index = 0;
      }
      i++;
    }
 
    return ids;
  }
 
  void update(Ruleset lib, Cell[] c, int index) {
    for (int i = 0; i < lib.combos.length; i++) {
      if (!lib.combos[i].isCell(this)) continue;
 
      Cell[] checkCells = new Cell [lib.combos[0].statCombination.length];
      int[] leftNeightbors = getLeftIndexes(c, index-1, checkCells.length/2);
      int[] rightNeightbors = getRightIndexes(c, index+1, checkCells.length/2);

      int j = 0;
 
      for (int k = leftNeightbors.length-1; k >= 0; k--) {
        checkCells[j] = c[leftNeightbors[k]];
        j++;
      }
      
      checkCells[j] = this;
      j++;
 
      for (int k = 0; k < rightNeightbors.length; k++) {
        checkCells[j] = c[rightNeightbors[k]];
        j++;
      }
 
      if (lib.combos[i].isCombo(checkCells)) {
        stat = lib.combos[i].derivation;
        return;
      }
    }
  }
  
  void printValue () {
    print(stat + " ");
  }
}
