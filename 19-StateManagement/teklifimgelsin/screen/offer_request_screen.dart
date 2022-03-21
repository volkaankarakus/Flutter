import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serialize/constants.dart';
import 'package:serialize/http_service.dart';
import 'package:serialize/model/bank.dart';
import 'package:serialize/model/bank_list_response.dart';
import 'package:serialize/screen/bank_response_list_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class OfferRequestScreen extends StatefulWidget {

  @override
  State<OfferRequestScreen> createState() => _OfferRequestScreenState();
}

class _OfferRequestScreenState extends State<OfferRequestScreen> {

  TextEditingController amount = TextEditingController();
  TextEditingController maturity = TextEditingController();


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size; // to take total width and height

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height*0.3,
                  child: Image.asset("images/teklifimgelsin.png",height:size.height * 0.3,)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,

                  decoration: InputDecoration(
                    labelText: 'Toplam Tutar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0),),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: maturity,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,

                  decoration: InputDecoration(
                    labelText: 'Vade Suresi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0),),
                    ),
                  ),
                ),
              ),



              Container(
                width: 20,
                height: 20,
                child: SizedBox(

                ),
              ),



              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                    primary: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                  ),
                    onPressed: () async{
                      int amountInt = int.parse(amount.text.toString());
                      int maturityInt = int.parse(maturity.text.toString());
                      print('$amountInt');
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>BankResponseListScreen(maturity: maturityInt, amount: amountInt),),);
                    },
                    child: Text('Teklifim Gelsin',style: TextStyle(color: Colors.white),)),
              ),


            ],
          ),
        ),
      ),



    );
  }
}


