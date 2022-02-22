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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<int> factorialCalculate(int num) async {
    int result = 1;
    for(var i=1;i<num;i++){
      result = result * i ;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('futureBuilder'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<int> (
                future: factorialCalculate(5),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    print('Error : ${snapshot.error}');
                  }

                  if(snapshot.hasData){
                    return Text('Result : ${snapshot.data}');
                  }else{
                    return Text('No data..');
                  }
                },
              ),

            ],
          ),
      ),
    );
  }
}
