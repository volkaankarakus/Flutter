import 'package:oop/enumeration.dart';

void main(){
  takingPayment(BusSize.Medium);
}

void takingPayment(BusSize size) {
  switch size{
  case BusSize.Small :
  print('Payment is 10USD');
  break;

  case BusSize.Medium :
  print('Payment is 150USD');
  break;


  case BusSize.Big :
  print('Payment is 200USD');
  break;



  }
