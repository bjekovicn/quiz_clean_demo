import '/data/shared/data/models/user_model.dart';
import '/data/shared/domain/entities/user_entity.dart';

extension UserModelMapper on UserModel {
  UserEntity mapToEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      googlePhoto: googlePhoto,
      coins: coins,
      tokens: tokens,
      gamesWon: gamesWon,
      gamesLost: gamesLost,
    );
  }
}

extension UserEntityMapper on UserEntity {
  UserModel mapToModel() {
    return UserModel(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      googlePhoto: googlePhoto,
      coins: coins,
      tokens: tokens,
      gamesWon: gamesWon,
      gamesLost: gamesLost,
    );
  }
}
