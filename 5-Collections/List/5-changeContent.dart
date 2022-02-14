void main(){
  var numbers = <int>[];
  numbers.add(20);
  numbers.add(300);
  numbers.add(213);
  numbers.add(530);

  // MULTIPLY BY 2
  for(var i = 0; i<numbers.length; i++){
    numbers[i] = numbers[i] * 2;
  }

  for(var s in numbers){
    print(s);
  }
}