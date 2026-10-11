import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsState {}

final class GetMovieDetailInitial extends MovieDetailsState {}

final class GetMovieDetailsLoading extends MovieDetailsState {}

final class GetMovieDetailsSuccessfully extends MovieDetailsState {
  final MovieDetailsEntity details;

  GetMovieDetailsSuccessfully({required this.details});
}

final class GetMovieDetailsFailure extends MovieDetailsState {
  final String errMessage;

  GetMovieDetailsFailure({required this.errMessage});
}
