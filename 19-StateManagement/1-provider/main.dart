import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/counterModel.dart';
import 'package:provider_structure/secondPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()), // introducing provider models to app
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}


class Homepage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Consumer<CounterModel>(
                builder: (context, counterModelObject,child){
                  return Text("${counterModelObject.readCounter()}",style: TextStyle(fontSize: 36),);
                }
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text('Switch page'),),
          ],
        ),
      ),
    );
  }
}
