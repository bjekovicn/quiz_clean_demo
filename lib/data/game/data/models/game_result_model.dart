import 'package:json_annotation/json_annotation.dart';

part 'game_result_model.g.dart';

@JsonSerializable()
class GameResultModel {
  final int id;
  final int sc;
  final String pc;

  GameResultModel({
    required this.id,
    required this.sc,
    required this.pc,
  });

  factory GameResultModel.fromJson(Map<String, dynamic> json) =>
      _$GameResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameResultModelToJson(this);
}
