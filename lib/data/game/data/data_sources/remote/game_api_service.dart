import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/data/game/data/models/game_model.dart';

part 'game_api_service.g.dart';

@RestApi()
abstract class GameApiService {
  factory GameApiService(Dio dio) = _GameApiService;

  @POST('/game/friend-duel')
  Future<HttpResponse<GameModel>> createFriendsGameRoom();
}
