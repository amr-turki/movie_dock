import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_local_data_source.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
import 'package:movie_dock_application/features/series/data/repositories/series_repository_impl.dart';
import 'package:movie_dock_application/features/series/domain/usecases/get_series.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_state.dart';

class SeriesRecommendationCubit extends Cubit<SeriesRecommendationState> {
  SeriesRecommendationCubit() : super(GetSeriesRecommendationsInitial());

  Future<void> eitherFailureOrSeriesRecommendation({required int id}) async {
    emit(GetSeriesRecommendationLoading());

    final series = await GetSeries(
      repository: SeriesRepositoryImpl(
        localDataSource: SeriesLocalDataSourceImpl(),

        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).SerieRecommendations(params: SeriesParams(seriesId: id));

    series.fold(
      (failure) =>
          emit(GetSeriesRecommendationFailure(errMessage: failure.errMessage)),
      (series) => emit(GetSeriesRecommendationSuccessfully(series: series)),
    );
  }
}
