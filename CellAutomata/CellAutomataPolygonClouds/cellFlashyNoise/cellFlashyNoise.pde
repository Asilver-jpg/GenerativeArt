class Cell {

  float x, y;
  boolean state, nextState;
  Polygon poly;
  ArrayList<Cell> neighbors;
  int cellSize;
  int age = 1;
  int vitality = floor(random(40, 80));

  Cell(float ex, float why, int cS) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = random(2) > 1 ? true : false;
    state = nextState;
    neighbors = new ArrayList<Cell>();


    PVector startCorner = new PVector(x, y-cS/2);
    PVector center = new PVector(x, y);
    poly = new Polygon(startCorner, cS/2, center);
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
    if (state) {
      if ((liveCount ==2)|| liveCount==3 ) {
        nextState = true;
      } else {
        nextState = false;
      }
    } else {
      if (liveCount ==3) {
        nextState=true;
      } else {
        nextState=false;
      }
    }
    
    if(nextState){
      age++;
      if(vitality < 256){
        vitality ++;
      }
    }else{
      if(vitality > 0){
        vitality--;
      }
    }
  }

  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == true) {
      fill(vitality, 40);
    } else {
      fill(vitality, 40);
    };
    float ageCoeff = determineAgeCoefficient();
    poly.display(ageCoeff);
  }
  

  float determineAgeCoefficient() {
    float coefficient = 1;
    if (age/100 < 1) {
      return coefficient;
    } else {
      return age/100;
    }
  }
}
