import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_local_data_source.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_credits.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';
import 'package:movie_dock_application/features/series/domain/repositories/series_repository.dart';

class SeriesRepositoryImpl extends SeriesRepository {
  final SeriesRemoteDataSource remoteDataSource;
  final SeriesLocalDataSource localDataSource;

  SeriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesAiringToday() async {
    try {
      final remoteSeries = await remoteDataSource.getSeriesAiringToday();
      await HiveService.cacheAiringTodaySeries(remoteSeries);
      return Right(remoteSeries);
    } catch (e) {
      try {
        final localSeries = localDataSource.getCachedAiringTodaySeries();
        if (localSeries.isNotEmpty) {
          return Right(localSeries);
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
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesOnTheAir() async {
    try {
      final remoteSeries = await remoteDataSource.getSeriesOnTheAir();
      await localDataSource.cacheOnTheAirSeries(remoteSeries);
      return Right(remoteSeries);
    } catch (e) {
      try {
        final localSeries = localDataSource.getCachedOnTheAirSeries();
        if (localSeries.isNotEmpty) {
          return Right(localSeries);
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
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesPopular() async {
    try {
      final remoteSeries = await remoteDataSource.getSeriesPopular();
      await localDataSource.cachePopularSeries(remoteSeries);
      return Right(remoteSeries);
    } catch (e) {
      try {
        final localSeries = localDataSource.getCachedPopularSeries();
        if (localSeries.isNotEmpty) {
          return Right(localSeries);
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
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesTopRated() async {
    try {
      final remoteSeries = await remoteDataSource.getSeriesTopRated();
      await localDataSource.cacheTopRatedSeries(remoteSeries);
      return Right(remoteSeries);
    } catch (e) {
      try {
        final localSeries = localDataSource.getCachedTopRatedSeries();
        if (localSeries.isNotEmpty) {
          return Right(localSeries);
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
  Future<Either<Failure, List<TvSeriesCredits>>> getSerieCredits({
    required SeriesParams params,
  }) async {
    try {
      final credits = await remoteDataSource.getSeriecredits(params: params);
      await localDataSource.cacheSerieCredits(credits);
      return Right(credits);
    } catch (e) {
      try {
        final localCredits = localDataSource.getCachedSerieCredits();
        if (localCredits.isNotEmpty) {
          return Right(localCredits);
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
  Future<Either<Failure, TvSeriesDetailsEntity>> getSerieDetails({
    required SeriesParams params,
  }) async {
    try {
      final serieDetails = await remoteDataSource.getSerieDetails(
        params: params,
      );
      await localDataSource.cacheSerieDetails(serieDetails);
      return Right(serieDetails);
    } catch (e) {
      try {
        final localDetails = localDataSource.getCachedSerieDetails(
          params.seriesId,
        );
        if (localDetails != null) {
          return Right(localDetails);
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
  Future<Either<Failure, List<TvSeriesRecommendation>>>
  getSerieRecommendations({required SeriesParams params}) async {
    try {
      final series = await remoteDataSource.getSeriesRecommendations(
        params: params,
      );
      await localDataSource.cacheSerieRecommendations(series);
      return Right(series);
    } catch (e) {
      try {
        final localSeries = localDataSource.getCachedSerieRecommendations();
        if (localSeries.isNotEmpty) {
          return Right(localSeries);
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
