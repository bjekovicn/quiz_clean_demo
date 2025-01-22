import 'package:equatable/equatable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/domain/entities/user_entity.dart';

abstract class RankingsState extends Equatable {
  final List<UserEntity>? users;
  final Failure? failure;

  const RankingsState({this.users, this.failure});

  @override
  List<Object?> get props => [users, failure];
}

class RankingsStateLoading extends RankingsState {
  const RankingsStateLoading();
}

class RankingsStateIdle extends RankingsState {
  const RankingsStateIdle();
}

class RankingsStateDone extends RankingsState {
  const RankingsStateDone(List<UserEntity> users) : super(users: users);
}

class RankingsStateError extends RankingsState {
  const RankingsStateError(Failure failure) : super(failure: failure);
}
