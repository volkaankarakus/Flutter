import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var textFieldDate = TextEditingController();
  var textFieldTime = TextEditingController();

  String imageName = 'django.png' ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollView'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width: 300,
                height: 500,
                color: Colors.orange,
                child: FadeInImage.assetNetwork(
                    placeholder: 'images/placeholder.jpg',
                    image: 'http://kasimadalan.pe.hu/filmler/resimler/${imageName}'),
              ),



              TextField(
                controller: textFieldTime,
                decoration: InputDecoration(
                  hintText: 'Enter a time',
                ),
                onTap: (){
                  showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now(),),

                  ).then((takenTime){
                    setState(() {
                      textFieldTime.text = '${takenTime!.hour} : ${takenTime!.minute}';
                    });
                  });
                },
              ),


              TextField(
                controller: textFieldDate,
                decoration: InputDecoration(
                  hintText: 'Enter a date',
                ),
                onTap: (){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ).then((takenDate){
                    setState(() {
                      textFieldDate.text = '${takenDate!.day} / ${takenDate!.month} / ${takenDate!.year}';
                    });
                  });
                },
              ),


            ],
          ),
        ),
      ),

    );
  }
}
