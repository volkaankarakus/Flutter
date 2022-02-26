import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_listview/detailPage.dart';
import 'package:recipe_app_listview/foods.dart';

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
        primarySwatch: Colors.orange,
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

  Future<List<Foods>> getFoods() async{
    var foodList = <Foods>[];

    var food1 = Foods(1,'Kofte','kofte.png', 30);
    var food2 = Foods(2,'Ayran','ayran.jpg', 7);
    var food3 = Foods(3,'Fanta','fanta.png', 9);
    var food4 = Foods(4,'Makarna','makarna.jpg', 21);
    var food5 = Foods(5,'Kadayif','kadayif.png', 25);
    var food6 = Foods(6,'Baklava','baklava.jpg', 30);

    foodList.add(food1);
    foodList.add(food2);
    foodList.add(food3);
    foodList.add(food4);
    foodList.add(food5);
    foodList.add(food6);

    return foodList;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<List<Foods>>(

        future: getFoods(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var foodList = snapshot.data;

            return ListView.builder(
                itemCount: foodList!.length,
                itemBuilder: (context,index){
                  var food = foodList[index];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(food: food)));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(width: 150,height:150,child: Image.asset('images/${food.foodImageName}')),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(food.foodName,style: TextStyle(fontSize: 25),),
                              SizedBox(height: 50,),
                              Text('${food.foodPrize} \u{20BA}',style: TextStyle(fontSize: 20),), //symbol of TL
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right),
                        ],
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
