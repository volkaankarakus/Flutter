import 'dart:io';

void main(){
  var names = <String>[];

  names.add('Ali');
  names.add('Veli');
  names.add('Zeynep');
  names.add('Volkan');
  names.add('Osman');

  print('Search a name:');
  String name = stdin.readLineSync()!;

  print('Search a number:');
  int num1 = int.parse(stdin.readLineSync()!);

  for(var i in names){
    if(i == name){
      print('Name found.');
      break;
    }else{
      print('Name did not find.');
    }
  }

}