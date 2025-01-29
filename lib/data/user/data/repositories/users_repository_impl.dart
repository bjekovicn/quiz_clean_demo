import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/data/mappers/user_mappers.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/data/user/domain/repositories/users_repository.dart';
import '/data/user/data/data_sources/remote/user_api_service.dart';

@Named("UsersRepository")
@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  final UserApiService _apiService;

  UsersRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, void>> challengeUser(int userId, String roomId) async {
    try {
      await _apiService.challengeFriend(userId, {'roomId': roomId});
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final res = await _apiService.getCurrentUser();
      return Right(res.data.mapToEntity());
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }
}
