import '/data/shared/data/models/user_model.dart';

abstract class FriendshipsStorageService {
  Future<List<UserModel>?> getCachedFriends();
  Future<void> cacheFriends(List<UserModel> friends);
}
