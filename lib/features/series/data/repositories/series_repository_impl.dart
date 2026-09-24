import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_credits.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';
import 'package:movie_dock_application/features/series/domain/repositories/series_repository.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';

class SeriesRepositoryImpl extends SeriesRepository {
  final NetworkInfo networkInfo;
  final SeriesRemoteDataSource remoteDataSource;
  SeriesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesAiringToday() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteSeries = await remoteDataSource.getSeriesAiringToday();
        await HiveService.cacheAiringTodaySeries(remoteSeries);
        return Right(remoteSeries);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localSeries = HiveService.getCachedAiringTodaySeries();
        return Right(localSeries);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesOnTheAir() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteSeries = await remoteDataSource.getSeriesOnTheAir();
        await HiveService.cacheOnTheAirSeries(remoteSeries);
        return Right(remoteSeries);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localSeries = HiveService.getCachedOnTheAirSeries();
        return Right(localSeries);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesPopular() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteSeries = await remoteDataSource.getSeriesPopular();
        await HiveService.cachePopularSeries(remoteSeries);
        return Right(remoteSeries);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localSeries = HiveService.getCachedPopularSeries();
        return Right(localSeries);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesTopRated() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteSeries = await remoteDataSource.getSeriesTopRated();
        await HiveService.cacheTopRatedSeries(remoteSeries);
        return Right(remoteSeries);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localSeries = HiveService.getCachedTopRatedSeries();
        return Right(localSeries);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvSeriesCredits>>> getSerieCredits({
    required SeriesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final credits = await remoteDataSource.getSeriecredits(params: params);
        await HiveService.cacheSerieCredits(credits);
        return Right(credits);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localCredits = HiveService.getCachedSerieCredits();
        return Right(localCredits);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, TvSeriesDetailsEntity>> getSerieDetails({
    required SeriesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final serieDetails = await remoteDataSource.getSerieDetails(
          params: params,
        );
        await HiveService.cacheSerieDetails(serieDetails);
        return Right(serieDetails);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localDetails = HiveService.getCachedSerieDetails(params.seriesId);
        if (localDetails != null) {
          return Right(localDetails);
        }
        return Left(Failure(errMessage: "No local data found"));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvSeriesRecommendation>>>
  getSerieRecommendations({required SeriesParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final series = await remoteDataSource.getSeriesRecommendations(
          params: params,
        );
        await HiveService.cacheSerieRecommendations(series);
        return Right(series);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localSeries = HiveService.getCachedSerieRecommendations();
        return Right(localSeries);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }
}
