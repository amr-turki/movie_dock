import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';

class TrendingCelebritiesState {}

final class TrendingCelebritiesInitial extends TrendingCelebritiesState {}

final class TrendingCelebritiesSuccessfully extends TrendingCelebritiesState {
  final List<CelebritiesEntity> TrendingCelebrities;

  TrendingCelebritiesSuccessfully({required this.TrendingCelebrities});
}

final class TrendingCelebritiesLoading extends TrendingCelebritiesState {}

final class TrendingCelebritiesFailure extends TrendingCelebritiesState {
  final String errMessage;

  TrendingCelebritiesFailure({required this.errMessage});
}
