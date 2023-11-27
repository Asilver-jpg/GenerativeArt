class Polygon{
  PVector endCorner = new PVector();
  PVector firstCorner = new PVector();
  int sideLength;
  PVector[] points;
  int numCorners;
  PVector center;
  float ellip;
  float rotation;
  float rotationNoise;
  
  
  Polygon(PVector start, int sideMaxLength){
    rotationNoise = random(10);
    rotation = random(1,360);
    firstCorner.set(start);
    build(floor(random(5,sideMaxLength)), floor(random(5,sideMaxLength)));
    sideLength = sideMaxLength;
  }
  
   Polygon(PVector start, int sideMaxLength, PVector cen){
    firstCorner.set(start);
    build(floor(random(10,sideMaxLength)), floor(random(10,sideMaxLength)));
    sideLength = sideMaxLength;
    center = cen;
  }
  
  void build(int sideMinLength, int sideMaxLength){
     numCorners = floor(random(2,8));
      float t = 360/numCorners;
    points = new PVector[numCorners];
        points[0] = new PVector(firstCorner.x, firstCorner.y);

     if(numCorners > 2){
    float rotation = random(0,2*PI);
    for(int i =1; i <numCorners; i++){
        float xCorner = firstCorner.x + cos((radians(i*t)+rotation)) * random(sideMinLength, sideMaxLength);
        float yCorner = firstCorner.y + sin((radians(i*t)+rotation)) * random(sideMinLength, sideMaxLength);
        points[i] = new PVector(xCorner, yCorner);
    }
  }else{
    ellip = random(5,10);

  }
  }
  
  void display(float coeff){
    noStroke();
    rotationNoise +=.05;
    if(points[1] != null){
    beginShape();
    for (int i =0; i<points.length; i++){
      
      PVector point = points[i];
      
      if(center != null){
      float newX = ((coeff * (point.x - center.x)) + center.x);
      float newY = (coeff * (point.y - center.y)) + center.y;
      vertex(newX, newY);
      }else{
      vertex(point.x,point.y);
      }

    }
    endShape(CLOSE);
  }else{
    ellipse(points[0].x, points[0].y,sideLength *ellip, sideLength*ellip);
  }
  
  }
  
  PVector endCorner(){
    int i = int(points.length-1);  
    return new PVector(points[i].x, points[i].y);

}
  
}
