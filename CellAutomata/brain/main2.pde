int cellSize = 10;
int numX, numY;
Cell[][] cellArr;


void setup(){
  size(500,300);
  numX = floor(width / cellSize);
  numY = floor(height/cellSize);
  restart();
}

void restart(){
  cellArr = new Cell[numX][numY];
  for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      Cell newCell = new Cell(x,y, cellSize);
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

void draw(){
  background(200);
  for(int x=0; x <numX; x++){
    for(int y = 0; y< numY; y++){
      cellArr[x][y].determineNextState();
      
    }
  }
  translate(cellSize/2, cellSize/2);
  //must be done twice so that each cell can change based on static neighbor
    for(int x = 0; x <  numX; x++){
    for(int y = 0 ; y < numY; y++){
      cellArr[x][y].drawMe();
    }
    }
}



void mousePressed(){restart();}
