import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_local_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_remote_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/repositories/celebrities_repository_impl.dart';
import 'package:movie_dock_application/features/celebrities/domain/usecases/get_celebritie_details.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_state.dart';

class CelebritieDetailsCubit extends Cubit<CelebritieDetailsState> {
  CelebritieDetailsCubit() : super(CelebritieDetailsInitial());

  eitherFailureOrCelebritieDetails({required int id}) async {
    emit(CelebritieDetailsLoading());
    final CelebritieDetails = await GetCelebritieDetailsUseCase(
      repository: CelebritiesRepositoryImpl(
        localDataSource: CelebritiesLocalDataSourceImpl(),
        remoteDataSource: CelebritiesRemoteDataSource(
          api: DioConsumer(dio: Dio()),
        ),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).call(params: CelebritieDetailsParams(id: id));

    CelebritieDetails.fold(
      (failure) =>
          emit(CelebritieDetailsFailure(errMessage: failure.errMessage)),
      (CelebritieDetails) => emit(
        CelebritieDetailsSuccessfully(CelebritieDetails: CelebritieDetails),
      ),
    );
  }
}
