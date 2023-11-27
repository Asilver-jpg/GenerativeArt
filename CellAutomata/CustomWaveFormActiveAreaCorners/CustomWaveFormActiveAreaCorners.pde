class Cell {

  float x, y;
  float state, nextState;
  float lastState = 0;
  ArrayList<Cell> neighbors;
  int cellSize;
  Zone aZone;
  boolean inActiveRange;

  Cell(float ex, float why, int cS) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = ((x/width) + (y/height)) *14; // initial gradient
    state = nextState;
    neighbors = new ArrayList<Cell>();
  }

  Cell(float ex, float why, int cS, Zone zone) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = (0); // initial gradient
    state = nextState;
    neighbors = new ArrayList<Cell>();
    aZone = zone;
    inActiveRange = inRange();

  }

  void addNeighbor(Cell cell) {
    neighbors.add(cell);
  }

  boolean inRange() {
    PVector aMin = aZone.aMin();
    PVector aMax = aZone.aMax();
    if((x==0 && y==0) ||(x==0  && y==height) ||( x==width && y==0) || (x==width &&y==height)){
      return true;
    } //<>//
    if (x < aMin.x || x > aMax.x  || y < aMin.y || y > aMax.y) {
      println("NO");
      return false;
    }
    println("YES");
    return true;
  }

  void determineNextState() {
    float total = 0;
    for (int i =0; i < neighbors.size(); i++) {
      total += neighbors.get(i).state;
    }
    float average = int(total/8); // 8 neighbors
    if (inActiveRange) {
      if (average == 255) {
        nextState = 0;
      } else if (average ==0) {
        nextState = 255;
      } else {
        updateOnAverage(average);
      }
    } else {
      updateOnAverage(average);
    }
  }

  void updateOnAverage(float average) {
    nextState = state +average;
    if (lastState >0) {
      nextState -= lastState;
    }
    if (nextState > 255) {
      nextState = 255;
    } else if (nextState <0) {
      nextState =0;
    }

    lastState = state;
  }


  void drawMe() {
    state = nextState;
    stroke(0);
    fill(state);
    ellipse(x, y, cellSize, cellSize);
  }
}
