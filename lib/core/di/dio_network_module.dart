import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '/main.dart';
import '/injection.dart';
import '/ui/auth/state/auth_bloc.dart';
import '/core/di/app_config_module.dart';
import '/ui/auth/screens/landing_screen.dart';
import '/data/auth/data/data_sources/remote/auth_api_service.dart';
import '/data/auth/data/data_sources/local/auth_storage_service.dart';
import '/data/shared/data/data_sources/local/app_storage_service.dart';

@module
abstract class DioNetworkModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: getIt<AppConfig>().baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}

// HTTP INTERCEPTORS
class DioHttpInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //ACCESS TOKEN
    final authStorage = getIt<AuthStorageService>();
    final authData = await authStorage.getAuthData();
    if (authData != null) {
      options.headers.addAll(
        {"Authorization": "Bearer ${authData.accessToken}"},
      );
    }

    //ACCEPT LANGUAGE
    final appStorage = getIt<AppStorageService>();
    final language = appStorage.getLocale();
    options.headers.addAll({"Accept-Language": language});

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) return super.onError(err, handler);

    final authStorage = getIt<AuthStorageService>();
    final authData = await authStorage.getAuthData();
    if (authData == null) return super.onError(err, handler);

    //REFRESH TOKEN LOGIC
    final authApiService = getIt<AuthApiService>();
    final dioClient = getIt<Dio>();

    try {
      final accessToken = authData.accessToken;
      final refreshToken = authData.refreshToken;
      //
      final response = await authApiService.refresh({
        "refreshToken": refreshToken,
      });

      await authStorage.saveAuthData(response.data);
      err.requestOptions.headers["Authorization"] = "Bearer $accessToken";

      final newResponse = await dioClient.fetch(err.requestOptions);
      return handler.resolve(newResponse);
    } catch (e) {
      log('Token refresh failed! You need to Log In again!');
      await authStorage.clearAuthData();
      await navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthBloc>(),
            child: const LandingScreen(),
          ),
        ),
      );
    }

    super.onError(err, handler);
  }
}

// LOGGING INTERCEPTORS
class DioLoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      "\x1B[33m-> [REQ ${options.method.toUpperCase()}]\x1B[0m -> ${options.path}",
    );

    // if (options.headers.isNotEmpty) {
    //   log("-> [HEADERS]");
    //   options.headers.forEach((k, v) => log('   $k: $v'));
    // }

    if (options.queryParameters.isNotEmpty) {
      log("\x1B[33m-> [REQ QUERY]");
      options.queryParameters.forEach((k, v) => log('   $k: $v'));
    }

    if (options.data != null) {
      log("\x1B[33m-> [REQ BODY]");
      log("   ${options.data}");
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("\x1B[31m-> [REQ ERROR]  ${err.response != null ? err.response!.data : err}");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('\x1B[32m-> [RES ${response.statusCode}]\x1B[0m -> ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }
}
