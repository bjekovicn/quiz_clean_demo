import '/data/auth/data/models/auth_model.dart';
import '/data/auth/domain/entities/auth_entity.dart';

extension AuthModelMapper on AuthModel {
  AuthEntity mapToEntity() {
    return AuthEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}

extension AuthEntityMapper on AuthEntity {
  AuthModel mapToModel() {
    return AuthModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
