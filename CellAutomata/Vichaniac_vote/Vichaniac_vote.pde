class Cell {

  float x, y;
  boolean state, nextState;
  ArrayList<Cell> neighbors;
  int cellSize;

  Cell(float ex, float why, int cS) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = random(2) > 1 ? true : false;
    state = nextState;
    neighbors = new ArrayList<Cell>();
  }

  void addNeighbor(Cell cell) {
    neighbors.add(cell);
  }

  void determineNextState() {
    int liveCount = 0;
    for (int i =0; i <neighbors.size(); i++) {
      if (neighbors.get(i).state == true) {
        liveCount++;
      }
    }
    //tends to keep things more alive than dead
    if (state) {liveCount++;}
    
      if (liveCount <=4) {
        nextState = false;
      }else if(liveCount>4){
      nextState = true;
    }
    if(liveCount ==4 || liveCount==5){
      nextState = !nextState;
    }
    }

  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == true) {
      fill(0);
    } else {
      fill(255);
    };
    ellipse(x, y, cellSize, cellSize);
  }
}
