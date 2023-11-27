class MultiCellSystem {
  CellSystem[] cellSystems;

  MultiCellSystem(CellSystemData[] systems) {
    cellSystems = new CellSystem[systems.length];
    for (int i =0; i < systems.length; i++) {
      CellSystemData currData = systems[i];
      if (currData.variant != "spread") {
        cellSystems[i] = new CellSystem(currData.cellSize, currData.sysWidth, currData.sysHeight, currData.variant);
      } else {
        cellSystems[i] = new CellSystem(currData.cellSize, currData.sysWidth, currData.sysHeight, currData.spreadAmount);
      }
    }
    restart();
    populateUsedZones();
    setCellToRender();
  }

  void setCellToRender() {
    for (int i=0; i < cellSystems.length; i++) {
      CellSystem currSys = cellSystems[i];
      currSys.setCellToRender();
    }
  }

  void populateUsedZones() {
    for (int i=0; i < cellSystems.length; i++) {
      CellSystem currSys = cellSystems[i];
      if (i == 0) {
        ArrayList<Zone> zones = new ArrayList<Zone>();

        currSys.setPreviousZone(zones);
      } else {
        ArrayList<Zone> zones = new ArrayList<Zone>();

        zones.add(cellSystems[i-1].zoneUsed);
        currSys.setPreviousZone(zones);
      }
    }
  }


  void restart() {
    for (int i =0; i < cellSystems.length; i++) {
      CellSystem currCellSystem = cellSystems[i];
      currCellSystem.restart();
    }
  }

  void advanceStates() {
    for (int i =0; i < cellSystems.length; i++) {
      CellSystem currCellSystem = cellSystems[i];
      currCellSystem.advanceState();
    }
  }

  void display() {
    for (int i =0; i < cellSystems.length; i++) {
      CellSystem currCellSystem = cellSystems[i];
      currCellSystem.display();
    }
  }

  void updateSingleSystemState(int i) {
    cellSystems[i].advanceState();
  }
}
