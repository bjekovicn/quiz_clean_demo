import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '/core/error_handling/failure.dart';
import '/data/auth/data/mappers/auth_mappers.dart';
import '/data/auth/domain/entities/auth_entity.dart';
import '/data/auth/domain/repositories/auth_repository.dart';
import '/data/auth/data/data_sources/remote/auth_api_service.dart';
import '/data/auth/data/data_sources/local/auth_storage_service.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;
  final AuthStorageService _authStorageService;

  AuthRepositoryImpl(
    this._authApiService,
    this._authStorageService,
  );

  @override
  Future<Either<Failure, AuthEntity>> authGoogle(String googleToken) async {
    try {
      final res = await _authApiService.authGoogle('Bearer $googleToken');

      await _authStorageService.saveAuthData(res.data);

      return Right(res.data.mapToEntity());
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, void>> clearStoredAuthData() async {
    try {
      await _authStorageService.clearAuthData();
      return Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, AuthEntity?>> getStoredAuthData() async {
    try {
      final authModel = await _authStorageService.getAuthData();
      if (authModel == null) return Right(null);

      return Right(authModel.mapToEntity());
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, void>> storeAuthData(AuthEntity value) async {
    try {
      await _authStorageService.saveAuthData(value.mapToModel());
      return Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }
}
