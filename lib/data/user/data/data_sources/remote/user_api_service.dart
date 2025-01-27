import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '/data/shared/data/models/user_model.dart';

part 'user_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class UserApiService {
  @factoryMethod
  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/user/me')
  Future<HttpResponse<UserModel>> getCurrentUser();

  @POST('/user/{userId}/challenge')
  Future<HttpResponse<String>> challengeFriend(
    @Path("userId") int userId,
    @Body() Map<String, dynamic> body,
  );
}
