import 'dart:math';

void main() {

  // FOR
  for (var i = 0; i < 5; i++) {
    print("Orderly : $i");
  }

  for(var i=10;i<20;i+=2){
    print("2 steps .. $i");
  }

  // WHILE
  var counter = 1;
  while(counter<10){
    print("counter : $counter");
    counter++;
  }

  // GENERATE RANDOM VARIABLE
  int min = 5;
  int max = 10;

  var r = Random();
  int randomValue = min + r.nextInt((max-min)+1);

  print(randomValue);


}

