class Ruleset {
 
  Rule[] combos;
 
  Ruleset(int neighborsNum, int... stats) {
    generateCombinations(neighborsNum, stats);
  }
  
  Ruleset(String derivations, int size, int... stats){
    generateCombinations(size, stats);
 
    for (int i = 0; i < derivations.length(); ++i){
      combos[i].setDerivation(Integer.valueOf(derivations.charAt(i)) - 48);  
    }
  }
  
  void generateCombinations(int neighborsNum, int[] stats) {
    combos = new Rule[(int)pow(stats.length, neighborsNum)];
 
    iterateThroughStats(stats, combos, new int[] {}, 1, neighborsNum);
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
            found = true;
          }
          id++;
        }
      }
    }
  }
  
  void printValues () {
    for (Rule c : combos) {
      c.printValues();
      println();
    }
  }
   
  void setRuleset (int[] stats) {
    for (Rule c : combos) {
      c.setRandomDerivation(stats);
    }
  }
}
