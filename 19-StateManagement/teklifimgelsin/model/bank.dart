import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class Banks{
  @JsonKey(name : 'bank_id')
  int? bank_id;

  @JsonKey(name : 'bank')
  String? bank;

  @JsonKey(name : 'interest_rate')
  double? interest_rate;

  @JsonKey(name : 'sponsored_rate')
  double? sponsored_rate;

  @JsonKey(name : 'bank_type')
  String? bank_type;

  @JsonKey(name : 'url')
  dynamic url;

  @JsonKey(name : 'hypothec_fee')
  double? hypothec_fee;

  @JsonKey(name : 'expertise')
  double? expertise;

  @JsonKey(name : 'annual_rate')
  double? annual_rate;

  Banks(); // empty constructor

  factory Banks.fromJson(Map<String, dynamic> json) => _$BanksFromJson(json);
  Map<String, dynamic> toJson() => _$BanksToJson(this);
}

