import 'package:collections/List/ListwithOOP/classStudents.dart';

void main(){
  var student1 = Students(100,'Ali','Business');
  var student2 = Students(123, 'Ahmet', 'Economics');
  
  var students = <Students>[];

  students.add(student1);
  students.add(student2);

  for(var m in students){
    print('**********************');
    print('Student No : ${m.number}');
    print('Student name : ${m.name}');
    print('Student Class : ${m.className}');
  }
}