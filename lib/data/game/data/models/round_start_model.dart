import 'package:json_annotation/json_annotation.dart';

import '/data/game/data/models/question_model.dart';

part 'round_start_model.g.dart';

@JsonSerializable()
class RoundStartModel {
  final int rd;
  final QuestionModel qs;

  RoundStartModel({
    required this.qs,
    required this.rd,
  });

  factory RoundStartModel.fromJson(Map<String, dynamic> json) =>
      _$RoundStartModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoundStartModelToJson(this);
}
