import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';

import 'package:movie_dock_application/features/series/domain/repositories/series_repository.dart';

import '../../../../core/errors/failure.dart';

class GetSeries {
  final SeriesRepository repository;

  GetSeries({required this.repository});

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesAiringToday() {
    return repository.getSeriesAiringToday();
  }

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesOnTheAir() {
    return repository.getSeriesOnTheAir();
  }

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesTopRated() {
    return repository.getSeriesTopRated();
  }

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesPopular() {
    return repository.getSeriesPopular();
  }
}
