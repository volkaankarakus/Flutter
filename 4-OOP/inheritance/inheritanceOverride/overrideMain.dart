import 'package:oop/inheritanceOverride/animal.dart';
import 'package:oop/inheritanceOverride/cat.dart';
import 'package:oop/inheritanceOverride/dog.dart';
import 'package:oop/inheritanceOverride/mammal.dart';

void main(){
  var animal1 = Animal();
  animal1.makingNoise();

  var mammal1 = Mammal();
  mammal1.makingNoise();

  var cat1 = Cat();
  cat1.makingNoise();

  var dog1 = Dog();
  dog1.makingNoise();
}