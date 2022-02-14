import 'package:collections/List/ListwithOOP/classStudents.dart';

void main(){
  var student1 = Students(100,'Ali','Business');
  var student2 = Students(123, 'Veli', 'Economics');
  
  var students = <Students>[];

  students.add(student1);
  students.add(student2);

  for(var m in students){
    print('**********************');
    print('Student No : ${m.number}');
    print('Student name : ${m.name}');
    print('Student Class : ${m.className}');
  }

  // research -> Comparable and compareTo ERROR

  // List Filter
  Iterable<Students> filteredIterable = students.where((i){
    return i.number>120;
  });

  // converting iterable to list
  students = filteredIterable.toList();
  for(var m in students){
    print('**********************');
    print('Student No : ${m.number}');
    print('Student name : ${m.name}');
    print('Student Class : ${m.className}');
  }
}
