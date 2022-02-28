import 'package:counter_app_shared_preferences/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> logControl() async{

    var sp = await SharedPreferences.getInstance();

    String spUsername = sp.getString('username') ?? 'Unknown User';
    String spPassword = sp.getString('password') ?? 'Unknown Password';

    if(spUsername == 'admin' && spPassword == '123'){
      return true;
    }else{
      return false;
    }

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: logControl(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool permission = snapshot.data!;
            return permission ? Homepage() : LoginPage();
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var textFieldUsername = TextEditingController();
  var textFieldPassword = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> entryControl() async{
    var username = textFieldUsername.text;
    var password = textFieldPassword.text;

    if(username == "admin" && password == "123"){
      var sp = await SharedPreferences.getInstance();

      sp.setString('username', username);
      sp.setString('password', password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),),); // delete the backstack with pushReplacement

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wrong entry!', style: TextStyle(color: Colors.indigoAccent),),
          backgroundColor: Colors.white,
          duration: Duration(seconds: 3),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // snackBar control

      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                controller: textFieldUsername,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),

              TextField(
                obscureText: true,
                controller: textFieldPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),

              ElevatedButton(
                  onPressed: (){
                    entryControl();
                  },
                  child: Text('Login'),),
            ],
          ),
        ),
      ),
    );
  }
}
