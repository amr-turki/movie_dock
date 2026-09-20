import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_dock_application/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_dock_application/features/movies/domain/usecases/get_movies.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(GetMovieDetailInitial());

  Future<void> eitherFailureOrMovieCreditCubit({required int id}) async {
    emit(GetMovieDetailsLoading());

    final details = await GetMovies(
      repository: MoviesRepositoryImpl(
        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).MovieDetails(params: MovieParams(movieId: id));

    details.fold(
      (failure) => emit(GetMovieDetailsFailure(errMessage: failure.errMessage)),
      (details) => emit(GetMovieDetailsSuccessfully(details: details)),
    );
  }
}
