import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_local_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_remote_data_source.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';
import 'package:movie_dock_application/features/celebrities/domain/repositories/celebrities_repository.dart';

class CelebritiesRepositoryImpl extends CelebritiesRepository {
  final CelebritiesRemoteDataSource remoteDataSource;
  final CelebritiesLocalDataSource localDataSource;

  CelebritiesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<CelebritiesEntity>>> getPopularCelebrities({
    required CelebritiesParams params,
  }) async {
    try {
      final remoteCelebrities = await remoteDataSource.getPopularCelebrities(
        params,
      );
      await localDataSource.cachePopularCelebrities(remoteCelebrities);
      return Right(remoteCelebrities);
    } catch (e) {
      try {
        final localCelebrities = localDataSource.getCachedPopularCelebrities();
        if (localCelebrities.isNotEmpty) {
          return Right(localCelebrities);
        }
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      } catch (cacheError) {
        return Left(Failure(errMessage: cacheError.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CelebritiesEntity>>>
  getTrendingCelebrities() async {
    try {
      final remoteCelebrities = await remoteDataSource.getTrendingCelebrities();
      await localDataSource.cacheTrendingCelebrities(remoteCelebrities);
      return Right(remoteCelebrities);
    } catch (e) {
      try {
        final localCelebrities = localDataSource.getCachedTrendingCelebrities();
        if (localCelebrities.isNotEmpty) {
          return Right(localCelebrities);
        }
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      } catch (cacheError) {
        return Left(Failure(errMessage: cacheError.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CelebritieCombinedCredits>>>
  getCelebritieCombinedCredits({
    required CelebritieDetailsParams params,
  }) async {
    try {
      final remoteCelebrities =
          await remoteDataSource.GetCelebritieCombinedCredits(id: params.id);
      await localDataSource.cacheCelebritieCombinedCredits(remoteCelebrities);
      return Right(remoteCelebrities);
    } catch (e) {
      try {
        final localCelebrities = localDataSource
            .getCachedCelebritieCombinedCredits();
        if (localCelebrities.isNotEmpty) {
          return Right(localCelebrities);
        }
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      } catch (cacheError) {
        return Left(Failure(errMessage: cacheError.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CelebritieDetail>> getCelebritieDetails({
    required CelebritieDetailsParams params,
  }) async {
    try {
      final remoteCelebrities = await remoteDataSource.GetCelebritieDetails(
        id: params.id,
      );
      await localDataSource.cacheCelebritieDetails(remoteCelebrities);
      return Right(remoteCelebrities);
    } catch (e) {
      try {
        final localCelebrity = localDataSource.getCachedCelebritieDetails(
          params.id,
        );
        if (localCelebrity != null) {
          return Right(localCelebrity);
        }
        return Left(
          Failure(errMessage: "No Internet Connection & No Cached Data"),
        );
      } catch (cacheError) {
        return Left(Failure(errMessage: cacheError.toString()));
      }
    }
  }
}
