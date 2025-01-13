import '/data/auth/data/models/auth_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';
import '/data/auth/data/data_sources/local/auth_storage_service.dart';

class AuthStorageServiceImpl implements AuthStorageService {
  final KeyValueStorage _storage;
  final String accessTokenKey;
  final String refreshTokenKey;

  AuthStorageServiceImpl(
    this._storage, {
    required this.accessTokenKey,
    required this.refreshTokenKey,
  });

  @override
  Future<void> clearAuthData() async {
    await _storage.delete(accessTokenKey);
    await _storage.delete(refreshTokenKey);
  }

  @override
  AuthModel? getAuthData() {
    final accessToken = _storage.get(accessTokenKey);
    final refreshToken = _storage.get(refreshTokenKey);
    if (accessToken == null || refreshToken == null) return null;

    return AuthModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  Future<void> saveAuthData(AuthModel value) async {
    await _storage.put(accessTokenKey, value.accessToken);
    await _storage.put(refreshTokenKey, value.refreshToken);
  }
}
