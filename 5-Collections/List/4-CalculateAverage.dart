void main(){
  var numbers = <int>[20,50,40,30,21,34];

  int sum = 0;
  for(var i in numbers){
    sum = sum + i;
  }

  print('Average : ${sum/numbers.length}');
}
