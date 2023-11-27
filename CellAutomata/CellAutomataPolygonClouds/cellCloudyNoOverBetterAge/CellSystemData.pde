class CellSystemData{
  int cellSize;
  int sysWidth;
  int sysHeight;
  String variant;
  int spreadAmount;
  
  CellSystemData(int cS, int sW, int sH){
    cellSize = cS;
    sysWidth = sW;
    sysHeight = sH;
    variant = "default";
  }
  
    CellSystemData(int cS, int sW, int sH, String vari){
    cellSize = cS;
    sysWidth = sW;
    sysHeight = sH;
    variant = vari;
  }
  
   CellSystemData(int cS, int sW, int sH, int sA){
    cellSize = cS;
    sysWidth = sW;
    sysHeight = sH;
    variant = "spread";
    spreadAmount = sA;
  }
  
}
