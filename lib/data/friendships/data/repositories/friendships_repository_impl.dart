import 'package:fpdart/fpdart.dart';
import '/core/error_handling/failure.dart';
import 'package:injectable/injectable.dart';

import '/data/shared/data/mappers/user_mappers.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/data/friendships/domain/repositories/friendships_repository.dart';
import '/data/friendships/data/data_sources/remote/friendships_api_service.dart';

@Named("FriendshipsRepository")
@LazySingleton(as: FriendshipsRepository)
class FriendshipsRepositoryImpl implements FriendshipsRepository {
  final FriendshipsApiService _friendshipsApiService;

  FriendshipsRepositoryImpl(this._friendshipsApiService);

  @override
  Future<Either<Failure, List<UserEntity>>> getFriends() async {
    try {
      final res = await _friendshipsApiService.getFriends();
      final userEntities = res.data.map((user) {
        return user.mapToEntity();
      }).toList();
      return Right(userEntities);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, void>> addFriend(int receiverId) async {
    try {
      await _friendshipsApiService.addFriend(receiverId);
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, void>> removeFriend(int receiverId) async {
    try {
      await _friendshipsApiService.removeFriend(receiverId);
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }
}
