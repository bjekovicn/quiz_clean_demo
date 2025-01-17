import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioNetworkModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: "https://api.example.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
