import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';

abstract class SeriesState {}

final class GetSeriesInitial extends SeriesState {}

final class GetSeriesLoading extends SeriesState {}

final class GetSeriesSuccessfully extends SeriesState {
  final List<TvsSeriesEntity> series;

  GetSeriesSuccessfully({required this.series});
}

final class GetSeriesFailure extends SeriesState {
  final String errMessage;

  GetSeriesFailure({required this.errMessage});
}
