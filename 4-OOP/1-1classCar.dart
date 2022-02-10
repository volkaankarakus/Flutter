// taslaklar class
// taslaktan urettigimiz yapilar nesne

// classlardan nesneler ureticez

class Car{
  late String color ;
  late int speed ;
  late bool workOrNot;

  void takeInfo(){
    print('Car color : $color \nCar Speed : $speed');
  }

  void toWork(){
    workOrNot = true;
  }

  void toStop(){
    workOrNot = false;
    speed = 0;
  }

  void speedUp(int desiredSpeed){
    speed = desiredSpeed;
  }

  void speedDown(int desiredSpeed){
    speed = desiredSpeed;
  }
}