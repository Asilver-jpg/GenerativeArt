class MultiCellSystem{
  CellSystem[] cellSystems;
  Zone[] usedZones;
  
  MultiCellSystem(CellSystem[] systems){
      cellSystems = systems;
      usedZones = new Zone[systems.length];
  }

}
