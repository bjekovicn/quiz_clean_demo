import '/data/game/data/models/game_result_model.dart';
import '/data/game/domain/entities/game_result_entity.dart';

extension GameResultModelMapper on GameResultModel {
  GameResultEntity mapToEntity() {
    return GameResultEntity(
      playerId: id,
      playerColor: pc,
      playerScore: sc,
    );
  }
}

extension GameResultEntityMapper on GameResultEntity {
  GameResultModel mapToModel() {
    return GameResultModel(
      id: playerId,
      pc: playerColor,
      sc: playerScore,
    );
  }
}
