import '/data/shared/data/models/user_model.dart';

abstract class RankingsStorageService {
  Future<List<UserModel>?> getCachedRankings();
  Future<void> cacheRankings(List<UserModel> rankings);
}
