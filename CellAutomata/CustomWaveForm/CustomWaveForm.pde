class Cell {

  float x, y;
  float state, nextState;
  float lastState = 0;
  ArrayList<Cell> neighbors;
  int cellSize;

  Cell(float ex, float why, int cS) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = ((x/width) + (y/height)) *14; // initial gradient
    state = nextState;
    neighbors = new ArrayList<Cell>();
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
    stroke(0);
    fill(state);
    ellipse(x, y, cellSize, cellSize);
  }
}
