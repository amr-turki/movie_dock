import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/databases/api/dio_consumer.dart';
import 'package:movie_dock_application/core/search/data/datasources/search_remote_data_source.dart';
import 'package:movie_dock_application/core/search/data/repositories/search_repository_impl.dart';
import 'package:movie_dock_application/core/search/domain/usecases/get_search.dart';
import 'package:movie_dock_application/core/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;

  SearchCubit({SearchUseCase? useCase})
    : searchUseCase =
          useCase ??
          SearchUseCase(
            repository: SearchRepositoryImpl(
              remoteDataSource: SearchRemoteDataSourceImpl(
                api: DioConsumer(dio: Dio()),
              ),
            ),
          ),
      super(SearchInitial());

  void search({required String query}) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    final result = await searchUseCase.call(query: query);

    result.fold(
      (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
      (searchResults) => emit(SearchSuccessfully(searchResults: searchResults)),
    );
  }
}
