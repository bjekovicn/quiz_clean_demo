class AuthEntity {
  final String refreshToken;
  final String accessToken;

  AuthEntity({
    required this.accessToken,
    required this.refreshToken,
  });
}
