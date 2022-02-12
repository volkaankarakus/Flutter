import 'package:oop/polymorphism/employee.dart';

class Manager extends Employee{
  void hire(Employee e){
    e.wasHired();
  }
}