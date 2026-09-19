import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_credits.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';
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

  Future<Either<Failure, TvSeriesDetailsEntity>> SerieDetails({
    required SeriesParams params,
  }) {
    return repository.getSerieDetails(params: params);
  }

  Future<Either<Failure, List<TvSeriesCredits>>> SerieCredits({
    required SeriesParams params,
  }) {
    return repository.getSerieCredits(params: params);
  }

  Future<Either<Failure, List<TvSeriesRecommendation>>> SerieRecommendations({
    required SeriesParams params,
  }) {
    return repository.getSerieRecommendations(params: params);
  }
}
