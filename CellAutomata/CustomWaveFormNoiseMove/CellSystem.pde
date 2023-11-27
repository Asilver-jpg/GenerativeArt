class CellSystem{
Cell[][] cellArr;
int cellSize;
int numX, numY;
Zone aZone;
float xNoise, xStart, yNoise, yStart;


CellSystem(int cS){
  cellSize = cS;
   numX = floor(width / cellSize);
  numY = floor(height/cellSize);
    restart();
    xStart= random(10);
    yStart = random(10);
}


CellSystem(int cS, Zone zone){
  cellSize = cS;
   numX = floor(width / cellSize);
  numY = floor(height/cellSize);
  aZone = zone;
  restart(); //<>//

}

void restart(){
  cellArr = new Cell[numX][numY];
  
  if(aZone == null){
  for(int x = 0; x <  numX; x++){
    
    for(int y = 0 ; y < numY; y++){
      Cell newCell = new Cell(x,y, cellSize);
      cellArr[x][y] = newCell;
    }
    }
  }else{
   for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      Cell newCell = new Cell(x,y, cellSize, aZone);
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
    xStart +=.01;
    yStart += .01;
    xNoise =xStart;
    yNoise = yStart;
  
    for(int x = 0; x <  numX; x++){
      xNoise +=.1;
      yNoise = yStart;
    for(int y = 0 ; y < numY; y++){
      yNoise += .1;
      cellArr[x][y].drawMe(xNoise, yNoise);
    }
    }
}

}
