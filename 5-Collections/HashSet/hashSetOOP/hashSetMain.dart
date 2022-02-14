import 'dart:collection';

import 'package:collections/HashSet/hashSetOOP/students.dart';

void main(){
  var student1 = Students(100,'Ahmet', 'Business');
  var student2 = Students(123,'Veli', 'IT');
  var student3 = Students(300, 'Zeynep','Economics');
  var student4 = Students(300, 'Emre', 'Health');
  var students = HashSet<Students>();

  students.add(student1);
  students.add(student2);
  students.add(student3);

  for(var i in students){
    print('*****************');
    print('Student No : ${i.no}');
    print('Student Name : ${i.name}');
    print('Student Class Name : ${i.className}');

  }
}