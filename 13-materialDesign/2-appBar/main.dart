import 'package:flutter/cupertino.dart';
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
        primarySwatch: Colors.red,
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

  bool searchDoneOrNot = false;
  var formKey = GlobalKey<FormState>();
  var textFieldUserName = TextEditingController();
  var textFieldPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchDoneOrNot ?
            TextField(
              decoration: InputDecoration(
                hintText: 'Write something for search',
              ),
              onChanged: (searchResult){
                print('Search result : ${searchResult}');
              },

            )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',style: TextStyle(color : Colors.white, fontSize: 16.0),),
            Text('Subtitle',style: TextStyle(color : Colors.white, fontSize: 12.0),),
          ],
        ),
        centerTitle: false,
        leading: IconButton(
          tooltip: 'Menu Icon', // long press
          icon: Icon(Icons.dehaze),
          onPressed: (){
            print('Menu Icon Clicked');
          },

        ),

        actions: [
          searchDoneOrNot ?
              IconButton(
                  onPressed:(){
                    setState(() {
                      searchDoneOrNot = false;
                    });
                  },
                  icon: Icon(Icons.cancel))

          :
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  searchDoneOrNot = true;
                });

              }),


          IconButton(
            tooltip: 'Info', // long press
            icon: Icon(Icons.info_outline),
            onPressed: (){
              print('Info Clicked');
            },
          ),

          PopupMenuButton(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                    child: Text('Delete'),),

                PopupMenuItem(
                  value: 2,
                  child: Text('Update'),),
              ],
            onSelected: (menuItemValue){
                if(menuItemValue == 1){
                  print('Delete clicked');
                }
                if(menuItemValue == 2){
                  print('Update clicked');
                }

            },
          ),



          TextButton(onPressed:(){
            print('Exit clicked');
          },
              child: Text('EXIT', style: TextStyle(color : Colors.white),),),

        ],
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
