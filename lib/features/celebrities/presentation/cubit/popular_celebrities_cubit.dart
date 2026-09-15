import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_remote_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/repositories/celebrities_repository_impl.dart';
import 'package:movie_dock_application/features/celebrities/domain/usecases/get_celebrities.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular_celebrities_state.dart';

class PopularCelebritiesCubit extends Cubit<PopularCelebritiesState> {
  PopularCelebritiesCubit() : super(PopularCelebritiesInitial());

  eitherFailureOrPopularCelebritiesInitial(int id) async {
    emit(PopularCelebritiesLoading());
    final PopularCelebritiesInitial = await GetPopularCelebritiesUseCase(
      repository: CelebritiesRepositoryImpl(
        remoteDataSource: CelebritiesRemoteDataSource(
          api: DioConsumer(dio: Dio()),
        ),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).call(params: CelebritiesParams(page: id));

    PopularCelebritiesInitial.fold(
      (failure) =>
          emit(PopularCelebritiesFailure(errMessage: failure.errMessage)),
      (PopularCelebrities) => emit(
        PopularCelebritiesSuccessfully(PopularCelebrities: PopularCelebrities),
      ),
    );
  }
}
