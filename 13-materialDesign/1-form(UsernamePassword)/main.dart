import 'package:flutter/material.dart';

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

  var formKey = GlobalKey<FormState>();
  var textFieldUserName = TextEditingController();
  var textFieldPassword = TextEditingController();


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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textFieldUserName,
                        decoration: InputDecoration(
                          hintText: 'Username'
                        ),
                        validator: (textFieldInput){

                          if(textFieldInput!.isEmpty){
                            return 'Enter a username';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        controller: textFieldPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password'
                        ),
                        validator: (textFieldInput){

                          if(textFieldInput!.isEmpty){
                            return 'Enter a password';
                          }

                          if(textFieldInput.length < 6){
                            return 'Password should be 6 character at least.';
                          }

                          return null;
                        },
                      ),

                      ElevatedButton(
                          onPressed: (){
                            bool controlResult = formKey.currentState!.validate();

                            if(controlResult){
                              String username = textFieldUserName.text;
                              String password = textFieldPassword.text;
                              print('Username : ${username}, Password : ${password}');
                            }

                          },
                          child: Text('Enter'),),
                    ],
                  ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
