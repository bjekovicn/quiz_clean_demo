import 'package:json_annotation/json_annotation.dart';

import '/data/game/data/models/game_result_model.dart';

part 'game_end_model.g.dart';

@JsonSerializable()
class GameEndModel {
  final String id;
  final List<GameResultModel> pl;

  GameEndModel({
    required this.id,
    required this.pl,
  });

  factory GameEndModel.fromJson(Map<String, dynamic> json) =>
      _$GameEndModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameEndModelToJson(this);
}
