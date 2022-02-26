import 'package:flutter/material.dart';
import 'package:material_design/detailPage.dart';

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

  Future<List<String>> getData() async{
    var countryList = ['Turkey','Canada','Australia','USA','Malta','England'];

    return countryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<String>>(
        future: getData(),
        builder: (context, snapshot){ // snapshot checks data received or not
          if(snapshot.hasData){
            var countryList = snapshot.data;

            return ListView.builder(
                itemCount: countryList!.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Text(countryList[index]),
                          ],
                        ),
                      ),
                    ),
                  );

                });
          }else{
            return Center();
          }

        },
      ),

    );
  }
}
