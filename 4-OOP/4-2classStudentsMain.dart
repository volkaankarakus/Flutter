import 'package:oop/classStudentswithConstructor.dart';

void main(){
  /* WITHOUT CONSTRUCTOR USAGE

  var student=Students();

  student.no = 177;
  student.name = 'Volkan';*/

  // CONSTRUCTOR USAGE
  var student2 = Students2(177,'Volkan');

  print(student2.name);
}