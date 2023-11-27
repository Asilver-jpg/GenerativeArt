int cellSize = 3;
CellSystem polyCells;

void setup(){
  size(1000,700);
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
