import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/core/errors/expentions.dart';
import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';
import 'package:movie_dock_application/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final NetworkInfo networkInfo;
  final MoviesLocalDataSource localDataSource;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesNowPlaying({
    required MoviesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getMoviesNowPlaying(params);
        await localDataSource.cacheNowPlayingMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = localDataSource.getCachedNowPlayingMovies();
        return Right(localMovies);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesPopularList({
    required MoviesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getMoviesPopularList(
          params,
        );
        await localDataSource.cachePopularMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = localDataSource.getCachedPopularMovies();
        return Right(localMovies);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesTopRated({
    required MoviesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getMoviesTopRated(params);
        await localDataSource.cacheTopRatedMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = localDataSource.getCachedTopRatedMovies();
        return Right(localMovies);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesUpcomingList({
    required MoviesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getMoviesUpcomingList(
          params,
        );
        await localDataSource.cacheUpcomingMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = localDataSource.getCachedUpcomingMovies();
        return Right(localMovies);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieCreditEntity>>> getMovieCredits({
    required MovieParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCredits = await remoteDataSource.getMoviecredits(
          params: params,
        );
        await localDataSource.cacheMovieCredits(remoteCredits);
        return Right(remoteCredits);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localCredits = localDataSource.getCachedMovieCredits();
        return Right(localCredits);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required MovieParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteDetails = await remoteDataSource.getMovieDetails(
          params: params,
        );
        await localDataSource.cacheMovieDetails(remoteDetails);
        return Right(remoteDetails);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localDetails = localDataSource.getCachedMovieDetails(
          params.movieId,
        );
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
  Future<Either<Failure, List<MovieRecommendationEntity>>>
  getMovieRecommendations({required MovieParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteRecommendations = await remoteDataSource
            .getMoviesRecommendations(params: params);
        await localDataSource.cacheMovieRecommendations(
          params.movieId,
          remoteRecommendations,
        );
        return Right(remoteRecommendations);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localRecommendations = localDataSource
            .getCachedMovieRecommendations();
        return Right(localRecommendations);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }
}
