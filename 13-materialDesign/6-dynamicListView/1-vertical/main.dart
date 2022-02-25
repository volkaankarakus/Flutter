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

  var countries = ['Turkey','Canada','Australia','USA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => detailPage(countryName: countries[index],),),);
                // print('Hi ${countries[index]}!');
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            print('${countries[index]} selected with text.');
                          },
                            child: Text(countries[index]),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: (){
                              print('${countries[index]} selected with button.');
                            },
                            child: Text('SELECT',style: TextStyle(color: Colors.red,fontSize: 12),),
                        ),
                        PopupMenuButton(
                            child: Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text('Delete'),
                              ),

                              PopupMenuItem(
                                value: 2,
                                child: Text('Update'),
                              ),
                            ],
                          onSelected: (menuItemValue){
                              if(menuItemValue == 1) {
                                print('${countries[index]} deleted.');
                              }

                              if(menuItemValue == 2) {
                                print('${countries[index]} updated.');
                              }
                          },
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            );

          }
          ),

    );
  }
}
