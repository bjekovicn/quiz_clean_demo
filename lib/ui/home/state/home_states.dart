import 'package:equatable/equatable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/domain/entities/user_entity.dart';

abstract class HomeState extends Equatable {
  final UserEntity? user;
  const HomeState(this.user);
  @override
  List<Object?> get props => [user];
}

class HomeStateIdle extends HomeState {
  const HomeStateIdle() : super(null);
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading() : super(null);
}

class HomeStateDone extends HomeState {
  const HomeStateDone(UserEntity super.user);

  @override
  List<Object?> get props => [user];
}

class HomeStateError extends HomeState {
  final Failure failure;

  const HomeStateError(this.failure) : super(null);

  @override
  List<Object?> get props => [failure];
}
