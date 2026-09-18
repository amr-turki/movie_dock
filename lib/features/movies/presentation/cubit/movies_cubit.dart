import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happytech_clean_architecture/core/connection/network_info.dart';
import 'package:happytech_clean_architecture/core/databases/api/dio_consumer.dart';
import 'package:happytech_clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:happytech_clean_architecture/core/params/params.dart';
import 'package:happytech_clean_architecture/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:happytech_clean_architecture/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:happytech_clean_architecture/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:happytech_clean_architecture/features/movies/domain/usecases/get_movies.dart';
import 'package:happytech_clean_architecture/features/movies/presentation/cubit/movies_state.dart';

class moviesCubit extends Cubit<moviesState> {
  moviesCubit() : super(moviesInitial());

  eitherFailureOrmovies(int id) async {
    emit(GetmoviesLoading());
    final failureOrmovies = await Getmovies(
      repository: moviesRepositoryImpl(
        remoteDataSource: moviesRemoteDataSource(api: DioConsumer(dio: Dio())),
        localDataSource: moviesLocalDataSource(cache: CacheHelper()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).call(params: moviesParams(id: id.toString()));

    failureOrmovies.fold(
      (failure) => emit(GetmoviesFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetmoviesSuccessfully(movies: movies)),
    );
  }
}
