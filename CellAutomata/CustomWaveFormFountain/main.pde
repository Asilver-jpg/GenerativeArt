int cellSize = 4;
int numX, numY;
CellSystem cells;
PVector aMax, aMin;

void setup(){
  size(500,300);
  float unitX = width/10;
  float unitY = height/10;
  aMin = new PVector(unitX *4, unitY *4);
  aMax = new PVector(unitX *6,unitY *6);
  Zone zone = new Zone(aMin, aMax); //<>//

   cells = new CellSystem(cellSize, zone);
}



void draw(){
  background(0);
  cells.advanceState();
  cells.display();

}
