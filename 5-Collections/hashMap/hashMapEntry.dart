// It works with 'key' and 'value' relationship.

import 'dart:collection';

void main(){
  var cities = HashMap<int,String>();

  cities[16] = 'Bursa';
  cities[34] = 'Istanbul';

  print(cities);
  print(cities.length);
  print(cities.containsKey(11));
  print(cities.containsValue('Bursa'));

  var keys = cities.keys;
  var values = cities.values;

  for(var a in keys){
    print('Keys : ${a}');
    print('Value : ${cities[a]}');
  }
}