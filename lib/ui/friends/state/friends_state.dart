import 'package:equatable/equatable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/domain/entities/user_entity.dart';

abstract class FriendsState extends Equatable {
  final List<UserEntity>? users;
  final Failure? failure;

  const FriendsState({this.users, this.failure});

  @override
  List<Object?> get props => [users, failure];
}

class FriendshipsStateLoading extends FriendsState {
  const FriendshipsStateLoading();
}

class FriendshipsStateIdle extends FriendsState {
  const FriendshipsStateIdle();
}

class FriendshipsStateDone extends FriendsState {
  const FriendshipsStateDone(List<UserEntity> users) : super(users: users);
}

class FriendshipsStateError extends FriendsState {
  const FriendshipsStateError(Failure failure) : super(failure: failure);
}

class FriendshipsStateActionsIdle extends FriendsState {
  const FriendshipsStateActionsIdle();
}
