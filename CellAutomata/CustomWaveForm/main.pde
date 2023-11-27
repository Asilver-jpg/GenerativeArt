int cellSize = 10;
int numX, numY;
CellSystem cells;

void setup(){
  size(500,300);
   cells = new CellSystem(cellSize);
}



void draw(){
  background(200);
  cells.advanceState();
  cells.display();

}
