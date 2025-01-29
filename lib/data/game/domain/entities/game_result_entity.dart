class GameResultEntity {
  final int playerId;
  final int playerScore;
  final String playerColor;

  GameResultEntity({
    required this.playerColor,
    required this.playerId,
    required this.playerScore,
  });
}
