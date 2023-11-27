class Cell {

  float x, y;
  int state, nextState;
  ArrayList<Cell> neighbors;
  int cellSize;

  Cell(float ex, float why, int cS) {
    x = ex * cS;
    y= why * cS;
    cellSize = cS;
    nextState = int(random(3));
    state = nextState;
    neighbors = new ArrayList<Cell>();
  }

  void addNeighbor(Cell cell) {
    neighbors.add(cell);
  }

  void determineNextState() {
     if(state ==0){
       int firingCount =0;
       for(int i=0; i < neighbors.size();i++){
         if(neighbors.get(i).state ==1){
           firingCount++;
         }
       } 
       if(firingCount == 2 ){
         nextState =1;
       }else{
         nextState = state;
       }
     }else if(state ==1){
     nextState = 2;
   }else if(state ==2){
     nextState =0;
   }
    }

  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == 1) {
      fill(0);
    } else if(state==2){
      fill(150);
    }else{
      fill(255);
    }
    ellipse(x, y, cellSize, cellSize);
  }
}
