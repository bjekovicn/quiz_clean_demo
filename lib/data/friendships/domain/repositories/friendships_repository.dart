import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/domain/entities/user_entity.dart';

abstract class FriendshipsRepository {
  Future<Either<Failure, List<UserEntity>>> getFriends();
  Future<Either<Failure, void>> addFriend(int receiverId);
  Future<Either<Failure, void>> removeFriend(int receiverId);
}
