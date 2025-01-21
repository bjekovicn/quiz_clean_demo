import 'package:hive/hive.dart';

import '/data/shared/data/data_sources/local/key_value_storage.dart';

class HiveKeyValueStorage<T> implements KeyValueStorage<T> {
  final Box<T> _box;

  HiveKeyValueStorage(this._box);

  @override
  Future<void> put(String key, T value) async => await _box.put(key, value);

  @override
  Future<T?> get(String key) => Future.value(_box.get(key));

  @override
  Future<void> delete(String key) async => await _box.delete(key);

  @override
  Future<void> clear() async => await _box.clear();
}
