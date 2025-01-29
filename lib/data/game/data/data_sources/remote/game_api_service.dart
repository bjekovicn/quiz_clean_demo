import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '/data/game/data/models/game_model.dart';

part 'game_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class GameApiService {
  @factoryMethod
  factory GameApiService(Dio dio) = _GameApiService;

  @POST('/game/friend-duel')
  Future<HttpResponse<GameModel>> createFriendsGameRoom();
}
