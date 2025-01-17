import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '/core/error_handling/failure.dart';
import '/data/shared/data/mappers/user_mappers.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/data/rankings/domain/repositories/rankings_repository.dart';
import '/data/rankings/data/data_sources/local/rankings_storage_service.dart';

@Named("CachedRankingsRepository")
@LazySingleton(as: RankingsRepository)
class CachedRankingsRepositoryImpl implements RankingsRepository {
  final RankingsStorageService _storageService;
  final RankingsRepository _rankingsRepository;

  CachedRankingsRepositoryImpl(
    this._storageService,
    @Named('RankingsRepository') this._rankingsRepository,
  );

  @override
  Future<Either<Failure, List<UserEntity>>> getAllTimeRankedUsers() async {
    final apiResult = await _rankingsRepository.getAllTimeRankedUsers();
    return apiResult.fold(
      (Failure failure) {
        final cachedRankings = _storageService.getCachedRankings();
        if (cachedRankings == null) return Left(failure);

        final userEntityList = cachedRankings.map((userModel) {
          return userModel.mapToEntity();
        }).toList();
        return Right(userEntityList);
      },
      (List<UserEntity> data) async {
        final userModelsList = data.map((userEntity) {
          return userEntity.mapToModel();
        }).toList();
        await _storageService.cacheRankings(userModelsList);
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getMonthlyRankedUsers() async {
    final apiResult = await _rankingsRepository.getMonthlyRankedUsers();
    return apiResult.fold(
      (Failure failure) {
        final cachedRankings = _storageService.getCachedRankings();
        if (cachedRankings == null) return Left(failure);

        final userEntityList = cachedRankings.map((userModel) {
          return userModel.mapToEntity();
        }).toList();
        return Right(userEntityList);
      },
      (List<UserEntity> data) async {
        final userModelsList = data.map((userEntity) {
          return userEntity.mapToModel();
        }).toList();
        await _storageService.cacheRankings(userModelsList);
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getWeeklyRankedUsers() async {
    final apiResult = await _rankingsRepository.getWeeklyRankedUsers();
    return apiResult.fold(
      (Failure failure) {
        final cachedRankings = _storageService.getCachedRankings();
        if (cachedRankings == null) return Left(failure);

        final userEntityList = cachedRankings.map((userModel) {
          return userModel.mapToEntity();
        }).toList();
        return Right(userEntityList);
      },
      (List<UserEntity> data) async {
        final userModelsList = data.map((userEntity) {
          return userEntity.mapToModel();
        }).toList();
        await _storageService.cacheRankings(userModelsList);
        return Right(data);
      },
    );
  }
}
