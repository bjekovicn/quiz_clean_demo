class UserEntity {
  final int userId;
  final String? firstName;
  final String? lastName;
  final String? googlePhoto;
  final int coins;
  final int tokens;
  final int gamesWon;
  final int gamesLost;

  UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.googlePhoto,
    required this.coins,
    required this.tokens,
    required this.gamesWon,
    required this.gamesLost,
  });
}
