class Bus{
  late int capacity;
  late String fromWhere;
  late String toWhere;
  late int currentPassenger;

  void takeInfo(){
    print('Bus cap : $capacity\n$fromWhere to $toWhere\nCurrent Passenger : $currentPassenger');
  }

  void takePassenger(int numOfTakingPassenger){
    currentPassenger += numOfTakingPassenger;
    if(currentPassenger>capacity){
      print('*********Full capacity!*********');
      currentPassenger -= numOfTakingPassenger;
    }else{
      print('*********Passenger is taken.*********');
    }
  }
}