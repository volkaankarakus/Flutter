import 'package:oop/compositionExampleDatabase/inheritance/vehicle.dart';

class Car extends Vehicle{
  String carBodyType;

  Car(this.carBodyType, String color, String gear) : super(color,gear);
}