import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_dock_application/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_dock_application/features/movies/domain/usecases/get_movies.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_state.dart';

class MovieCreditCubit extends Cubit<MovieCreditState> {
  MovieCreditCubit() : super(GetMovieCreditInitial());

  Future<void> eitherFailureOrMovieCredit({required int id}) async {
    emit(GetMovieCreditLoading());

    final credit = await GetMovies(
      repository: MoviesRepositoryImpl(
        localDataSource: MoviesLocalDataSourceImpl(),
        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).MovieCredits(params: MovieParams(movieId: id));

    credit.fold(
      (failure) => emit(GetMovieCreditFailure(errMessage: failure.errMessage)),
      (credit) => emit(GeMovieCreditSuccessfully(credit: credit)),
    );
  }
}
