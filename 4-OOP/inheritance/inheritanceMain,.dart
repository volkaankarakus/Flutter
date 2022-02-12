import 'package:oop/compositionExampleDatabase/inheritance/car.dart';
import 'package:oop/compositionExampleDatabase/inheritance/mercedes.dart';

void main(){

  var car = Car('Sedan', 'red', 'otomatic');
  print(car.carBodyType);
  print(car.color);
  print(car.gear);

  var merso = Mercedes('E250','Sedan','White','otomatic');
  print(merso.model);
}