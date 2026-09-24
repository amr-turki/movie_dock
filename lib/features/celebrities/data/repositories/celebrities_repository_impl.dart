import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_local_data_source.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/celebrities_entitiy.dart';
import '../../domain/repositories/celebrities_repository.dart';
import '../datasources/celebrities_remote_data_source.dart';

class CelebritiesRepositoryImpl extends CelebritiesRepository {
  final NetworkInfo networkInfo;
  final CelebritiesRemoteDataSource remoteDataSource;
  final CelebritiesLocalDataSource localDataSource;
  CelebritiesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<CelebritiesEntity>>> getPopularCelebrities({
    required CelebritiesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource.getPopularCelebrities(
          params,
        );
        await localDataSource.cachePopularCelebrities(remoteCelebrities);
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      final localCelebrities = localDataSource.getCachedPopularCelebrities();
      if (localCelebrities.isNotEmpty) {
        return Right(localCelebrities);
      } else {
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      }
    }
  }

  Future<Either<Failure, List<CelebritiesEntity>>>
  getTrendingCelebrities() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource
            .getTrendingCelebrities();
        await localDataSource.cacheTrendingCelebrities(remoteCelebrities);
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      final localCelebrities = localDataSource.getCachedTrendingCelebrities();
      if (localCelebrities.isNotEmpty) {
        return Right(localCelebrities);
      } else {
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<CelebritieCombinedCredits>>>
  getCelebritieCombinedCredits({
    required CelebritieDetailsParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities =
            await remoteDataSource.GetCelebritieCombinedCredits(id: params.id);
        await localDataSource.cacheCelebritieCombinedCredits(remoteCelebrities);
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      final localCelebrities = localDataSource
          .getCachedCelebritieCombinedCredits();
      if (localCelebrities.isNotEmpty) {
        return Right(localCelebrities);
      } else {
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, CelebritieDetail>> getCelebritieDetails({
    required CelebritieDetailsParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource.GetCelebritieDetails(
          id: params.id,
        );
        await localDataSource.cacheCelebritieDetails(remoteCelebrities);
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      final localCelebrity = localDataSource.getCachedCelebritieDetails(
        params.id,
      );
      if (localCelebrity != null) {
        return Right(localCelebrity);
      } else {
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      }
    }
  }
}
