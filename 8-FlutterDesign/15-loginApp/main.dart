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


  @override
  Widget build(BuildContext context) {

    var screenInformation = MediaQuery.of(context);
    final double screenHeight = screenInformation.size.height;
    final double screenWidth = screenInformation.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight/20),
                child: SizedBox(
                    width: screenWidth/4,
                    child:
                    Image.asset('images/loginimage.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/30),
                child: SizedBox(
                  width: screenWidth/2,
                  height: screenHeight/20,
                  child: ElevatedButton(
                      onPressed:(){
                        print('Logged in.');
                  },
                      child: Text('Login',style: TextStyle(fontSize: screenWidth/25),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child:
                Text('Help?'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(
                  fontSize: screenHeight/50,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
