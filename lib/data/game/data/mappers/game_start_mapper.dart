import '/data/game/data/models/game_start_model.dart';
import '/data/game/data/mappers/player_model_mapper.dart';
import '/data/game/domain/entities/game/game_start_entity.dart';

extension GameStartModelMapper on GameStartModel {
  GameStartEntity mapToEntity() {
    return GameStartEntity(
      playerId: pid,
      roomId: rid,
      players: pl.map((model) => model.mapToEntity()).toList(),
      totalRounds: tr,
    );
  }
}
