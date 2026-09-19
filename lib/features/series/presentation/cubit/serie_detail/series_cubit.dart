import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/series/data/datasources/series_remote_data_source.dart';
import 'package:movie_dock_application/features/series/data/repositories/series_repository_impl.dart';
import 'package:movie_dock_application/features/series/domain/usecases/get_series.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_state.dart';

class SerieDetailsCubit extends Cubit<SerieDetailsState> {
  SerieDetailsCubit() : super(GetSerieDetailsInitial());

  Future<void> eitherFailureOrSeriesDetailsCubit({required int id}) async {
    emit(GetSerieDetailsLoading());

    final series = await GetSeries(
      repository: SeriesRepositoryImpl(
        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).SerieDetails(params: SeriesParams(seriesId: id));

    series.fold(
      (failure) => emit(GetSerieDetailsFailure(errMessage: failure.errMessage)),
      (series) => emit(GetSerieDetailsSuccessfully(serie: series)),
    );
  }
}
