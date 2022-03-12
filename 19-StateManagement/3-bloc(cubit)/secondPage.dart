import 'package:bloc_structure/counterCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocBuilder<CounterCubit,int>(
                builder: (context, counterValue){ // counterValue = last "state" value in counterCubit
                  return Text("$counterValue",style: TextStyle(fontSize: 36),);
                }
            ),


            ElevatedButton(
              onPressed: (){
                context.read<CounterCubit>().increaseCounter();
              },
              child: Text('Counter up'),),

            ElevatedButton(
              onPressed: (){
                context.read<CounterCubit>().decreaesCounter(2);
              },
              child: Text('Counter down'),),

          ],
        ),
      ),

    );
  }
}
