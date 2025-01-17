import '/data/shared/data/models/user_model.dart';

abstract class FriendshipsStorageService {
  List<UserModel>? getCachedFriends();
  Future<void> cacheFriends(List<UserModel> friends);
}
