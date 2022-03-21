import 'package:json_annotation/json_annotation.dart';
import 'package:serialize/model/bank.dart';

part 'bank_response.g.dart';

@JsonSerializable()
class BankResponse{
  BankResponse();

  @JsonKey(name :"offers")
  Banks? banks;

  factory BankResponse.fromJson(Map<String, dynamic> json) => _$BankResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BankResponseToJson(this);


}