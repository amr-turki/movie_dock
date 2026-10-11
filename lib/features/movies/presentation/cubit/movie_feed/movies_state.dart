import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';

abstract class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class GetMoviesLoading extends MoviesState {}

final class GetMoviesSuccessfully extends MoviesState {
  final List<MoviesEntity> movies;

  GetMoviesSuccessfully({required this.movies});
}

final class GetMoviesFailure extends MoviesState {
  final String errMessage;

  GetMoviesFailure({required this.errMessage});
}
