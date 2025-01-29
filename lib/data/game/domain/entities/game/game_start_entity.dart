import '/data/game/domain/entities/player_entity.dart';

class GameStartEntity {
  final String roomId;
  final int playerId;
  final int totalRounds;
  final List<PlayerEntity> players;

  GameStartEntity({
    required this.roomId,
    required this.playerId,
    required this.totalRounds,
    required this.players,
  });
}
