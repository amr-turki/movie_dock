import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:movie_dock_application/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_dock_application/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_dock_application/features/movies/domain/usecases/get_movies.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_state.dart';

class MovieRecommendationCubit extends Cubit<MovieRecommendationState> {
  MovieRecommendationCubit() : super(GetMovieRecommendationsInitial());

  Future<void> eitherFailureOrMovieRecommendation({required int id}) async {
    emit(GetMovieRecommendationLoading());

    final movies = await GetMovies(
      repository: MoviesRepositoryImpl(
        localDataSource: MoviesLocalDataSourceImpl(),

        remoteDataSource: MoviesRemoteDataSource(api: DioConsumer(dio: Dio())),
      ),
    ).MovieRecommendations(params: MovieParams(movieId: id));

    movies.fold(
      (failure) =>
          emit(GetMovieRecommendationFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetMovieRecommendationSuccessfully(movies: movies)),
    );
  }
}
