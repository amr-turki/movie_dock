import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
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
        final remoteMovies = await remoteDataSource.getSeriesAiringToday();
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesOnTheAir() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getSeriesOnTheAir();
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesPopular() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getSeriesPopular();
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesTopRated() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getSeriesTopRated();
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }
}
