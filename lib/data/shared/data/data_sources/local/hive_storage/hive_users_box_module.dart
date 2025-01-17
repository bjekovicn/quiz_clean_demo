import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_key_value_storage.dart';
import '/data/shared/data/models/user_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';

const _kUsersBoxName = 'users_box';

@module
abstract class HiveUsersBoxModule {
  @preResolve
  Future<Box<List<UserModel>>> get userModelBox {
    Hive.registerAdapter(UserModelAdapter());
    return Hive.openBox<List<UserModel>>(_kUsersBoxName);
  }

  @lazySingleton
  KeyValueStorage<List<UserModel>> provideUsersStorage(
    Box<List<UserModel>> box,
  ) {
    return HiveKeyValueStorage<List<UserModel>>(box);
  }
}
