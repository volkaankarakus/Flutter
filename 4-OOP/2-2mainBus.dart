import 'package:oop/classBus.dart';

void main(){

  var bus1 = Bus();

  bus1.capacity = 50;
  bus1.fromWhere = 'Atina';
  bus1.toWhere = 'Madrid';
  bus1.currentPassenger = 45;

  bus1.takeInfo();

  //bus1.takePassenger(5);
  //bus1.takeInfo();

  bus1.takePassenger(7);
  bus1.takeInfo();
}