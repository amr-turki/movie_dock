import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_local_data_source.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
import 'package:movie_dock_application/features/series/data/repositories/series_repository_impl.dart';
import 'package:movie_dock_application/features/series/domain/usecases/get_series.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_feed/series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  SeriesCubit() : super(GetSeriesInitial());

  Future<void> eitherFailureOrSeriesAiringToday() async {
    emit(GetSeriesLoading());

    final series = await GetSeries(
      repository: SeriesRepositoryImpl(
        localDataSource: SeriesLocalDataSourceImpl(),

        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).getSeriesAiringToday();

    series.fold(
      (failure) => emit(GetSeriesFailure(errMessage: failure.errMessage)),
      (series) => emit(GetSeriesSuccessfully(series: series)),
    );
  }

  Future<void> eitherFailureOrSeriesOnTheAir() async {
    emit(GetSeriesLoading());

    final series = await GetSeries(
      repository: SeriesRepositoryImpl(
        localDataSource: SeriesLocalDataSourceImpl(),

        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).getSeriesOnTheAir();

    series.fold(
      (failure) => emit(GetSeriesFailure(errMessage: failure.errMessage)),
      (series) => emit(GetSeriesSuccessfully(series: series)),
    );
  }

  Future<void> eitherFailureOrSeriesPopular() async {
    emit(GetSeriesLoading());

    final series = await GetSeries(
      repository: SeriesRepositoryImpl(
        localDataSource: SeriesLocalDataSourceImpl(),

        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).getSeriesPopular();

    series.fold(
      (failure) => emit(GetSeriesFailure(errMessage: failure.errMessage)),
      (series) => emit(GetSeriesSuccessfully(series: series)),
    );
  }

  Future<void> eitherFailureOrSeriesTopRated() async {
    emit(GetSeriesLoading());

    final series = await GetSeries(
      repository: SeriesRepositoryImpl(
        localDataSource: SeriesLocalDataSourceImpl(),

        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).getSeriesTopRated();

    series.fold(
      (failure) => emit(GetSeriesFailure(errMessage: failure.errMessage)),
      (series) => emit(GetSeriesSuccessfully(series: series)),
    );
  }
}
