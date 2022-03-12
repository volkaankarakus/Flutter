import 'package:bloc_structure/counterCubit.dart';
import 'package:bloc_structure/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}



class Homepage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text('Switch page'),),

          ],
        ),
      ),

    );
  }
}
