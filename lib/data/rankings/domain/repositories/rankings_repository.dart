import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/domain/entities/user_entity.dart';

abstract class RankingsRepository {
  Future<Either<Failure, List<UserEntity>>> getAllTimeRankedUsers();
  Future<Either<Failure, List<UserEntity>>> getWeeklyRankedUsers();
  Future<Either<Failure, List<UserEntity>>> getMonthlyRankedUsers();
}
