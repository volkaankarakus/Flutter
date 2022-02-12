import 'package:oop/inheritanceExample/home.dart';

class Palace extends Home{
  int numberOfTowers;

  Palace(this.numberOfTowers, int windowNumber) : super(windowNumber);
}