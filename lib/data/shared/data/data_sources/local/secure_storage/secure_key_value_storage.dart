import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/data/shared/data/data_sources/local/key_value_storage.dart';

class SecureKeyValueStorage implements KeyValueStorage<String> {
  final FlutterSecureStorage _storage;

  SecureKeyValueStorage(this._storage);

  @override
  Future<void> put(String key, String value) async =>
      await _storage.write(key: key, value: value);

  @override
  Future<String?> get(String key) async => await _storage.read(key: key);

  @override
  Future<void> delete(String key) async => await _storage.delete(key: key);

  @override
  Future<void> clear() async => await _storage.deleteAll();
}
