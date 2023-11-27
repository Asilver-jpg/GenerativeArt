class Zone{
  float maxX, maxY, minY, minX;
  
  Zone(float mX,float  mY,float miY,float miX){
    maxX = mX;
    maxY= mY;
    minY = miY;
    minX= miX;
  }
  
  Zone(){
    maxX = 0;
    maxY= 0;
    minY = 0;
    minX= 0;
  }
  
  boolean pointInZone(float x,float y){
      if(x >= minX && x <=maxX && y >= minY && y <= maxY){return true;
    }else{
      return false;
    }
  }
  
}
