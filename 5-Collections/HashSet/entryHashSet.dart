// The data entered in is not placed with sorted indexes.
//   It placed randomly.
// Cannot recorded from the same data.

import 'dart:collection';

void main(){

  var numbers = HashSet<int>();
  var names = HashSet.from(['Ali','Veli','Hasan']);
  var fruits = HashSet<String>();

  fruits.add('strawberry');
  fruits.add('banana');
  fruits.add('kiwi');

  print(fruits.elementAt(2)); // get data in 2nd index


}