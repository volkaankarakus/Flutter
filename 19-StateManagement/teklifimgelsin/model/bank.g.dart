// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banks _$BanksFromJson(Map<String, dynamic> json) => Banks()
  ..bank_id = json['bank_id'] as int?
  ..bank = json['bank'] as String?
  ..interest_rate = (json['interest_rate'] as num?)?.toDouble()
  ..sponsored_rate = (json['sponsored_rate'] as num?)?.toDouble()
  ..bank_type = json['bank_type'] as String?
  ..url = json['url']
  ..hypothec_fee = (json['hypothec_fee'] as num?)?.toDouble()
  ..expertise = (json['expertise'] as num?)?.toDouble()
  ..annual_rate = (json['annual_rate'] as num?)?.toDouble();

Map<String, dynamic> _$BanksToJson(Banks instance) => <String, dynamic>{
      'bank_id': instance.bank_id,
      'bank': instance.bank,
      'interest_rate': instance.interest_rate,
      'sponsored_rate': instance.sponsored_rate,
      'bank_type': instance.bank_type,
      'url': instance.url,
      'hypothec_fee': instance.hypothec_fee,
      'expertise': instance.expertise,
      'annual_rate': instance.annual_rate,
    };
