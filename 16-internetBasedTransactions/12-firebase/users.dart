import 'package:flutter/material.dart';

class Users{
  String userName;
  int userAge;

  Users(this.userName,this.userAge);

  // creating JSON Parse structure
  factory Users.fromJson(Map<dynamic,dynamic> json){
    return Users(json['kisi_ad'] as String,json['kisi_yas'] as int);
  }
}