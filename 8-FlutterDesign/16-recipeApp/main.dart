import 'package:flutter/cupertino.dart';
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
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Recipe'),
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

  @override
  Widget build(BuildContext context) {

    var screenInformation = MediaQuery.of(context);
    final double screenHeight = screenInformation.size.height;
    final double screenWidth = screenInformation.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
                child: Image.asset("images/recipe.jpg"),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: screenWidth/8,
                    child: TextButton(onPressed: (){
                      print('Liked.');
                    },
                        child: Text('Like',style: TextStyle(
                          fontSize: screenWidth/25,
                          color: Colors.red,
                        ),
                        )
                      ,),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: screenWidth/8,
                    child: TextButton(onPressed: (){
                      print('Commented.');
                    },
                      child: Text('Comment',style: TextStyle(
                        fontSize: screenWidth/25,
                        color: Colors.red,
                      ),
                      )
                      ,),
                  ),
                ),
              ],
            ),
            Padding(
              padding:EdgeInsets.all(screenHeight/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kofte',style: TextStyle(
                    color : Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth/20,
                  ),
                  ),
                  Row(
                    children: [
                      TextEntry("Suitable for grilling.", screenWidth/25),
                      Spacer(),
                      TextEntry("August 8", screenWidth/25),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight/100),
              child: TextEntry(
              'Take the ground meatballs in a deep bowl and grate the onion on top.'
              'Then add the finely chopped parsley and other necessary ingredients, and knead well.'
              , screenWidth/25),
            ),

          ],
        ),
      ),

    );
  }
}

class TextEntry extends StatelessWidget {

  String content;
  double textSize;

  TextEntry(this.content, this.textSize);

  @override
  Widget build(BuildContext context) {
    return Text(content,style: TextStyle(fontSize: textSize),
    );
  }
}
