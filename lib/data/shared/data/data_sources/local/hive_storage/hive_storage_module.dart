import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_key_value_storage.dart';
import '/data/shared/data/models/user_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';

const _kUsersListBoxName = 'users_list_box';
const _kStringsBoxName = 'strings_box';

@module
abstract class HiveStorageModule {
  //BASIC TYPES
  @preResolve
  Future<Box<String>> get stringModelBox {
    return Hive.openBox<String>(_kStringsBoxName);
  }

  @lazySingleton
  @Named('StringsStorage')
  KeyValueStorage<String> provideStringsStorage(
    Box<String> box,
  ) {
    return HiveKeyValueStorage<String>(box);
  }

  //CUSTOM TYPES
  @preResolve
  Future<Box<List<UserModel>>> get userModelBox {
    Hive.registerAdapter(UserModelAdapter());
    return Hive.openBox<List<UserModel>>(_kUsersListBoxName);
  }

  @lazySingleton
  @Named('UsersListStorage')
  KeyValueStorage<List<UserModel>> provideUsersStorage(
    Box<List<UserModel>> box,
  ) {
    return HiveKeyValueStorage<List<UserModel>>(box);
  }
}
