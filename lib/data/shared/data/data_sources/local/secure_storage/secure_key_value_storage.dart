// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '/data/shared/data/data_sources/local/key_value_storage.dart';

// class SecureKeyValueStorage<T> implements KeyValueStorage<T> {
//   final FlutterSecureStorage _secureStorage;

//   SecureKeyValueStorage(this._secureStorage);

//   @override
//   Future<void> put(String key, T value) async {
//     await _secureStorage.write(key: key, value: value.toString());
//   }

//   @override
//   T? get(String key) {
//     final value = _secureStorage.read(key: key);
//     return value as T?;
//   }

//   @override
//   Future<void> delete(String key) async {
//     await _secureStorage.delete(key: key);
//   }

//   @override
//   Future<void> clear() async {
//     await _secureStorage.deleteAll();
//   }
// }
