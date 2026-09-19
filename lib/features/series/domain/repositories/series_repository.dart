import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_credits.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesAiringToday();

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesOnTheAir();

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesTopRated();

  Future<Either<Failure, List<TvsSeriesEntity>>> getSeriesPopular();

  Future<Either<Failure, TvSeriesDetailsEntity>> getSerieDetails({
    required SeriesParams params,
  });

  Future<Either<Failure, List<TvSeriesCredits>>> getSerieCredits({
    required SeriesParams params,
  });

  Future<Either<Failure, List<TvSeriesRecommendation>>>
  getSerieRecommendations({required SeriesParams params});
}
