class Cell {

  float x, y;
  float state, nextState;
  float lastState = 0;
  ArrayList<Cell> neighbors;
  int cellSize;
  PVector movementNoise;
  int inverseX;
  int inverseY;

  Cell(float ex, float why, int cS, PVector noise) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = ((x/width) + (y/height)) *14; // initial gradient
    state = nextState;
    neighbors = new ArrayList<Cell>();
    movementNoise = noise;
    int toInverseX = int(random(2));
    inverseX = toInverseX == 0 ? -1 : 1;
    
      int toInverseY = int(random(2));
    inverseY = toInverseY == 0 ? -1 : 1;
  }

  void addNeighbor(Cell cell) {
    neighbors.add(cell);
  }

  void determineNextState() {
     float total = 0; 
     for(int i =0; i < neighbors.size(); i++){
       total += neighbors.get(i).state;
     }
     float average = int(total/8); // 8 neighbors
     
     if(average == 255){
       nextState = 0;
     }else if(average ==0){
       nextState = 255;
     }else{
       nextState = state +average;
       if(lastState >0){nextState -= lastState;}
       if(nextState > 255){nextState = 255;}
       else if(nextState <0){nextState =0;}
       
       lastState = state;
     }
    }

  void drawMe() {
    state = nextState;
    fill(state);
   
    float xNoise = inverseX * (noise(movementNoise.x) * 40);
    float yNoise = inverseY * (noise(movementNoise.y) *40);
    ellipse(x + xNoise, y + yNoise, cellSize, cellSize);
  }
}
