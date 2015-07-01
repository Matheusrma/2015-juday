class Ruleset {
 
  Rule[] combos;
 
  Ruleset(int neighborsNum, int... stats) {
    generateCombinations(neighborsNum, stats);
  }
   
  void printValues () {
    for (Rule c : combos) {
      c.printValues();
      println();
    }
  }
   
  void setRulset (int[] stats) {
    for (Rule c : combos) {
      c.setRandomDerivation(stats);
    }
  }
 
  void generateCombinations(int neighborsNum, int[] stats) {
    combos = new Rule[(int)pow(stats.length, neighborsNum)];
 
    iterateThroughStats(stats, combos, new int[] {}, 1, neighborsNum);
    
    combos[0].setDerivation(0);
    combos[1].setDerivation(1);
    combos[2].setDerivation(0);
    combos[3].setDerivation(1);
    combos[4].setDerivation(1);
    combos[5].setDerivation(0);
    combos[6].setDerivation(1);
    combos[7].setDerivation(0);
    
    println();
  }
 
  void iterateThroughStats(int[] stats, Rule[] combos, int[] statCombination, int j, int neighborsNum) {
    for (int i = 0; i < stats.length; i++) {
      
      int[] tt = statCombination;
      tt = append(tt, stats[i]);
 
      if (j < neighborsNum) iterateThroughStats(stats, combos, tt, j + 1, neighborsNum);
      else {
        boolean found = false;
        int id = 0;
        while (!found && id < combos.length) {
          if (combos[id] == null) {
            combos[id] = new Rule(tt);
            combos[id].setRandomDerivation(stats);
            combos[id].printValues();
            found = true;
          }
          id++;
        }
      }
    }
  }
}

