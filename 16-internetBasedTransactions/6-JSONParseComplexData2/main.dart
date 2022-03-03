import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonparsecomplexdata2/filmResponse.dart';
import 'package:jsonparsecomplexdata2/films.dart';

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

  void filmResponseParse(){
    String strData = '{"success":1,'
                      '"filmler":['
                          '{"film_id":"1","film_ad":"Interstellar"'
                          ',"film_yil":"2015","film_resim":"interstellar.png",'
                          '"kategori":{'
                                '"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
                          '"yonetmen":{'
                                '"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'

                          '{"film_id":"3","film_ad":"The Pianist",'
                          '"film_yil":"2002","film_resim":"thepianist.png",'
                          '"kategori":{'
                              '"kategori_id":"3","kategori_ad":"Drama"},'
                          '"yonetmen":{'
                              '"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';

    var jsonData = json.decode(strData);
    var filmsResponse = FilmsResponse.fromJson(jsonData);

    int success = filmsResponse.success;

    List<Films> filmList = filmsResponse.filmList;

    print('Success :${success}');

    for(var k in filmList){
      print('*************');
      print('Film ID : ${k.filmID}');
      print('Film Name : ${k.filmName}');
      print('Film Year : ${k.filmYear}');
      print('Film Image : ${k.filmImage}');
      print('Film Category : ${k.category.categoryName}');
      print('Film Director : ${k.director.directorName}');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filmResponseParse();
  }

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

          ],
        ),
      ),

    );
  }
}
