import 'package:json_annotation/json_annotation.dart';

import '/data/game/data/models/round_result_model.dart';

part 'round_end_model.g.dart';

@JsonSerializable()
class RoundEndModel {
  final int rd;
  final List<RoundResultModel> rs;

  RoundEndModel({
    required this.rd,
    required this.rs,
  });

  factory RoundEndModel.fromJson(Map<String, dynamic> json) =>
      _$RoundEndModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoundEndModelToJson(this);
}
