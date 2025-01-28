import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  final int id;
  final String pc;
  final String pn;
  final String pp;

  PlayerModel({
    required this.id,
    required this.pc,
    required this.pn,
    required this.pp,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}
