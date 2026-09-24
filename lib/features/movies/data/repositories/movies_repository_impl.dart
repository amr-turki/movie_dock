import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
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
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getMoviesNowPlaying(params);
        await HiveService.cacheNowPlayingMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = HiveService.getCachedNowPlayingMovies();
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
        await HiveService.cachePopularMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = HiveService.getCachedPopularMovies();
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
        await HiveService.cacheTopRatedMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = HiveService.getCachedTopRatedMovies();
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
        await HiveService.cacheUpcomingMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localMovies = HiveService.getCachedUpcomingMovies();
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
        await HiveService.cacheMovieCredits(remoteCredits);
        return Right(remoteCredits);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localCredits = HiveService.getCachedMovieCredits();
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
        await HiveService.cacheMovieDetails(remoteDetails);
        return Right(remoteDetails);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localDetails = HiveService.getCachedMovieDetails(params.movieId);
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
        await HiveService.cacheMovieRecommendations(
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
        final localRecommendations =
            HiveService.getCachedMovieRecommendations();
        return Right(localRecommendations);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }
}
