import '/data/game/data/models/round_start_model.dart';
import '/data/game/data/mappers/question_model_mapper.dart';
import '/data/game/domain/entities/game/round_start_entity.dart';

extension RoundStartModelMapper on RoundStartModel {
  RoundStartEntity mapToEntity() {
    return RoundStartEntity(
      round: rd,
      questionEntity: qs.mapToEntity(),
    );
  }
}
