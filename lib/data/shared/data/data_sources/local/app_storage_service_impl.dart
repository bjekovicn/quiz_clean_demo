import 'package:injectable/injectable.dart';

import 'app_storage_service.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';

const _kLocaleKey = 'locale';

@LazySingleton(as: AppStorageService)
class AppStorageServiceImpl implements AppStorageService {
  final KeyValueStorage<String> _storage;

  AppStorageServiceImpl(
    @Named('StringsStorage') this._storage,
  );

  //

  @override
  Future<void> setLocale(String locale) async {
    await _storage.put(_kLocaleKey, locale);
  }

  @override
  Future<String?> getLocale() async => await _storage.get(_kLocaleKey);

  @override
  Future<void> clearLocale() async => await _storage.delete(_kLocaleKey);

  //
}
