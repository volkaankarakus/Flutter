// LIST SET MAP
/*
void main(){
  // LIST
  final mesajlar = ['a','b','c'];

  print(mesajlar[0]);
  print(mesajlar.first);
  print(mesajlar.last);
  // print(mesajlar[-1]);

  // SET
  final friends = {'ali','ayse','fatma'};
  // print(friends[0]); SIRA KAVRAMI YOK O YUZDEN INDEX DE YOK

  print(friends.first);
  print(friends.last);

  // MAP
  final labels = {
    'fri' : 1,
    'school' : 5,
    'work' : 3,
  };

  print(labels);
  print(labels['fri']);
  print(labels.values.first);
  // print(labels.first); ERROR
}

 */

import 'package:dijitalatolye/immutableAndFinal.dart';
import 'package:dijitalatolye/student.dart';

/////////////////////////////////////////////////////////////////////////


void main(){

  Student s1 = Student('ali', 15);
  Student s2 = Student('ayse', 20);
  Student s3 = Student('ahmet',24);

  s1.sayHi();
  s2.sayHi();
  s3.sayHi();

  s1.celebrateBirthday();

  s1.sayHi();

  s1.address ='Izmir';
  s2.address='Istanbul';

  s1.benchmate = s2;
  s2.benchmate = s1;
  print('*********');

  s1.celebrateBirthdayToBenchmate();
  s1.sayHi();
  s2.sayHi();
  s3.sayHi();
  print('*********');

  //////////////////////////////////////////////////////////
  // IMMUTABLE
  Ogrenci o1 = Ogrenci('volkan', 26);
  final Ogrenci o2 = Ogrenci('veli',30);

  o1.merhabaDe();
  o2.merhabaDe();

  o1 = o2 ;
  o1.ad = 'mustafa';

  o1.merhabaDe();
  o2.merhabaDe();





}