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
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/series_credit_state.dart';

class SerieCreditCubit extends Cubit<SerieCastState> {
  SerieCreditCubit() : super(GetSerieCastInitial());

  Future<void> eitherFailureOrSeriesCreditCubit({required int id}) async {
    emit(GetSerieCastLoading());

    final cast = await GetSeries(
      repository: SeriesRepositoryImpl(
        localDataSource: SeriesLocalDataSourceImpl(),

        remoteDataSource: SeriesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).SerieCredits(params: SeriesParams(seriesId: id));

    cast.fold(
      (failure) => emit(GetSerieCastFailure(errMessage: failure.errMessage)),
      (cast) => emit(GetSerieCastSuccessfully(cast: cast)),
    );
  }
}
