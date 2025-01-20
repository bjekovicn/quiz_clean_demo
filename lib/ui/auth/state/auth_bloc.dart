import 'dart:async';

import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/auth/domain/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(
    this._repository,
  ) : super(const RemoteAuthIdle()) {
    on<RegisterUserEvent>(_onRegisterUser);
    on<NextScreenEvent>(_onNextScreen);
    on<PreviousScreenEvent>(_onPreviousScreen);
    on<GetSignedInUserEvent>(_onGetSignedInUser);
  }

  Future<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const GoogleSignInLoading());

    final response = await _repository.authGoogle(event.idToken);

    response.fold(
      (failure) => emit(RemoteAuthError(failure)),
      (authEntity) async {
        await _repository.storeAuthData(authEntity);
        emit(GoogleSignInDone(authEntity));
      },
    );
  }

  void _onNextScreen(
    NextScreenEvent event,
    Emitter<AuthState> emit,
  ) {
    if (state.screenState != IntroScreenState.languageSelection) return;
    emit(const ScreenChanged(IntroScreenState.socialLogIn));
  }

  void _onPreviousScreen(
    PreviousScreenEvent event,
    Emitter<AuthState> emit,
  ) {
    if (state.screenState != IntroScreenState.socialLogIn) return;
    emit(const ScreenChanged(IntroScreenState.languageSelection));
  }

  Future<void> _onGetSignedInUser(
    GetSignedInUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const GetAuthDataLoading());
    await Future.delayed(const Duration(seconds: 2));
    final authData = _repository.getStoredAuthData();
    emit(GetAuthDataDone(authData));
  }
}
