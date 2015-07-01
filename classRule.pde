class Rule {
  int[] statCombination; // e.g. [0] [0] [1]
  int derivation = 0;    // if statCombination is found at a certain cell, it will become this derivation
 
  Rule(int[] statCombination) {
    this.statCombination = statCombination;
  }
   
  void setRandomDerivation(int[] stats) {
    derivation = stats[(int) random (stats.length)];
  }
  
  void setDerivation(int der) {
    derivation = der;
  }
 
  void printValues () {
    for (int i : statCombination) {
      print ("[" + i + "]");
    }
 
    print("=" + derivation + " ");
  }
   
  boolean isCell (Cell c) {
    if (c.stat == statCombination[statCombination.length/2]) return true;
    else return false;
  }
  
  boolean isCombo(Cell[] c) {
    boolean matches = true;
 
    int i = 0;
    while (i < c.length) {
      if (c[i].stat != statCombination[i]) return false;
      i++;
    }
 
    return matches;
  }
}

