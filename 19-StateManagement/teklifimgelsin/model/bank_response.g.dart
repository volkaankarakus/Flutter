// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankResponse _$BankResponseFromJson(Map<String, dynamic> json) => BankResponse()
  ..banks = json['offers'] == null
      ? null
      : Banks.fromJson(json['offers'] as Map<String, dynamic>);

Map<String, dynamic> _$BankResponseToJson(BankResponse instance) =>
    <String, dynamic>{
      'offers': instance.banks,
    };
