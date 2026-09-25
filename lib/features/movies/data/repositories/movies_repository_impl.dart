import 'package:dartz/dartz.dart';
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
  final MoviesLocalDataSource localDataSource;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesNowPlaying({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesNowPlaying(params);
      await localDataSource.cacheNowPlayingMovies(remoteMovies);
      return Right(remoteMovies);
    } catch (e) {
      try {
        final localMovies = localDataSource.getCachedNowPlayingMovies();
        if (localMovies.isNotEmpty) {
          return Right(localMovies);
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
  Future<Either<Failure, List<MoviesEntity>>> getMoviesPopularList({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesPopularList(params);
      await localDataSource.cachePopularMovies(remoteMovies);
      return Right(remoteMovies);
    } catch (e) {
      try {
        final localMovies = localDataSource.getCachedPopularMovies();
        if (localMovies.isNotEmpty) {
          return Right(localMovies);
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
  Future<Either<Failure, List<MoviesEntity>>> getMoviesTopRated({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesTopRated(params);
      await localDataSource.cacheTopRatedMovies(remoteMovies);
      return Right(remoteMovies);
    } catch (e) {
      try {
        final localMovies = localDataSource.getCachedTopRatedMovies();
        if (localMovies.isNotEmpty) {
          return Right(localMovies);
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
  Future<Either<Failure, List<MoviesEntity>>> getMoviesUpcomingList({
    required MoviesParams params,
  }) async {
    try {
      final remoteMovies = await remoteDataSource.getMoviesUpcomingList(params);
      await localDataSource.cacheUpcomingMovies(remoteMovies);
      return Right(remoteMovies);
    } catch (e) {
      try {
        final localMovies = localDataSource.getCachedUpcomingMovies();
        if (localMovies.isNotEmpty) {
          return Right(localMovies);
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
  Future<Either<Failure, List<MovieCreditEntity>>> getMovieCredits({
    required MovieParams params,
  }) async {
    try {
      final remoteCredits = await remoteDataSource.getMoviecredits(
        params: params,
      );
      await localDataSource.cacheMovieCredits(remoteCredits);
      return Right(remoteCredits);
    } catch (e) {
      try {
        final localCredits = localDataSource.getCachedMovieCredits();
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
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required MovieParams params,
  }) async {
    try {
      final remoteDetails = await remoteDataSource.getMovieDetails(
        params: params,
      );
      await localDataSource.cacheMovieDetails(remoteDetails);
      return Right(remoteDetails);
    } catch (e) {
      try {
        final localDetails = localDataSource.getCachedMovieDetails(
          params.movieId,
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
  Future<Either<Failure, List<MovieRecommendationEntity>>>
  getMovieRecommendations({required MovieParams params}) async {
    try {
      final remoteRecommendations = await remoteDataSource
          .getMoviesRecommendations(params: params);
      await localDataSource.cacheMovieRecommendations(
        params.movieId,
        remoteRecommendations,
      );
      return Right(remoteRecommendations);
    } catch (e) {
      try {
        final localRecommendations = localDataSource
            .getCachedMovieRecommendations();
        if (localRecommendations.isNotEmpty) {
          return Right(localRecommendations);
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
