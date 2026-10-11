import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';

abstract class MovieRecommendationState {}

final class GetMovieRecommendationsInitial extends MovieRecommendationState {}

final class GetMovieRecommendationLoading extends MovieRecommendationState {}

final class GetMovieRecommendationSuccessfully
    extends MovieRecommendationState {
  final List<MovieRecommendationEntity> movies;

  GetMovieRecommendationSuccessfully({required this.movies});
}

final class GetMovieRecommendationFailure extends MovieRecommendationState {
  final String errMessage;

  GetMovieRecommendationFailure({required this.errMessage});
}
