class RoundResultEntity {
  final int playerId;
  final int playerScore;
  final int playerPoints;
  final double? playerTimeDifference;
  final String? playerAnswer;
  RoundResultEntity({
    required this.playerId,
    required this.playerScore,
    required this.playerPoints,
    required this.playerTimeDifference,
    required this.playerAnswer,
  });
}
