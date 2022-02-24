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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Hi !'),
                ),
              );

            },
                child: Text('Default')),

            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Do you wanna delete ?'),
                  action: SnackBarAction(
                    label: 'Yes',
                    onPressed: (){

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Deleted'),
                          ),
                      );

                    },
                  ),
                ),
              );

            },
                child: Text('Snackbar Action')),


            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('No internet connection ?', style: TextStyle(color: Colors.indigoAccent),),
                  backgroundColor: Colors.white,
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Try again',
                    onPressed: (){

                      print('Tried again.');

                    },
                  ),
                ),
              );

            },
                child: Text('Snackbar Costumized')),

          ],
        ),
      ),

    );
  }
}
