class Cell {

  float x, y;
  boolean state, nextState;
  Polygon poly;
  ArrayList<Cell> neighbors;
  int cellSize;
  int age = 1;
  int vitalityIncrement = 50;
  int vitality = floor(random(40, 80));

  Cell(float ex, float why, int cS, int xOffset, int yOffset) {
    //Position of cell
    x = (ex * cS)+(width/2)-xOffset;
    y= (why * cS)+(height/2)-yOffset;
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
      if(vitality < 256 && vitality !=255){
        vitality +=vitalityIncrement;
      }
    }else{
      if(vitality > 0 && vitality !=0){
        vitality-=(vitalityIncrement/2);
      }
    }
    if(vitality <=0){vitality = 0;}
    if(vitality > 255){vitality = 255;}
  }

  void drawMe() {
    state = nextState;
    stroke(0);
    float mapFill = map (vitality, 0, 255, 80,255);
      fill(mapFill, 10);

    float ageCoeff = determineAgeCoefficient();
    poly.display(ageCoeff);
  }
  

  float determineAgeCoefficient() {
    float coefficient = 1;
    float agedCoefficient = age/30;
    if (agedCoefficient < 1) {
      return coefficient;
    } else {
      return agedCoefficient;
    }
  }
}
