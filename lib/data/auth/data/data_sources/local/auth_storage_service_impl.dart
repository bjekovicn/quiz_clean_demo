import 'package:injectable/injectable.dart';

import '/data/auth/data/models/auth_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';
import '/data/auth/data/data_sources/local/auth_storage_service.dart';

const _kAccessTokenKey = 'access_token';
const _kRefreshTokenKey = 'refresh_token';

@LazySingleton(as: AuthStorageService)
class AuthStorageServiceImpl implements AuthStorageService {
  final KeyValueStorage<String> _storage;

  AuthStorageServiceImpl(
    @Named('StringStorageSecure') this._storage,
  );

  @override
  Future<void> clearAuthData() async {
    await Future.wait([
      _storage.delete(_kAccessTokenKey),
      _storage.delete(_kRefreshTokenKey),
    ]);
  }

  @override
  AuthModel? getAuthData() {
    final accessToken = _storage.get(_kAccessTokenKey);
    final refreshToken = _storage.get(_kRefreshTokenKey);
    if (accessToken == null || refreshToken == null) return null;

    return AuthModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  Future<void> saveAuthData(AuthModel value) async {
    await _storage.put(_kAccessTokenKey, value.accessToken);
    await _storage.put(_kRefreshTokenKey, value.refreshToken);
  }
}
