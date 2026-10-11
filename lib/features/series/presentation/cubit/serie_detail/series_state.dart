import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';

abstract class SerieDetailsState {}

final class GetSerieDetailsInitial extends SerieDetailsState {}

final class GetSerieDetailsLoading extends SerieDetailsState {}

final class GetSerieDetailsSuccessfully extends SerieDetailsState {
  final TvSeriesDetailsEntity serie;

  GetSerieDetailsSuccessfully({required this.serie});
}

final class GetSerieDetailsFailure extends SerieDetailsState {
  final String errMessage;

  GetSerieDetailsFailure({required this.errMessage});
}
