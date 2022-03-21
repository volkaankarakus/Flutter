import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:serialize/constants.dart';
import 'package:serialize/http_service.dart';
import 'package:serialize/model/bank.dart';
import 'package:serialize/model/bank_list_response.dart';

class BankResponseListScreen extends StatefulWidget {

  int maturity;
  int amount;


  BankResponseListScreen({required this.maturity,required this.amount});

  @override
  State<BankResponseListScreen> createState() => _BankResponseListScreenState();
}

class _BankResponseListScreenState extends State<BankResponseListScreen> {



  bool isLoading = false;
  HttpService? http;

  BankListResponse? bankListResponse;
  List<Banks>? banks;

  Future getoffers(int amount,int maturity,int type,int offer_count) async{
    Response response;
    try {

      isLoading = true;

      response = (await http?.postRequest(amount,maturity, type, offer_count))!;

      isLoading = false;

      if(response.statusCode==200){
        setState(() {
          bankListResponse = BankListResponse.fromJson(response.data);
          banks = bankListResponse?.banks;
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
    http = HttpService();
    bankListResponse = BankListResponse();
    getoffers(widget.amount,widget.maturity,0,3);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: isLoading
            ? Center(child: CircularProgressIndicator(),)
            : banks != null ? ListView.builder(
                  itemBuilder: (context,index){
                    final bank = banks![index];
                    aylikTaksit(){
                      double totalInterestRate = bank.interest_rate! * 0.012 ;
                      int? amo = bankListResponse!.amount;
                      int? matu = bankListResponse!.maturity;
                      num a = pow((1 + totalInterestRate),matu!);
                      num b = amo! * totalInterestRate * a;
                      num c = pow((1+totalInterestRate),matu);
                      num montlyPayment = b / (c-1);

                      return montlyPayment.toStringAsFixed(2); // one by one due to the problem of pow
                    }

                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              child: SizedBox(
                                height: 40,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                              margin: EdgeInsets.all(2),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                                color: kPrimaryColor,
                                margin: EdgeInsets.all(4),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    title : (Text('${bank.bank} \n'
                                        'Yillik Oran :${bank.annual_rate?.toStringAsFixed(2)}\n'
                                        'Yillik Maaliyet Orani :${bank.interest_rate?.toStringAsFixed(2)}\n'
                                        'Aylik Taksit : ${aylikTaksit()}',style: TextStyle(color: kPrimaryColor,fontSize: 16,),)),
                                    leading: Icon(Icons.account_balance_wallet_rounded,color: kPrimaryColor,),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(onPressed: () {}, icon: Icon(Icons.info),color: Colors.red,),
                                      ],
                                    ),
                                    onTap: (){

                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: banks?.length,
            ) : Center(child: Text('No offer')),
    );
  }
}


