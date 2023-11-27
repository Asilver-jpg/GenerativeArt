class Cell {

  float x, y;
  float state, nextState;
  float lastState = 0;
  ArrayList<Cell> neighbors;
  int cellSize;
  PVector movementNoise;
  int inverseX;
  int inverseY;
  int colorPallette;

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
    colorPallette = int(random(3));
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
     int average = int(total/8); // 8 neighbors
     
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
    color c  = determineFill(state);
    fill(c,60);
   
    float xNoise = inverseX * (noise(movementNoise.x) * 40);
    float yNoise = inverseY * (noise(movementNoise.y) *40);
    int size = int(random(cellSize/2, cellSize*2));
    ellipse(x + xNoise, y + yNoise, size, size);
  }
  
  color determineFill(float state){
    switch(colorPallette){
      case 1:
       return color(state, random(state, state/2), random(state, state/2));
      case 2: 
       return color(state, 0, random(state, state/2));
      case 3:
      return color(state, random(state, state/2), 0);

    }
    return color(state);
  }
}
