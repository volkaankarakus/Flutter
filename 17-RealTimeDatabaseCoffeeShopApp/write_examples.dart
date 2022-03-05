import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WriteExamples extends StatefulWidget {
  const WriteExamples({Key? key}) : super(key: key);

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {

  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {

    final dailySpecialRef = database.child('dailySpecial/');

    return Scaffold(
      appBar: AppBar(
        title: Text('Write examples'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () async{
                    try {
                      await dailySpecialRef.set({
                        'description': 'Vanilla latte',
                        'price': 4.99});
                      print('Special of the day has been written');

                      // setting again the price
                      await dailySpecialRef.child('price').set(2.99);
                      // or we can do it with UPDATE
                      await dailySpecialRef.update({'price' : 2.99, 'inventory' : 99});
                      // await database.update({'dailySpecial/price' : 7.99});
                      await database.update({'someOtherDailySpecial/price' : 1.99});


                    }catch(e){
                      print('You got an error! $e');
                    }

                  }, child: Text('Simple set')),

              ElevatedButton(
                  onPressed: (){
                    final nextOrder = <String,dynamic>{
                      'description' : getRandomDrink(),
                      'price' : Random().nextInt(800)/100.0,
                      'costumer' : getRandomName(),
                      'time' : DateTime.now().millisecondsSinceEpoch
                    };
                    database
                        .child('orders')
                        .push().set(nextOrder)
                        .then((_) => print('Drink has been written!'))
                        .catchError(
                            (error) => print('You got an error $error'));

                  },
                  child: Text('Append a drink order')),


            ],
          ),
        ),
      ),
    );
  }

  String getRandomDrink(){
    final drinkList = [
      'Latte',
      'Cappucino',
      'Macchiato',
      'Mocha',
      'Cold brew',
      'Espresso',
      'Vanilla latte',
      'Unicorn frappe'
    ];
    return drinkList[Random().nextInt(drinkList.length)];
  }

  String getRandomName(){
    final costumerNames = [
      'Sam',
      'Todd',
      'Peter',
      'David',
      'Morgan',
      'Rachel',
      'Jessica'
    ];
    return costumerNames[Random().nextInt(costumerNames.length)];
  }
}
