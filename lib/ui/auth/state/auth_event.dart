import 'auth_state.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class RegisterUserEvent extends AuthEvent {
  final String idToken;
  const RegisterUserEvent(this.idToken);
}

class NextScreenEvent extends AuthEvent {
  final IntroScreenState state;
  const NextScreenEvent(this.state);
}

class PreviousScreenEvent extends AuthEvent {
  final IntroScreenState state;
  const PreviousScreenEvent(this.state);
}

class GetSignedInUserEvent extends AuthEvent {
  GetSignedInUserEvent();
}
