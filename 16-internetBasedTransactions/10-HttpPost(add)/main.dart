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

  // ***************************** GET *************************************** //

  List<Users> parseUsersResponse(String response){
     /*
    var jsonData = json.decode(response);
    var userResponse = UsersResponse.fromJson(jsonData);
    List<Users> usersList = UsersResponse.usersList;
    return usersList;
    */     // INSTEAD OF THIS : USE THIS WAY
    return UsersResponse.fromJson(json.decode(response)).usersList;
  }

  Future<List<Users>> allUsers() async{             // GET
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

  // ************************************************************************* //

  // *************************** POST SEARCH *************************************** //

  Future<List<Users>> searchUser(String searchWord) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");
    var data = {"kisi_ad":searchWord};
    var response = await http.post(url,body: data);
    return parseUsersResponse(response.body);
  }

  Future<void> searchUserShow() async{
    var liste = await searchUser("lotta");

    for(var k in liste){
      print('**************');
      print('User ID : ${k.userID}');
      print('User Name : ${k.userName}');
      print('User Phone : ${k.userPhone}');
    }
  }
  // ************************************************************************* //

  // *************************** POST DELETE *************************************** //

  Future<void> deleteUser(int userID) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var data = {"kisi_id": userID.toString()};
    var response = await http.post(url,body: data);
    print('Delete response : ${response.body}');
  }
  // ************************************************************************* //

  // *************************** POST ADD *************************************** //
  Future<void> userAdd(String userName,String userPhone) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var data = {"kisi_ad":userName,"kisi_tel":userPhone};
    var response = await http.post(url,body: data);
    print('Add response : ${response.body}');
  }
  // ************************************************************************* //

  @override
  void initState() {
    super.initState();
    //searchUserShow();
    //deleteUser(552);
    userAdd("volkankarakus", "53113123123");
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
