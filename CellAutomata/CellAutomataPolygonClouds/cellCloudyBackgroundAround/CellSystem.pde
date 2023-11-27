class CellSystem{
Cell[][] cellArr;
int cellSize;
int numX, numY;
int sysWidth, sysHeight;
Zone zoneUsed;


CellSystem(int cS, int sysWid, int sysHei){
  cellSize = cS;
  sysWidth = sysWid;
  sysHeight= sysHei;
  numX = floor(sysWidth / cellSize);
  numY = floor(sysHeight/cellSize);
   restart();
   

}

void updateZone(){
  Cell minXY = cellArr[0][0];
  Cell maxXY = cellArr[numX][numY];
  zoneUsed = new Zone(minXY.x, minXY.y, maxXY.y, maxXY.x);
}

void restart(){
  cellArr = new Cell[numX][numY];
  for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      Cell newCell = new Cell(x,y, cellSize, floor(sysWidth/2), floor(sysHeight/2));
      cellArr[x][y] = newCell;
    }
  }
  
   for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      int above = y-1;
      int below = y+1;
      int left = x-1;
      int right = x+1;
      if(above <0){above = numY-1;}
      if(below== numY){below = 0;}
      if(left <0){left = numX-1;}
      if(right ==numX){right =0;}
      addNeighbors(x,y,above, below, right,left);
    }
   }
}

void addNeighbors(int x, int y, int above, int below, int right, int left){
  cellArr[x][y].addNeighbor(cellArr[left][above]);
  cellArr[x][y].addNeighbor(cellArr[left][y]);
  cellArr[x][y].addNeighbor(cellArr[left][below]);
  cellArr[x][y].addNeighbor(cellArr[x][below]);
  cellArr[x][y].addNeighbor(cellArr[right][below]);
  cellArr[x][y].addNeighbor(cellArr[right][y]);
  cellArr[x][y].addNeighbor(cellArr[right][above]);
  cellArr[x][y].addNeighbor(cellArr[x][above]);
}

void advanceState(){
for(int x=0; x <numX; x++){
    for(int y = 0; y< numY; y++){
      cellArr[x][y].determineNextState();
      
    }
  }
  
}
void display(){
    for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      cellArr[x][y].drawMe();
    }
    }
}

}
