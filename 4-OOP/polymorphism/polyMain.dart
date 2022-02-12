import 'package:oop/polymorphism/employee.dart';
import 'package:oop/polymorphism/manager.dart';
import 'package:oop/polymorphism/teacher.dart';

void main(){
  var manager = Manager();

  Employee teacher = Teacher();
  
  manager.hire(teacher);  // manager hired the teacher.
}