import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int userId;
  final String? firstName;
  final String? lastName;
  final String? googlePhoto;
  final int coins;
  final int tokens;
  final int gamesWon;
  final int gamesLost;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.googlePhoto,
    required this.coins,
    required this.tokens,
    required this.gamesWon,
    required this.gamesLost,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
