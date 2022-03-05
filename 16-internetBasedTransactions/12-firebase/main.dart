import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:udemy_firebase/users.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var refUsers = FirebaseDatabase.instance.reference().child('kisiler_tablo');

  Future<void> addUser() async{

    var data = HashMap<String,dynamic>(); // we should creat a hashmap for saving
    data['kisi_ad'] = 'Yusuf';
    data['kisi_yas'] = 30;
    refUsers.push().set(data);
  }

  Future<void> deleteUser() async{
    refUsers.child('-MxPc-CZN4Grl1g_M7NB').remove();
  }

  Future<void> updateUser() async{

    var updatedData = HashMap<String,dynamic>(); // we should creat a hashmap for saving
    updatedData['kisi_ad'] = 'Updated Yusuf';
    updatedData['kisi_yas'] = 22;
    refUsers.child('-MxPd6MYhgx33ynTyPRI').update(updatedData);
  }

  Future<void> allUsers()async{
    refUsers.onValue.listen((event) {
      var fetchedData = event.snapshot.value; // gelen degerleri aldik

      if(fetchedData!=null){

        fetchedData.forEach((key,object){ // keys are like -MNJx20uCGvD78
          var fetchedUser = Users.fromJson(object);
          print('**************');
          print('User Key : $key');
          print('User Name : ${fetchedUser.userName}');
          print('User Name : ${fetchedUser.userAge}');

        });
      }
    });
  }

  Future<void> allUsersOnce()async{
    refUsers.once().then((DataSnapshot snapshot) {
      var fetchedData = snapshot.value; // gelen degerleri aldik

      if(fetchedData!=null){

        fetchedData.forEach((key,object){ // keys are like -MNJx20uCGvD78
          var fetchedUser = Users.fromJson(object);
          print('**************');
          print('User Key : $key');
          print('User Name : ${fetchedUser.userName}');
          print('User Name : ${fetchedUser.userAge}');

        });
      }
    });
  }

  Future<void> searchUsers()async{
    
    var query = refUsers.orderByChild("kisi_ad").equalTo("Ahmet");
    
    query.onValue.listen((event) {
      var fetchedData = event.snapshot.value; // gelen degerleri aldik

      if(fetchedData!=null){

        fetchedData.forEach((key,object){ // keys are like -MNJx20uCGvD78
          var fetchedUser = Users.fromJson(object);
          print('**************');
          print('User Key : $key');
          print('User Name : ${fetchedUser.userName}');
          print('User Name : ${fetchedUser.userAge}');

        });
      }
    });
  }

  Future<void> limit2Users()async{

    var query = refUsers.limitToFirst(2);

    query.onValue.listen((event) {
      var fetchedData = event.snapshot.value; // gelen degerleri aldik

      if(fetchedData!=null){

        fetchedData.forEach((key,object){ // keys are like -MNJx20uCGvD78
          var fetchedUser = Users.fromJson(object);
          print('**************');
          print('User Key : $key');
          print('User Name : ${fetchedUser.userName}');
          print('User Name : ${fetchedUser.userAge}');

        });
      }
    });
  }

  Future<void> valueRangeUsers()async{

    var query = refUsers.orderByChild('kisi_yas').startAt(18).endAt(50);

    query.onValue.listen((event) {
      var fetchedData = event.snapshot.value; // gelen degerleri aldik

      if(fetchedData!=null){

        fetchedData.forEach((key,object){ // keys are like -MNJx20uCGvD78
          var fetchedUser = Users.fromJson(object);
          print('**************');
          print('User Key : $key');
          print('User Name : ${fetchedUser.userName}');
          print('User Name : ${fetchedUser.userAge}');

        });
      }
    });
  }



  @override
  void initState() {
    super.initState();
    //addUser();
    //deleteUser();
    //updateUser();
    //allUsers();
    //allUsersOnce();
    //searchUsers();
    //limit2Users();
    valueRangeUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
