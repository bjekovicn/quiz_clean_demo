import 'package:injectable/injectable.dart';

import '/data/shared/data/models/user_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';
import '/data/user/data/data_sources/local/users_storage_service.dart';

const _kUsersBoxKey = 'user_box';

@LazySingleton(as: UsersStorageService)
class UsersStorageServiceImpl implements UsersStorageService {
  final KeyValueStorage<UserModel> _storage;

  UsersStorageServiceImpl(
    @Named("UsersStorage") this._storage,
  );

  @override
  Future<void> cacheCurrentUser(UserModel value) async {
    await _storage.put(_kUsersBoxKey, value);
  }

  @override
  Future<UserModel?> getCachedCurrentUser() async {
    return await _storage.get(_kUsersBoxKey);
  }
}
