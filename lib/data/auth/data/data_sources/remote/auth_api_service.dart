import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '/data/auth/data/models/auth_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth/google')
  Future<HttpResponse<AuthModel>> authGoogle(
    @Header("Authorization") String token,
  );

  @POST('/auth/refresh')
  Future<HttpResponse<AuthModel>> refresh(
    @Body() Map<String, String> body,
  );
}
