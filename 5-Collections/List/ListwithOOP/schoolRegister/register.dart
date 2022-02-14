import 'dart:io';

import 'package:collections/List/ListwithOOP/classStudents.dart';

void main(){

  int counter = 0; // student number determining
  var students = <Students>[];

  while(true){

    print('Enter the student name :');
    String name = stdin.readLineSync()!;

    print('Enter the student class :');
    String studentClass = stdin.readLineSync()!;

    var newStudent = Students(counter,name,studentClass);
    counter = counter + 1;
    students.add(newStudent);


    print('***********Exit(1)   Continue(2)***********');
    int exit = int.parse(stdin.readLineSync()!);

    if(exit == 1){
      for(var i in students){
        print('***********************');
        print('Student number : ${i.number}\nStudent Name : ${i.name}\nStudent Class : ${i.className}');
      }
      print('*********** Logged Out ***********');
      break;
    }
  }
}