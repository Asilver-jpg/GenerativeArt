int cellSize = 6;
int outerCellSize = 7 ;
CellSystem polyCells;
CellSystem outerCells;
MultiCellSystem allCellSystems;


void setup(){
  size(1000,700);
  
  CellSystemData[] cellSystemsData = new CellSystemData[2];
  cellSystemsData[0] = new CellSystemData(cellSize, 500,500, "default");
  cellSystemsData[1] = new CellSystemData(outerCellSize, 600,600, 2);

    
    allCellSystems = new MultiCellSystem(cellSystemsData);
    
  for(int i = 0; i < 300; i++){
    allCellSystems.updateSingleSystemState(0);
  }
}

void draw(){
 
  background(0);
   fill(255);
  allCellSystems.advanceStates();
  allCellSystems.display();
}
