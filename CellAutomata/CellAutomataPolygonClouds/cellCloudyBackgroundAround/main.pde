int cellSize = 7;
int outerCellSize = 8;
CellSystem polyCells;
CellSystem outerCells;


void setup(){
  size(1000,700);
   polyCells = new CellSystem(cellSize,500,500);
    outerCells = new CellSystem(outerCellSize,600,600);
  for(int i = 0; i < 200; i++){
    polyCells.advanceState();
  }
}

void draw(){
  background(0);
  polyCells.advanceState();
  polyCells.display();
  
  outerCells.advanceState();
  outerCells.display();
  
}



void mousePressed(){polyCells.restart();}
