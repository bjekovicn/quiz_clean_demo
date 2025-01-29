import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/data/mappers/user_mappers.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/data/user/domain/repositories/users_repository.dart';
import '/data/user/data/data_sources/local/users_storage_service.dart';

@Named("CachedUsersRepository")
@LazySingleton(as: UsersRepository)
class CachedUsersRepositoryImpl implements UsersRepository {
  final UsersRepository _repository;
  final UsersStorageService _storage;

  CachedUsersRepositoryImpl(
    @Named("UsersRepository") this._repository,
    this._storage,
  );

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    final apiResult = await _repository.getCurrentUser();
    return apiResult.fold(
      (Failure failure) async {
        final cachedUser = await _storage.getCachedCurrentUser();
        if (cachedUser == null) return Left(failure);

        return Right(cachedUser.mapToEntity());
      },
      (UserEntity userEntity) async {
        await _storage.cacheCurrentUser(
          userEntity.mapToModel(),
        );
        return Right(userEntity);
      },
    );
  }

  @override
  Future<Either<Failure, void>> challengeUser(int userId, String roomId) {
    return _repository.challengeUser(userId, roomId);
  }
}
