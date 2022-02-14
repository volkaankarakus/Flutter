import 'dart:math';

void main(){
  var numbers = <int>[];

  var r = Random();

  for(var i=0; i<100 ; i++){
    int randomNum = r.nextInt(50); // between 0-49
    numbers.add(randomNum);
  }

  numbers.sort();
  print(numbers);
}