import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_local_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/datasources/celebrities_remote_data_source.dart';
import 'package:movie_dock_application/features/celebrities/data/repositories/celebrities_repository_impl.dart';
import 'package:movie_dock_application/features/celebrities/domain/usecases/get_celebrite_combined_credits.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_state.dart';

class CombinedCreditsCubit extends Cubit<CombinedCreditsState> {
  CombinedCreditsCubit() : super(CombinedCreditsInitial());

  eitherFailureOrCombinedCredits({required int id}) async {
    emit(CombinedCreditsLoading());
    final CombinedCredits = await GetCelebritieCombinedCreditssUseCase(
      repository: CelebritiesRepositoryImpl(
        localDataSource: CelebritiesLocalDataSourceImpl(),

        remoteDataSource: CelebritiesRemoteDataSource(
          api: DioConsumer(dio: Dio()),
        ),
      ),
    ).call(params: CelebritieDetailsParams(id: id));

    CombinedCredits.fold(
      (failure) => emit(CombinedCreditsFailure(errMessage: failure.errMessage)),
      (CombinedCredits) =>
          emit(CombinedCreditsSuccessfully(CombinedCredits: CombinedCredits)),
    );
  }
}
