
PVector min, max;
class Zone{
  Zone(PVector activeMin, PVector activeMax){
     min = activeMin;
     max = activeMax;
  }
  
  PVector aMin(){
    return min;
  }
  
  PVector aMax(){
    return max;
  }

}
