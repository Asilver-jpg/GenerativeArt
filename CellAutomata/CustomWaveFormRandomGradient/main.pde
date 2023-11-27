int cellSize = 7;
int numX, numY;
CellSystem cells;
CellSystem cells2;
float angle =0;

void setup(){
  size(500,300);
   cells = new CellSystem(cellSize);
   cells2 = new CellSystem(cellSize);
}



void draw(){
  angle+=.05;
  float x = sin(radians(angle));
  float y = cos(radians(angle));
  background(0);
  cells.advanceState();
  cells.display();
  cells2.advanceState();
  cells2.display();

}
