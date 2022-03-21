import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serialize/constants.dart';
import 'package:serialize/http_service.dart';
import 'package:serialize/model/bank.dart';
import 'package:serialize/model/bank_list_response.dart';
import 'package:serialize/colors.dart' as colorss;

class BankResponseListScreen2 extends StatefulWidget {

  int maturity;
  int amount;


  BankResponseListScreen2({required this.maturity,required this.amount});

  @override
  State<BankResponseListScreen2> createState() => _BankResponseListScreen2State();
}

class _BankResponseListScreen2State extends State<BankResponseListScreen2> {



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

        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
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
              height: 135,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/tg.png"
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text(
                            '${bank.bank}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),

                          Column(
                            children: [
                              Padding(padding: const EdgeInsets.only(top: 3)),
                              Text('Yillik Oran :${bank.annual_rate?.toStringAsFixed(2)}',style:TextStyle(
                                color: Colors.grey[500],
                              ) ,),
                              Text('Yillik Maaliyet Orani :${bank.interest_rate?.toStringAsFixed(2)}',style:TextStyle(
                                color: Colors.grey[500],
                              ) ,),
                              Text('Aylik Taksit : ${aylikTaksit()}',style:TextStyle(
                                color: Colors.grey[500],
                              ) ,),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 18,),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            for(int i=0;i<110;i++)
                              i.isEven?Container(
                              width: 3,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)
                              ),
                            ) : Container(
                                width: 3,
                                height: 1,
                                color: Colors.white,
                              ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
        },
        itemCount: banks?.length,
      ) : Center(child: Text('No offer')),
    );
  }
}


