import 'package:oop/oopGiris.dart';

void main(){
  var bmw = Car();

  bmw.speed = 300;
  bmw.color= 'red';
  bmw.workOrNot = true;

  print(bmw.color);

  int speedBmw = bmw.speed;
  print(speedBmw);

  bmw.takeInfo();
  bmw.toStop();
  bmw.takeInfo();
  bmw.speedUp(100);
  bmw.takeInfo();

  var mercedes = Car();
  mercedes.speed=310;
  mercedes.color = "white";
  mercedes.workOrNot = true;

  mercedes.takeInfo();
}