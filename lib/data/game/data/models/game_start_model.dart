import 'package:json_annotation/json_annotation.dart';

import '/data/game/data/models/player_model.dart';

part 'game_start_model.g.dart';

@JsonSerializable()
class GameStartModel {
  final int pid;
  final String rid;
  final List<PlayerModel> pl;
  final int tr;

  GameStartModel({
    required this.pid,
    required this.rid,
    required this.pl,
    required this.tr,
  });

  factory GameStartModel.fromJson(Map<String, dynamic> json) =>
      _$GameStartModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameStartModelToJson(this);
}
