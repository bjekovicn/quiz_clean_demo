import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/domain/entities/user_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, void>> challengeUser(int userId, String roomId);
}
