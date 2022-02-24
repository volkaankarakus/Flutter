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

            ElevatedButton(onPressed: (){

              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Title'),
                      content: Text('Content'),
                      actions: [

                        TextButton(onPressed: (){
                          print('Cancel clicked');
                          Navigator.pop(context);
                        },
                            child: Text('Cancel')),

                        TextButton(onPressed: (){
                          print('Okey clicked');
                          Navigator.pop(context);
                        },
                            child: Text('Okey')),

                      ],
                    );
                  });

            },
                child: Text('Basic Alert'),
            ),

            ElevatedButton(onPressed: (){

              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Title', style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.indigoAccent,
                      content: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            TextField(
                              controller: textFieldControl,
                              decoration: InputDecoration(
                                labelText: 'Data',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [

                        TextButton(onPressed: (){
                          print('Cancel clicked');
                          Navigator.pop(context);
                        },
                            child: Text('Cancel',style: TextStyle(color: Colors.white),),),

                        TextButton(onPressed: (){
                          String receivedData = textFieldControl.text ;
                          print('Received data : ${receivedData}');
                          textFieldControl.text = '';
                          print('Apply clicked');
                          Navigator.pop(context);
                        },
                            child: Text('Apply',style: TextStyle(color: Colors.white),),),

                      ],
                    );
                  });

            },
              child: Text('Costumized Alert'),
            ),

          ],
        ),
      ),

    );
  }
}
