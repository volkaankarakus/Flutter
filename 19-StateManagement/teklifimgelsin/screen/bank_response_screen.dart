import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:serialize/http_service.dart';
import 'package:serialize/model/bank.dart';
import 'package:serialize/model/bank_response.dart';

class BankResponseScreen extends StatefulWidget {

  @override
  State<BankResponseScreen> createState() => _BankResponseScreenState();
}

class _BankResponseScreenState extends State<BankResponseScreen> {

  HttpService? http;

  BankResponse? bankResponse;
  Banks? banks;

  bool? isLoading ;

  Future getoffers(int amount, int maturity,int type,int offer_count) async{
    Response response;
    try {

      isLoading = true;

      response = (await http?.postRequest(amount, maturity, type, offer_count))!;

      isLoading = false;

      if(response.statusCode==200){
        setState(() {
          bankResponse = BankResponse.fromJson(response.data);
          banks = bankResponse!.banks;
        });

      }else{
        isLoading = false;
        print('Occured a problem.');
      }

    } on Exception catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    getoffers(20000,36,0,3);
    http = HttpService();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Get Bank Offers')
      ),

      body: isLoading!
          ? Center(child: CircularProgressIndicator())
          : banks != null ? Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 16,),
            Text('Hello ${banks?.bank_type}')
          ],
        ),
      ): Center(child: Text('No offer object'),),
      );


  }
}
