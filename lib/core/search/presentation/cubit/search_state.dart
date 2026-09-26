import 'package:movie_dock_application/core/search/domain/entities/search_entity.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccessfully extends SearchState {
  final List<SearchEntity> searchResults;

  SearchSuccessfully({required this.searchResults});
}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure({required this.errMessage});
}
