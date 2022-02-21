import 'package:app_structure/page1.dart';
import 'package:app_structure/page2.dart';
import 'package:app_structure/users.dart';
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
      home: MyHomePage(title: 'Homepage',),
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

  int counter = 0;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:(){
                    setState(() {
                      counter = counter + 1 ;
                    });
                  },
                  child:Text(
                      'Click'
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page1(),),);

                },
                  child:
                  Text('Go to page1'),
                ),
                ElevatedButton(onPressed: (){
                  var user = Users(name:'Ali',age : 18, height : 1.78, married: true,);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(user: user,),),);
                },
                  child:
                  Text('Go to page2'),
                ),
              ],
            ),
            Text('Result : $counter'),
          ],
        ),
      ),
    );
  }
}


