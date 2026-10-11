import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';

abstract class SeriesRecommendationState {}

final class GetSeriesRecommendationsInitial extends SeriesRecommendationState {}

final class GetSeriesRecommendationLoading extends SeriesRecommendationState {}

final class GetSeriesRecommendationSuccessfully
    extends SeriesRecommendationState {
  final List<TvSeriesRecommendation> series;

  GetSeriesRecommendationSuccessfully({required this.series});
}

final class GetSeriesRecommendationFailure extends SeriesRecommendationState {
  final String errMessage;

  GetSeriesRecommendationFailure({required this.errMessage});
}
