void main(){

  var fruits = <String>['a','b','c','d','e','f','g'];

  for (var m in fruits){
    print('Result : $m');
  }

  // Both index and data
  for(var i=0;i<fruits.length;i++){
    print('$i . index : ${fruits[i]}');
  }
}