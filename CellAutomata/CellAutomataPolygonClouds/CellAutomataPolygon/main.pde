int cellSize = 10;
CellSystem polyCells;

void setup(){
  size(500,300);
   polyCells = new CellSystem(cellSize);
  
  for(int i = 0; i < 60; i++){
    polyCells.advanceState();
  }
}

void draw(){
  background(200);
  polyCells.advanceState();
  polyCells.display();
  
}



void mousePressed(){polyCells.restart();}
