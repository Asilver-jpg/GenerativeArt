int cellSize = 8;
CellSystem polyCells;

void setup(){
  size(500,300);
   polyCells = new CellSystem(cellSize);
  
  for(int i = 0; i < 200; i++){
    polyCells.advanceState();
  }
}

void draw(){
  background(0);
  polyCells.advanceState();
  polyCells.display();
  
}



void mousePressed(){polyCells.restart();}
