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
    PVector aMax = aZone.aMax(); //<>//
    if (x < aMin.x || x > aMax.x  || y < aMin.y || y > aMax.y) {
      return false;
    }
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
      } else if (average <=50) {
        int random = int(random(1,100));
        if(random < 2){
        nextState = 255;
        }
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
    fill(state);
    ellipse(x, y, cellSize, cellSize);
  }
  
   void drawMe(float xNoise, float yNoise) {
    state = nextState;
    fill(state);
    int toInverse = int(random(2));
    int inverse = toInverse == 0 ? -1 : 1;
    float xFactor = inverse *(noise(xNoise) *80);
        float yFactor = inverse * (noise(yNoise) *80);
    
    ellipse(x + xFactor, y+ yFactor, cellSize, cellSize);
  }
}
