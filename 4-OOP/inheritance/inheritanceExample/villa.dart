import 'package:oop/inheritanceExample/home.dart';

class Villa extends Home{
  bool haveGarrage;

  Villa(this.haveGarrage, int windowNumber) : super(windowNumber);
}