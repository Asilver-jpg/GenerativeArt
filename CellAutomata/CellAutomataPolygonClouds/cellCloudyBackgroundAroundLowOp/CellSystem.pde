class CellSystem{
Cell[][] cellArr;
int cellSize;
int numX, numY;
int sysWidth, sysHeight;
Zone zoneUsed;
ArrayList<Zone> previousZones;
boolean render;
String variant;
int spreadAmount;

CellSystem(int cS, int sysWid, int sysHei){
  cellSize = cS;
  sysWidth = sysWid;
  sysHeight= sysHei;
  numX = floor(sysWidth / cellSize);
  numY = floor(sysHeight/cellSize);
   render = true;
   restart();
   zoneUsed = updateZone();
   previousZones = new ArrayList<Zone>();
   spreadAmount= 0;
}

CellSystem(int cS, int sysWid, int sysHei, String vari){
  cellSize = cS;
  sysWidth = sysWid;
  sysHeight= sysHei;
  numX = floor(sysWidth / cellSize);
  numY = floor(sysHeight/cellSize);
    variant  =vari;
spreadAmount = 0;
  restart();
  zoneUsed = updateZone();
  previousZones = new ArrayList<Zone>();;
}

CellSystem(int cS, int sysWid, int sysHei, int sA){
  cellSize = cS;
  sysWidth = sysWid;
  sysHeight= sysHei;
  numX = floor(sysWidth / cellSize);
  numY = floor(sysHeight/cellSize);
    variant  ="spread";
    spreadAmount = sA;

  restart();
  zoneUsed = updateZone();
  previousZones = new ArrayList<Zone>();;
}




void setPreviousZone(ArrayList<Zone> zones){
    previousZones= zones;
}


void restart(){
  cellArr = new Cell[numX][numY];

  for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      int spread = spreadAmount;
      if( 0 >x || x<10 || y >0 || y <10 || x <numX-1  || x <numX-10|| y <numY-1 || y >numY-10){
        spread = spreadAmount*5;
      }
      Cell newCell = new Cell(x,y, cellSize, floor(sysWidth/2), floor(sysHeight/2), variant, spread);
      
      cellArr[x][y] = newCell;
    }
  }
  
  setAllNeighbors();
}

void setAllNeighbors(){
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

Zone updateZone(){
  if(cellArr[0][0] != null){
  Cell maxXY = cellArr[0][0];
  Cell minXY = cellArr[numX-1][numY-1];
   return new Zone(minXY.x, minXY.y, maxXY.y, maxXY.x);
}
return new Zone();
}

void setCellToRender(){
  for(int x=0; x <numX; x++){
    for(int y = 0; y< numY; y++){
      Cell currCell = cellArr[x][y];
      currCell.toRender(previousZones);
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
