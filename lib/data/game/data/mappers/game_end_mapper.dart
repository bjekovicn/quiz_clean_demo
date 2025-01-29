import '/data/game/data/mappers/game_result_mapper.dart';

import '/data/game/data/models/game_end_model.dart';
import '/data/game/domain/entities/game/game_end_entity.dart';

extension GameEndModelMapper on GameEndModel {
  GameEndEntity mapToEntity() {
    return GameEndEntity(
      gameId: id,
      gameResultEntity: pl.map((model) => model.mapToEntity()).toList(),
    );
  }
}
