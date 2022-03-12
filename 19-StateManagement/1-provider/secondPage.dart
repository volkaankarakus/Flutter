import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/counterModel.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Consumer<CounterModel>(
              builder: (context, counterModelObject,child){
                return Text("${counterModelObject.readCounter()}",style: TextStyle(fontSize: 36),);
              }
            ),

            Consumer<CounterModel>(
                builder: (context, counterModelObject,child){
                  return ElevatedButton(
                    onPressed: () {
                      counterModelObject.increaseCounter();
                    },
                    child: Text('Counter up'),);
                }
            ),

            Consumer<CounterModel>(
                builder: (context, counterModelObject,child){
                  return ElevatedButton(
                    onPressed: () {
                      counterModelObject.decreaseCounter(2);
                    },
                    child: Text('Counter down'),);
                }
            ),

          ],
        ),
      ),
    );
  }
}
