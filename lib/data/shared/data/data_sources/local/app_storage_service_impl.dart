import 'app_storage_service.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';

const _kLocaleKey = 'locale';
const _kAccessToke = 'access_token';

class AppStorageServiceImpl implements AppStorageService {
  final KeyValueStorage<String> _storage;

  AppStorageServiceImpl(this._storage);

  //

  @override
  Future<void> setLocale(String locale) async {
    await _storage.put(_kLocaleKey, locale);
  }

  @override
  String? getLocale() => _storage.get(_kLocaleKey);

  @override
  Future<void> clearLocale() async => await _storage.delete(_kLocaleKey);

  //

  @override
  String? getAccessToken() => _storage.get(_kAccessToke);

  @override
  Future<void> setAccessToken(String locale) async {
    await _storage.put(_kAccessToke, locale);
  }
}
