import '/data/game/domain/entities/game_result_entity.dart';

class GameEndEntity {
  final String gameId;
  final List<GameResultEntity> gameResultEntity;

  GameEndEntity({
    required this.gameId,
    required this.gameResultEntity,
  });
}
