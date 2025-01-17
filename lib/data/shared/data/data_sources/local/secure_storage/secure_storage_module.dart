import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/data/shared/data/data_sources/local/key_value_storage.dart';
import '/data/shared/data/data_sources/local/secure_storage/secure_key_value_storage.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => FlutterSecureStorage();

  @lazySingleton
  @Named('StringStorageSecure')
  KeyValueStorage<String> provideSecureStorage(
    FlutterSecureStorage storage,
  ) {
    return SecureKeyValueStorage<String>(storage);
  }
}
