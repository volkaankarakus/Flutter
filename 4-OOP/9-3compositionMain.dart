import 'package:oop/composition1.dart';
import 'package:oop/composition2.dart';

void main(){
  var address = Address('a','b','c');
  var people = People('volkan','karakus', address);

  print('People Name : ${people.name}');
  print('People Surname : ${people.surname}');
  print('People Street Address : ${people.address.street}');

}
