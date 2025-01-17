import 'package:injectable/injectable.dart';

import '/data/shared/data/models/user_model.dart';
import '/data/shared/data/data_sources/local/key_value_storage.dart';
import '/data/friendships/data/data_sources/local/friendships_storage_service.dart';

const _kUsersBoxFriendsKey = 'users_box_friends';

@LazySingleton(as: FriendshipsStorageService)
class FriendshipsStorageServiceImpl implements FriendshipsStorageService {
  final KeyValueStorage<List<UserModel>> _storage;

  FriendshipsStorageServiceImpl(@Named('UsersListStorage') this._storage);

  @override
  Future<void> cacheFriends(List<UserModel> friends) async {
    await _storage.put(_kUsersBoxFriendsKey, friends);
  }

  @override
  List<UserModel>? getCachedFriends() {
    return _storage.get(_kUsersBoxFriendsKey);
  }
}
