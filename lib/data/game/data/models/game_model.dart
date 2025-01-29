import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  final String ln;
  final String id;
  final int rd;
  final int it;
  final int tr;

  GameModel({
    required this.ln,
    required this.id,
    required this.rd,
    required this.it,
    required this.tr,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
