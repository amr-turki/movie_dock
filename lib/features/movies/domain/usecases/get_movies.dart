import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';
import 'package:movie_dock_application/features/movies/domain/repositories/movies_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';

class GetMovies {
  final MoviesRepository repository;

  GetMovies({required this.repository});

  Future<Either<Failure, List<MoviesEntity>>> NowPlaying({
    required MoviesParams params,
  }) {
    return repository.getMoviesNowPlaying(params: params);
  }

  Future<Either<Failure, List<MoviesEntity>>> PopularList({
    required MoviesParams params,
  }) {
    return repository.getMoviesPopularList(params: params);
  }

  Future<Either<Failure, List<MoviesEntity>>> TopRated({
    required MoviesParams params,
  }) {
    return repository.getMoviesTopRated(params: params);
  }

  Future<Either<Failure, List<MoviesEntity>>> UpcomingList({
    required MoviesParams params,
  }) {
    return repository.getMoviesUpcomingList(params: params);
  }

  Future<Either<Failure, MovieDetailsEntity>> MovieDetails({
    required MovieParams params,
  }) {
    return repository.getMovieDetails(params: params);
  }

  Future<Either<Failure, List<MovieCreditEntity>>> MovieCredits({
    required MovieParams params,
  }) {
    return repository.getMovieCredits(params: params);
  }

  Future<Either<Failure, List<MovieRecommendationEntity>>>
  MovieRecommendations({required MovieParams params}) {
    return repository.getMovieRecommendations(params: params);
  }
}
