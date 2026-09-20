import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/connection/network_info.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_dock_application/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_dock_application/features/movies/domain/usecases/get_movies.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_feed/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> eitherFailureOrMoviesNowPlaying() async {
    emit(GetMoviesLoading());

    final failureOrMovies = await GetMovies(
      repository: MoviesRepositoryImpl(
        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).NowPlaying(params: MoviesParams(page: 1));

    failureOrMovies.fold(
      (failure) => emit(GetMoviesFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetMoviesSuccessfully(movies: movies)),
    );
  }

  Future<void> eitherFailureOrMoviesPopularList() async {
    emit(GetMoviesLoading());

    final failureOrMovies = await GetMovies(
      repository: MoviesRepositoryImpl(
        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).PopularList(params: MoviesParams(page: 1));

    failureOrMovies.fold(
      (failure) => emit(GetMoviesFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetMoviesSuccessfully(movies: movies)),
    );
  }

  Future<void> eitherFailureOrMoviesTopRated() async {
    emit(GetMoviesLoading());

    final failureOrMovies = await GetMovies(
      repository: MoviesRepositoryImpl(
        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).TopRated(params: MoviesParams(page: 1));

    failureOrMovies.fold(
      (failure) => emit(GetMoviesFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetMoviesSuccessfully(movies: movies)),
    );
  }

  Future<void> eitherFailureOrMoviesUpcomingList() async {
    emit(GetMoviesLoading());

    final failureOrMovies = await GetMovies(
      repository: MoviesRepositoryImpl(
        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).UpcomingList(params: MoviesParams(page: 1));

    failureOrMovies.fold(
      (failure) => emit(GetMoviesFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetMoviesSuccessfully(movies: movies)),
    );
  }
}
