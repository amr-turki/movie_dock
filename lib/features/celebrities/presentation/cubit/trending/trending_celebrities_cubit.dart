import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_local_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_remote_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/repositories/celebrities_repository_impl.dart';
import 'package:movie_dock_application/features/celebrities/domain/usecases/get_trending_celebrities.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/trending/trending_celebrities_state.dart';

class TrendingCelebritiesCubit extends Cubit<TrendingCelebritiesState> {
  TrendingCelebritiesCubit() : super(TrendingCelebritiesInitial());

  eitherFailureOrTrendingCelebritiesInitial() async {
    emit(TrendingCelebritiesLoading());
    final TrendingCelebritiesInitial = await GetTrendingCelebritiesUseCase(
      repository: CelebritiesRepositoryImpl(
        localDataSource: CelebritiesLocalDataSourceImpl(),

        remoteDataSource: CelebritiesRemoteDataSource(
          api: DioConsumer(dio: Dio()),
        ),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).call();

    TrendingCelebritiesInitial.fold(
      (failure) =>
          emit(TrendingCelebritiesFailure(errMessage: failure.errMessage)),
      (TrendingCelebrities) => emit(
        TrendingCelebritiesSuccessfully(
          TrendingCelebrities: TrendingCelebrities,
        ),
      ),
    );
  }
}
