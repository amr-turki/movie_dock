import 'package:movie_dock_application/features/series/domain/entities/tv_series_credits.dart';

abstract class SerieCastState {}

final class GetSerieCastInitial extends SerieCastState {}

final class GetSerieCastLoading extends SerieCastState {}

final class GetSerieCastSuccessfully extends SerieCastState {
  final List<TvSeriesCredits> cast;

  GetSerieCastSuccessfully({required this.cast});
}

final class GetSerieCastFailure extends SerieCastState {
  final String errMessage;

  GetSerieCastFailure({required this.errMessage});
}
