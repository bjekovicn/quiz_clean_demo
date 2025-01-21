import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> authGoogle(String googleToken);

  Future<AuthEntity?> getStoredAuthData();
  Future<void> storeAuthData(AuthEntity value);
  Future<void> clearStoredAuthData();
}
