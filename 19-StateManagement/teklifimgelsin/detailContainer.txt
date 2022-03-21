import 'dart:math';

import 'package:flutter/material.dart';
import 'package:serialize/http_service.dart';
import 'package:serialize/model/bank.dart';
import 'package:serialize/model/bank_list_response.dart';

class detailContainer extends StatefulWidget {

  @override
  State<detailContainer> createState() => _detailContainerState();
}

class _detailContainerState extends State<detailContainer> {

  HttpService? http;

  BankListResponse? bankListResponse;
  List<Banks>? banks;



  @override
  void initState() {
    http = HttpService();
    bankListResponse = BankListResponse();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: banks?.length,
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
            child: Column(
              children: [
                Text(
                  '${bank.bank}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
          }

          ),
    );
  }
}
