import 'dart:io';

import 'package:collections/List/ListwithOOP/address/address.dart';
import 'package:collections/List/ListwithOOP/address/employee.dart';

void main(){

  var employees = <Employee>[];

  for(var i=1;i<4;i++){
    print('Enter the $i. employee name');
    String enteredName = stdin.readLineSync()!;

    print('Enter the $i. employee city address :');
    String enteredCityAddress = stdin.readLineSync()!;

    print('Enter the $i. employee district address :');
    String enteredDistrictAddress = stdin.readLineSync()!;

    var address = Address(enteredCityAddress,enteredDistrictAddress);

    var emp = Employee(i,enteredName,address);

    employees.add(emp);
  }

  for(var e in employees){
    print('*********************');
    print('Employee No : ${e.no}');
    print('Employee Name : ${e.name}');
    print('Employee City Address : ${e.address.city}');
    print('Employee District Address : ${e.address.district}');

  }
}