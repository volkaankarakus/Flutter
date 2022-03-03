import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:httplibrary/users.dart';
import 'package:httplibrary/usersResponse.dart';


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

  List<Users> parseUsersResponse(String response){
     /*
    var jsonData = json.decode(response);
    var userResponse = UsersResponse.fromJson(jsonData);
    List<Users> usersList = UsersResponse.usersList;
    return usersList;
    */     // INSTEAD OF THIS : USE THIS WAY
    return UsersResponse.fromJson(json.decode(response)).usersList;
  }

  Future<List<Users>> allUsers() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var response = await http.get(url);
    return parseUsersResponse(response.body);
  }

  Future<void> showUsers() async{
    var liste = await allUsers();
    for(var k in liste){
      print('**********************');
      print('User ID : ${k.userID}');
      print('User Name : ${k.userName}');
      print('User Phone : ${k.userPhone}');
    }
  }

  @override
  void initState() {
    super.initState();
    showUsers();
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
