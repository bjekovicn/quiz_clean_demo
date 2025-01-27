import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_key_value_storage.dart';
import '/data/shared/data/models/user_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';

const _kStringsBoxName = 'strings_box';

const _kUsersBoxName = 'users_box';
const _kUsersListBoxName = 'users_list_box';

@module
abstract class HiveStorageModule {
  //OPEN BOXES
  @preResolve
  Future<Box<String>> get stringModelBox async =>
      await Hive.openBox<String>(_kStringsBoxName);

  @preResolve
  Future<Box<UserModel>> get userModelBox async =>
      Hive.openBox<UserModel>(_kUsersBoxName);

  @preResolve
  Future<Box<List<UserModel>>> get usersListModelBox async =>
      await Hive.openBox<List<UserModel>>(_kUsersListBoxName);

  //PROVIDE BOXES
  @lazySingleton
  @Named('StringsStorage')
  KeyValueStorage<String> provideStringsStorage(
    Box<String> box,
  ) {
    return HiveKeyValueStorage<String>(box);
  }

  @lazySingleton
  @Named('UsersListStorage')
  KeyValueStorage<List<UserModel>> provideUsersListStorage(
    Box<List<UserModel>> box,
  ) {
    return HiveKeyValueStorage<List<UserModel>>(box);
  }

  @lazySingleton
  @Named('UsersStorage')
  KeyValueStorage<UserModel> provideUsersStorage(
    Box<UserModel> box,
  ) {
    return HiveKeyValueStorage<UserModel>(box);
  }
}
