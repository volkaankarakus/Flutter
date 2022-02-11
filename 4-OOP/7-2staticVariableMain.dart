import 'package:flutter/services.dart';
import 'package:oop/staticVariable.dart';

void main(){
  print(GenerateStatic.rate);
  print(GenerateStatic.variable1);
  GenerateStatic.greeting();

  GenerateStatic.variable1 = 100;

  // GenerateStatic.rate = 25; ERRORRR !!!!!!
}

// !! WE DIDNT CREATE AN OBJECT.