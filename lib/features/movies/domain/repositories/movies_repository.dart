import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<MoviesEntity>>> getMoviesNowPlaying({
    required MoviesParams params,
  });

  Future<Either<Failure, List<MoviesEntity>>> getMoviesUpcomingList({
    required MoviesParams params,
  });

  Future<Either<Failure, List<MoviesEntity>>> getMoviesTopRated({
    required MoviesParams params,
  });

  Future<Either<Failure, List<MoviesEntity>>> getMoviesPopularList({
    required MoviesParams params,
  });

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required MovieParams params,
  });

  Future<Either<Failure, List<MovieCreditEntity>>> getMovieCredits({
    required MovieParams params,
  });

  Future<Either<Failure, List<MovieRecommendationEntity>>>
  getMovieRecommendations({required MovieParams params});
}
