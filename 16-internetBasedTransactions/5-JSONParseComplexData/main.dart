import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonparsecomplexdata/users.dart';
import 'package:jsonparsecomplexdata/usersresponse.dart';

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


  void usersResponseParse(){
    String strData = '{"success":1,"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"324234234"},'
                                             '{"kisi_id":"2","kisi_ad":"Veli","kisi_tel":"555234234"}]}' ;

    var jsonData = json.decode(strData);
    var usersResponse = UsersResponse.fromJson(jsonData);
    print("Success : ${usersResponse.success}");

    List<Users> userList = usersResponse.usersList;

    for(var k in userList){
      print('*******************');
      print('User ID : ${k.userID}');
      print('User Name : ${k.userName}');
      print('User Phone : ${k.userPhone}');
    }
  }



  @override
  void initState() {
    super.initState();
    usersResponseParse();
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
          children: [

          ],
        ),
      ),

    );
  }
}
