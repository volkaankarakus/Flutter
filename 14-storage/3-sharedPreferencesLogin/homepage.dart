import 'package:counter_app_shared_preferences/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String spUsername = '';
  String spPassword = '';


  Future<void> readLog() async{

    var sp = await SharedPreferences.getInstance();

    setState(() {
      spUsername = sp.getString('username') ?? 'Unknown username';
      spPassword = sp.getString('password') ?? 'Unknown password';

    });
  }

  Future<void> logOut() async{

    var sp = await SharedPreferences.getInstance();

    sp.remove('username');
    sp.remove('password');

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
  }

  @override
  void initState() {
    super.initState();
    readLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Homepage'),
        actions: [
          IconButton(
              onPressed:(){
                logOut();
              },
              icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Username : ${spUsername} ', style: TextStyle(color:Colors.red,fontSize: 30),),
              Text('Password : ${spPassword}', style: TextStyle(color:Colors.red,fontSize: 30),),
              ],
          ),
        ),
      ),
    );
  }
}
