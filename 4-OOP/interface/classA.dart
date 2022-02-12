import 'package:oop/interface/interface1.dart';

class classA implements Interface1{
  @override
  int variable=10;

  @override
  void method1() {
    print('Interface method1 is working...');
  }

  @override
  String method2() {
    return 'Interface method2 is working...';
  }

}