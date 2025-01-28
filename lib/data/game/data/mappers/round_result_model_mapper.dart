import '/data/game/data/models/round_result_model.dart';
import '/data/game/domain/entities/round_result_entity.dart';

extension RoundResultModelMapper on RoundResultModel {
  RoundResultEntity mapToEntity() {
    return RoundResultEntity(
      playerId: id,
      playerScore: sc,
      playerPoints: pt,
      playerTimeDifference: td,
      playerAnswer: an,
    );
  }
}
