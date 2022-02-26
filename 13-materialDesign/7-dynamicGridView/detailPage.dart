import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {

  String countryName;


  detailPage({required this.countryName});

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Hi ${widget.countryName}',style: TextStyle(fontSize: 30),),
      ),


    );
  }
}
