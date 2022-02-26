import 'package:flutter/material.dart';
import 'package:recipe_app_listview/foods.dart';

class DetailPage extends StatefulWidget {

  Foods food;


  DetailPage({required this.food});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.foodName,style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 400,height:450,
                child: Image.asset('images/${widget.food.foodImageName}')),
            Text('${widget.food.foodPrize}\u{20BA}',style: TextStyle(fontSize: 48,color: Colors.indigoAccent),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: (){
                    print('${widget.food.foodName} ordered.');

                  },
                  child: Text('Give an order',style: TextStyle(color : Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, //background color
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
