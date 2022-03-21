import 'package:json_annotation/json_annotation.dart';
import 'package:serialize/model/bank.dart';

part 'bank_list_response.g.dart';

@JsonSerializable()

class BankListResponse{

  BankListResponse();

  @JsonKey(name : 'id')
  dynamic id;

  @JsonKey(name : 'amount')
  int? amount;

  @JsonKey(name : 'created_at')
  dynamic created_at;

  @JsonKey(name : 'client_id')
  dynamic client_id;

  @JsonKey(name : 'type')
  String? type;

  @JsonKey(name : 'maturity')
  int? maturity;

  @JsonKey(name : 'carCondition')
  dynamic carCondition;

  @JsonKey(name : 'totalOffers')
  int? totalOffers;

  @JsonKey(name : 'offers')
  List<Banks>? banks;

  factory BankListResponse.fromJson(Map<String, dynamic> json) => _$BankListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BankListResponseToJson(this);













}