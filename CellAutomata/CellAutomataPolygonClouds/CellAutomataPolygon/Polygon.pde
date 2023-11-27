class Polygon{
  PVector endCorner = new PVector();
  PVector firstCorner = new PVector();
  int sideLength;
  PVector[] points;
  
  PVector center;
  
  
  Polygon(PVector start, int sideMaxLength){
    firstCorner.set(start);
    build(floor(random(10,sideMaxLength)), floor(random(10,sideMaxLength)));
    sideLength = sideMaxLength;
  }
  
   Polygon(PVector start, int sideMaxLength, PVector cen){
    firstCorner.set(start);
    build(floor(random(10,sideMaxLength)), floor(random(10,sideMaxLength)));
    sideLength = sideMaxLength;
    center = cen;
  }
  
  void build(int sideMinLength, int sideMaxLength){
    int numCorners = int(random(4,8));
    float t = 360/numCorners;
    points = new PVector[numCorners];
    float rotation = random(0,2*PI);
    points[0] = new PVector(firstCorner.x, firstCorner.y);
    for(int i =1; i <numCorners; i++){
        float xCorner = firstCorner.x + cos((radians(i*t)+rotation)) * random(sideMinLength, sideMaxLength);
        float yCorner = firstCorner.y + sin((radians(i*t)+rotation)) * random(sideMinLength, sideMaxLength);
        points[i] = new PVector(xCorner, yCorner);
    }
  }
  
  void display(float coeff){
    
    beginShape();
    for (int i =0; i<points.length; i++){
      
      PVector point = points[i];
      
      if(center != null){
      float newX = (coeff * (point.x - center.x)) + center.x;
      float newY = (coeff * (point.y - center.y)) + center.y;
      vertex(newX, newY);
      }else{
      vertex(point.x,point.y);
      }

    }
    endShape(CLOSE);
  }
  
  PVector endCorner(){
    int i = int(points.length-1);  
    return new PVector(points[i].x, points[i].y);

}
  
}
