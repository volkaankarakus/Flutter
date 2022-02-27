import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview_film_app/detailPage.dart';
import 'package:gridview_film_app/films.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Films>> getFilms() async{

    var filmList = <Films> [];

    var f1 = Films(filmID: 1, filmName:'Django' , filmImageName:'django.jpg', filmPrize: 15);
    var f2 = Films(filmID: 2, filmName:'Inception' , filmImageName:'inception.jpg', filmPrize: 18);
    var f3 = Films(filmID: 3, filmName:'Pianist' , filmImageName:'pianist.jpg', filmPrize: 14);
    var f4 = Films(filmID: 4, filmName:'Scarface' , filmImageName:'scarface.jpg', filmPrize: 25);

    filmList.add(f1);
    filmList.add(f2);
    filmList.add(f3);
    filmList.add(f4);

    return filmList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Films'),
      ),
      body: FutureBuilder<List<Films>>(
        future: getFilms(),
        builder: (context,snapshot){
          
          if(snapshot.hasData){
            var filmList = snapshot.data;
            return GridView.builder(
                itemCount: filmList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 item in a row
                  childAspectRatio: 2 / 3.5,
                ),
                itemBuilder: (context,index){
                  var film = filmList[index];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(film: film)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('images/${film.filmImageName}'),
                          ),
                          Text(film.filmName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('${film.filmPrize} \u{20BA}',style: TextStyle(fontSize: 16,),),
                        ],
                      ),
                    ),
                  );
                });
          }
          else{
            return Center();
          }
        },

      ),

    );

  }
}
