import 'package:oop/interface/classA.dart';

void main(){
  var a = classA();
  print(a.variable);
  a.method1();
  String method2Result = a.method2();
  print(method2Result);
}