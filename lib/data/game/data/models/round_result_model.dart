import 'package:json_annotation/json_annotation.dart';

part 'round_result_model.g.dart';

@JsonSerializable()
class RoundResultModel {
  final int id;
  final int sc;
  final int pt;
  final double? td;
  final String? an;

  RoundResultModel({
    required this.id,
    required this.sc,
    required this.pt,
    required this.td,
    required this.an,
  });

  factory RoundResultModel.fromJson(Map<String, dynamic> json) =>
      _$RoundResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoundResultModelToJson(this);
}
