// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankListResponse _$BankListResponseFromJson(Map<String, dynamic> json) =>
    BankListResponse()
      ..id = json['id']
      ..amount = json['amount'] as int?
      ..created_at = json['created_at']
      ..client_id = json['client_id']
      ..type = json['type'] as String?
      ..maturity = json['maturity'] as int?
      ..carCondition = json['carCondition']
      ..totalOffers = json['totalOffers'] as int?
      ..banks = (json['offers'] as List<dynamic>?)
          ?.map((e) => Banks.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BankListResponseToJson(BankListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'created_at': instance.created_at,
      'client_id': instance.client_id,
      'type': instance.type,
      'maturity': instance.maturity,
      'carCondition': instance.carCondition,
      'totalOffers': instance.totalOffers,
      'offers': instance.banks,
    };
