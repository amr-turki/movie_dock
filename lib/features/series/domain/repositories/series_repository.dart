import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesAiringToday();

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesOnTheAir();

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesTopRated();

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesPopular();
}
