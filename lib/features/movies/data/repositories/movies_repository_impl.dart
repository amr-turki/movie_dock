import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/errors/expentions.dart';
import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';
import 'package:movie_dock_application/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final NetworkInfo networkInfo;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesNowPlaying({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesNowPlaying(params);
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesPopularList({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesPopularList(params);
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesTopRated({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesTopRated(params);
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesUpcomingList({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesUpcomingList(params);
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieCreditEntity>>> getMovieCredits({
    required MovieParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviecredits(
        params: params,
      );
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required MovieParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMovieDetails(
        params: params,
      );
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>>
  getMovieRecommendations({required MovieParams params}) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesRecommendations(
        params: params,
      );
      return Right(remoteMovies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.statusMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
