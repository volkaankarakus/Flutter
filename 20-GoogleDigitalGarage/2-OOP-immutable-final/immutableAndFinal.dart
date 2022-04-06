// MUTABLE(icerigi degisebilir), IMMUTABLE(icerigi degisemeyen) AND FINAL

// final ile degismeyen referanslar, immutable ile degismeyen nesneler yaraticaz.
//    nesneleri esitledigimizde ve bir degisiklik yaptigimizda degisiklik iki nesneye de yansiyordu.
//    Bunun onune gecmek icin 2. nesneyi final ile tanimlayip referansin degismesini engelliyoruz.

import 'package:flutter/cupertino.dart';

class Ogrenci {
  String ad;
  int yas;

  Ogrenci(this.ad, this.yas);

  void merhabaDe(){
    print('Merhaba ben $ad, yasim $yas');
  }
}

@immutable
class ImmutableOgrenci {
  final String name;
  final int age;

  ImmutableOgrenci(this.name, this.age);

}
