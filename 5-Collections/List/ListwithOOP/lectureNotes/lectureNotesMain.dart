import 'dart:io';

import 'package:collections/List/ListwithOOP/lectureNotes/lectureNotes.dart';

void main(){

  var lectureNotesList = <LectureNotes>[];


  while(true){

    print('Enter the lecture name :');
    String lecture = stdin.readLineSync()!;

    print('Enter the $lecture score');
    int lectureScore = int.parse(stdin.readLineSync()!);

    var newNote = LectureNotes(lecture,lectureScore);
    lectureNotesList.add(newNote);



    print('****** Exit (1) , Continue (2) ******');
    int exit = int.parse(stdin.readLineSync()!);
    if(exit == 1){

      int sum = 0;

      for(var i in lectureNotesList){
        print('************');
        print('Lecture Name : ${i.lectureName} \nLecture Score : ${i.score}');
        sum = sum + i.score;
      }

      double average = sum/lectureNotesList.length;
      print('************************');
      print('Lecture Notes Average : ${average}');

      print('**********************');
      if(average>=50){
        print('YOU PASSED!');
      }else{
        print('YOU DIDNT PASS!');
      }

      print('******* Logged Out *******');
      break;
    }
  }
}