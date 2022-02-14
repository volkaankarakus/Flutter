import 'dart:collection';

import 'package:collections/hashMap/hashMapOOP/users.dart';

void main(){
  var user1 = Users(1111111111, 'Volkan');
  var user2 = Users(2222222222, 'Mehmet');
  var user3 = Users(3333333333, 'Zeynep');

  var users = HashMap<int,Users>();

  users[user1.ID] = user1;
  users[user2.ID] = user2;
  users[user3.ID] = user3;

  var keys = users.keys;

  for(var a in keys){
    var user = users[a];
    if( user != null){
      print('*******************');
      print('User ID : ${user.ID}');
      print('User Name : ${user.name}');

    }
  }

}