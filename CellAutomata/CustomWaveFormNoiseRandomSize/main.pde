int cellSize = 5;
int numX, numY;
CellSystem cells;

void setup(){
  size(500,300);
   cells = new CellSystem(cellSize);
}



void draw(){
  background(0);
  cells.advanceState();
  cells.display();

}
