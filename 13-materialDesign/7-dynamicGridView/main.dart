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

  var countries = ['Turkey','Canada','Australia','USA','Ireland','Malta','England'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // how many items in a row
            childAspectRatio: 2 / 1 , // width / height
          ),
          itemCount: countries.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                print('${countries[index]} Card clicked.');
              },

              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          print('${countries[index]} clicked with text.');
                        },
                          child: Text('${countries[index]}')),

                      Spacer(),

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
                              print('${countries[index]} deleted.');
                            }

                            if(menuItemValue == 2){
                              print('${countries[index]} updated.');
                            }
                        },
                      ),

                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => detailPage(countryName: countries[index])),);
                          },
                          child: Text('Select',),),
                    ],
                  ),
                ),
              ),
            );
          }),

    );
  }
}
