import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/data/mappers/user_mappers.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/data/friendships/domain/repositories/friendships_repository.dart';
import '/data/friendships/data/data_sources/local/friendships_storage_service.dart';

@Named("CachedFriendshipsRepository")
@LazySingleton(as: FriendshipsRepository)
class CachedFriendshipsRepositoryImpl implements FriendshipsRepository {
  final FriendshipsStorageService _storageService;
  final FriendshipsRepository _friendshipsRepository;

  CachedFriendshipsRepositoryImpl(
    this._storageService,
    @Named('FriendshipsRepository') this._friendshipsRepository,
  );

  @override
  Future<Either<Failure, List<UserEntity>>> getFriends() async {
    final apiResult = await _friendshipsRepository.getFriends();
    return apiResult.fold(
      (Failure failure) async {
        final cachedRankings = await _storageService.getCachedFriends();
        if (cachedRankings == null) return Left(failure);

        final userEntityList = cachedRankings.map((userModel) {
          return userModel.mapToEntity();
        }).toList();
        return Right(userEntityList);
      },
      (List<UserEntity> data) async {
        final userModelsList = data.map((userEntity) {
          return userEntity.mapToModel();
        }).toList();
        await _storageService.cacheFriends(userModelsList);
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, void>> addFriend(int receiverId) {
    return _friendshipsRepository.addFriend(receiverId);
  }

  @override
  Future<Either<Failure, void>> removeFriend(int receiverId) {
    return _friendshipsRepository.removeFriend(receiverId);
  }
}
