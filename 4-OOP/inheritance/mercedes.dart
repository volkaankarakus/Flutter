import 'package:oop/compositionExampleDatabase/inheritance/car.dart';

class Mercedes extends Car{
  String model;

  Mercedes(this.model,String carBodyType,String color,String gear) : super(carBodyType,color,gear);
}