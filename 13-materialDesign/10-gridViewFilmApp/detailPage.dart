import 'package:flutter/material.dart';
import 'package:gridview_film_app/films.dart';

class DetailPage extends StatefulWidget {

  Films film;

  DetailPage({required this.film}); //Send a "film" object from the "Films" class



  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.filmName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/${widget.film.filmImageName}'),
            Text('${widget.film.filmPrize} \u{20BA}',style: TextStyle(fontSize: 40,color: Colors.red),),


            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange, // background color
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape : RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                ),),
                  onPressed: (){
                    print('${widget.film.filmName} Rented');
                  },
                  child: Text('RENT'),),
            ),
          ],
        ),
      ),

    );
  }
}
