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

  var textFieldControl = TextEditingController();


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

            PopupMenuButton(
              child: Icon(Icons.account_box),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                      child: Text('Delete',style: TextStyle(color: Colors.red,),),),

                  PopupMenuItem(
                    value: 2,
                    child: Text('Update',style: TextStyle(color: Colors.indigoAccent,),),),

                ],

              onCanceled: (){
                print('No choice done');
              },

              onSelected: (menuItemValue){

                if(menuItemValue == 1 ) {
                  print('Delete selected');
                }

                if(menuItemValue == 2 ) {
                  print('Update selected');
                }

              },
            ),

          ],
        ),
      ),

    );
  }
}
