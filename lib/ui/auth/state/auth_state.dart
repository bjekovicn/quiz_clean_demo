import 'package:equatable/equatable.dart';

import '/core/error_handling/failure.dart';
import '/data/auth/domain/entities/auth_entity.dart';

enum IntroScreenState {
  languageSelection,
  socialLogIn,
}

abstract class AuthState extends Equatable {
  final AuthEntity? authEntity;
  final Failure? failure;
  final IntroScreenState screenState;

  const AuthState({
    this.authEntity,
    this.failure,
    this.screenState = IntroScreenState.languageSelection,
  });

  @override
  List<Object?> get props => [screenState, authEntity, failure];
}

class GoogleSignInLoading extends AuthState {
  const GoogleSignInLoading();
}

class RemoteAuthIdle extends AuthState {
  const RemoteAuthIdle();
}

class GoogleSignInDone extends AuthState {
  const GoogleSignInDone(AuthEntity authEntity) : super(authEntity: authEntity);
}

class RemoteAuthError extends AuthState {
  const RemoteAuthError(Failure failure) : super(failure: failure);
}

class ScreenChanged extends AuthState {
  const ScreenChanged(IntroScreenState screenState)
      : super(screenState: screenState);
}

class GetAuthDataDone extends AuthState {
  const GetAuthDataDone(AuthEntity? authEntity) : super(authEntity: authEntity);
}

class GetAuthDataLoading extends AuthState {
  const GetAuthDataLoading();
}
