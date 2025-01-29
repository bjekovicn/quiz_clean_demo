import '/data/game/data/models/player_model.dart';
import '/data/game/domain/entities/player_entity.dart';

extension PlayerModelMapper on PlayerModel {
  PlayerEntity mapToEntity() {
    return PlayerEntity(
      playerId: id,
      playerColor: pc,
      playerName: pn,
      playerProfilePicture: pp,
    );
  }
}

extension PlayerEntityMapper on PlayerEntity {
  PlayerModel mapToModel() {
    return PlayerModel(
      id: playerId,
      pc: playerColor,
      pn: playerName,
      pp: playerProfilePicture,
    );
  }
}
