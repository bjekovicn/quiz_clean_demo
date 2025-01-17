import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

import '/data/shared/data/models/user_model.dart';

part 'friendships_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class FriendshipsApiService {
  @factoryMethod
  factory FriendshipsApiService(Dio dio) = _FriendshipsApiService;

  @GET('/friendships/accepted')
  Future<HttpResponse<List<UserModel>>> getFriends();

  @POST('/friendships/{id}/add')
  Future<HttpResponse<void>> addFriend(@Path("id") int receiverId);

  @DELETE('/friendships/{id}/remove')
  Future<HttpResponse<void>> removeFriend(@Path("id") int receiverId);
}
