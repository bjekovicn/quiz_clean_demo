import '/data/auth/data/models/auth_model.dart';

abstract class AuthStorageService {
  Future<void> clearAuthData();
  Future<AuthModel?> getAuthData();
  Future<void> saveAuthData(AuthModel value);
}
